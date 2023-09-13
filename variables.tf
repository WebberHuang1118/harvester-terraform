
variable "harvester_kubeconfig_path" {
  description = "Harvester cluster Kubeconfig file name with full path"
  type        = string
  default = "/home/webber/.kube/config"
}

variable "vm_data" {

  description = "Virtual machine data"

  type = object({
    name = string
    hostname = string
    namespace = string
    description = string
    tags = map(string)


    cpus = number
    memory = string

    disks = list (object({
      name = string
      size = string
      boot_order = number   
    }))

  })

  default = {
    name        = "opensuse-dev"
    hostname    = "opensuse-dev"
    namespace   = "default"
    description = "openSUSE test virtual machine"
    tags        = {"ssh-user"="opensuse"}
    cpus        = 2
    memory      = "2Gi"
    disks = [
        {
            name = "rootdisk"
            size = "40Gi"
            boot_order = 1
        },
        {
            name = "emptydisk"
            size = "10Gi"
            boot_order = 2
        }        
    ]
  } 
}

variable "vm_network" {
  description = "VLAN for virtual machine service interfaces"
  type = object({
    vlanid = string
    namespace = string
  })
  default = {
    #Remember, I'm using a value here because we already had a vlan I wanted to use. If not you'd have to create one
    vlanid = "mgmt-vlan"
    namespace = "default"
  }
}

variable "os_image" {
  description = "OS image for virtual machines"
  type = object({
    name = string
    namespace = string
    display_name = string
    description = string
    source_type = string
    url = string
    tags = map(string)
  })  
  default = {
    name = "ubuntu-bionic-123456789012345678901234567890123456789012345678901234567890"
    namespace = "default"
    display_name = "Ubuntu Bionic"
    description = ""
    source_type = "download"
    url = "https://cloud-images.ubuntu.com/bionic/20230607/bionic-server-cloudimg-amd64.img"
    tags = {"format"= "qcow2","qemu_gest_agent_enabled"="true"}
  }   
}