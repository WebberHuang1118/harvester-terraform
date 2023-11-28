## Image to be created in Harvester ##
resource "harvester_image" "os_image1" {
  name         = var.os_image1.name
  namespace    = var.os_image1.namespace
  display_name = var.os_image1.display_name
  source_type  = var.os_image1.source_type
  url          = var.os_image1.url
  tags         = var.os_image1.tags
}

resource "harvester_image" "os_image2" {
  name         = var.os_image2.name
  namespace    = var.os_image2.namespace
  display_name = var.os_image2.display_name
  source_type  = var.os_image2.source_type
  url          = var.os_image2.url
  tags         = var.os_image2.tags
}

