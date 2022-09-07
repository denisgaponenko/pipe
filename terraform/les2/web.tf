resource "yandex_compute_instance" "vm-2" {
  name = "kolopo2"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd89ovh4ticpo40dkbvd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }
  metadata = {
    user-data = "${file("~/terraform/les1/meta.yml")}"
  }
}
