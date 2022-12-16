resource "scaleway_instance_ip" "public_ip1" {
  project_id = var.project_id
}

resource "scaleway_instance_ip" "public_ip2" {
  project_id = var.project_id
}

resource "scaleway_instance_server" "web1" {
  name = "${local.team}-web1"

  project_id = var.project_id
  type       = "DEV1-L"
  image      = "debian_bullseye"

  tags = ["front", "web"]

  ip_id = scaleway_instance_ip.public_ip1.id

  #additional_volume_ids = [scaleway_instance_volume.data.id]

  root_volume {
    # The local storage of a DEV1-L instance is 80 GB, subtract 30 GB from the additional l_ssd volume, then the root volume needs to be 50 GB.
    size_in_gb = 50
  }

  security_group_id = scaleway_instance_security_group.sg-www.id

  #user_data                   = file("../Scripts/instance_init1.sh")

  user_data = {
    name        = "initscript"
    cloud-init = file("${path.module}/init_instance.sh")
    #cloud-init = file("${path.module}/deploy-wp")
  }


}

resource "scaleway_instance_server" "web2" {
  name = "${local.team}-web2"

  project_id = var.project_id
  type       = "DEV1-L"
  image      = "debian_bullseye"

  tags = ["front", "web"]

  ip_id = scaleway_instance_ip.public_ip2.id

  #additional_volume_ids = [scaleway_instance_volume.data.id]

  root_volume {
    # The local storage of a DEV1-L instance is 80 GB, subtract 30 GB from the additional l_ssd volume, then the root volume needs to be 50 GB.
    size_in_gb = 50
  }

  security_group_id = scaleway_instance_security_group.sg-www.id
}



output "web1_ip" {
  value = "${scaleway_instance_server.web1.public_ip}"
}

output "web2_ip" {
  value = "${scaleway_instance_server.web2.public_ip}"
}
