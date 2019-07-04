output "machine_hostname" {
  depends_on = [
    azurerm_virtual_machine_data_disk_attachment.disk_data,
    azurerm_virtual_machine_data_disk_attachment.disk_log,
    azurerm_virtual_machine_data_disk_attachment.disk_shared,
  ]
  value = "${var.machine_name}"
}

output "luns_data" {
  value = "/dev/disk/azure/scsi1/lun${azurerm_virtual_machine_data_disk_attachment.disk_data[*].lun}"
}

output "luns_log" {
  value = "/dev/disk/azure/scsi1/lun${azurerm_virtual_machine_data_disk_attachment.disk_log[*].lun}"
}

output "luns_shared" {
  value = "/dev/disk/azure/scsi1/lun${azurerm_virtual_machine_data_disk_attachment.disk_shared[*].lun}"
}
