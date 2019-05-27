#Define Variables manually

$varSubs = "Techedge-Test"		#Name of the subscription
$varRGna = "Automation01"		#Name of the resource group
$varVMold = "vm-sles03"			#Name of the old VM
$varVMnew = "vm-sles04"			#Name of the new VM

Write-Host "Creating VM $($varVMnew) from VM $($varVMold)." -ForegroundColor DarkGray

# Set subscription Context
Write-Host "Setting context for subscription $($varSubs)." -ForegroundColor DarkGray
$Subscription = Get-AzSubscription -SubscriptionName $varSubs
Set-AzContext -Subscription $Subscription.Id

#Set local variables

$vmOld = Get-AzVM -ResourceGroupName $varRGna -Name $varVMold
$location = $vmOld.Location
$timestamp = Get-Date -f yyyy-MM-dd_HH_mm

#Snapshot of OS disk

Write-Host "Creating snapshot and new disk from OS disk of origin VM $($varVMold)." -ForegroundColor DarkGray

$snapshotNameOS = $vmOld.Name +"-"+ $timestamp 
$snapshotConfOS = New-AzSnapshotConfig -SourceUri $vmOld.StorageProfile.OsDisk.ManagedDisk.Id -Location $location -CreateOption copy -SkuName Standard_LRS
$snapshotOS = New-AzSnapshot -Snapshot $snapshotConfOS -SnapshotName $snapshotNameOS -ResourceGroupName $varRGna

#Create new VM OS disk from snapshot

$diskNameOS = $varVMnew +"-OS"
$diskTypeOS = $vmOld.StorageProfile.OsDisk.OsType
$diskIdOS = Get-AzDisk -ResourceGroupName $varRGna -DiskName $vmOld.StorageProfile.OsDisk.Name
$diskSkuOS = $diskIdOS.Sku.Name
$diskConfOS = New-AzDiskConfig -Location $location -SourceResourceId $snapshotOS.Id -CreateOption Copy -SkuName $diskSkuOS
$diskOS = New-AzDisk -Disk $diskConfOS -ResourceGroupName $varRGna -DiskName $diskNameOS

#Create new VM config

Write-Host "Creating new VM config of new VM $($varVMnew)." -ForegroundColor DarkGray

$vmNew = New-AzVMConfig -VMName $varVMnew -VMSize $vmOld.HardwareProfile.VmSize

if($diskTypeOS -eq "Linux") {
    # Linux option
    $vmNew = Set-AzVMOSDisk -VM $vmNew -ManagedDiskId $diskOS.Id -CreateOption Attach -Caching $vmOld.StorageProfile.OsDisk.Caching -Linux
}
else {
    # Windows option
    $vmNew = Set-AzVMOSDisk -VM $vmNew -ManagedDiskId $diskOS.Id -CreateOption Attach -Caching $vmOld.StorageProfile.OsDisk.Caching -Windows
}

$nicOld = Get-AzNetworkInterface -Name $vmOld.NetworkProfile.NetworkInterfaces[0].Id.Split("/")[8] -ResourceGroupName $varRGna
$nicNew = New-AzNetworkInterface -Name ($varVMnew.ToLower()+'-nic') -ResourceGroupName $varRGna -Location $location -SubnetId $nicOld.IpConfigurations[0].Subnet.Id
$vmNew = Add-AzVMNetworkInterface -VM $vmNew -Id $nicNew.Id

#Condition when there's at least one data disk
if($vmOld.StorageProfile.DataDisks.Count -ge 1) {
	#Loop for every data disk
	for($i=0; $i -le $vmOld.StorageProfile.DataDisks.Count - 1; $i++){

        Write-Host "Creating Snapshot of Data Disk $($vmOld.StorageProfile.DataDisks[$i].Name) and attaching a copy to the VM $($varVMnew)." -ForegroundColor DarkGray

		#Snapshot name of data disk

		$snapshotNameData = $vmOld.StorageProfile.DataDisks[$i].Name +"-"+ $timestamp 
		$snapshotConfData =  New-AzSnapshotConfig -SourceUri $vmOld.StorageProfile.DataDisks[$i].ManagedDisk.Id -Location $location -CreateOption copy -SkuName Standard_LRS
		$snapshotData = New-AzSnapshot -Snapshot $snapshotConfData -SnapshotName $snapshotNameData -ResourceGroupName $varRGna
        
        #Create new disk from snapshot

        $diskNameData = $varVMnew +"-"+ $vmOld.StorageProfile.DataDisks[$i].Lun
        $diskConfData = New-AzDiskConfig -Location $location -SourceResourceId $snapshotData.Id -CreateOption Copy -SkuName $vmOld.StorageProfile.DataDisks[$i].ManagedDisk.StorageAccountType
        $diskData = New-AzDisk -Disk $diskConfData -ResourceGroupName $varRGna -DiskName $diskNameData

        #Attach new disk to VM

        if($vmOld.StorageProfile.DataDisks[$i].WriteAcceleratorEnabled) {
            $vmNew = Add-AzVMDataDisk -CreateOption Attach -VM $vmNew -Lun $vmOld.StorageProfile.DataDisks[$i].Lun -ManagedDiskId $diskData.Id -Caching $vmOld.StorageProfile.DataDisks[$i].Caching -WriteAccelerator
        }
        else {
            $vmNew = Add-AzVMDataDisk -CreateOption Attach -VM $vmNew -Lun $vmOld.StorageProfile.DataDisks[$i].Lun -ManagedDiskId $diskData.Id -Caching $vmOld.StorageProfile.DataDisks[$i].Caching
        }
        Write-Host "Disk $($diskNameData) attached to $($varVMnew) as Lun $($vmOld.StorageProfile.DataDisks[$i].Lun)." -ForegroundColor DarkGray
	}
}
else {
		Write-Host "VM $($vmOld.Name) does not have any data disks." -ForegroundColor DarkGray
}

#Create the virtual machine
Write-Host "Instantiating VM $($varVMnew)." -ForegroundColor DarkGray
$vmNewInst = New-AzVM -VM $vmNew -ResourceGroupName $varRGna -Location $location

if($vmNewInst.IsSuccessStatusCode) {
    Write-Host "VM $($varVMnew) creation successful!" -ForegroundColor Green
}
else {
    Write-Host "VM $($varVMnew) creation unsuccessful! $($vmNewInst.ReasonPhrase)" -ForegroundColor Red
}
