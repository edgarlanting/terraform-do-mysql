variable "ssh_fingerprint" {}
variable "do_token" {}
variable "default_size" { default = "512mb" }

provider "digitalocean" {
    token = "${var.do_token}"
}

resource "digitalocean_ssh_key" "mysql-ssh-key" {
     name = "mysql-ssh-key"
     public_key = "${file("./files/id_rsa.pub")}"
}

resource "digitalocean_droplet" "mysql-01" {
    image = "ubuntu-14-04-x64"
    name = "mysql-01"
    region = "ams2"
    size = "${var.default_size}"
    ssh_keys = [ "${var.ssh_fingerprint}" ]
    depends_on = [ "digitalocean_ssh_key.mysql-ssh-key" ]
}

resource "digitalocean_droplet" "mysql-02" {
    image = "ubuntu-14-04-x64"
    name = "mysql-02"
    region = "ams2"
    size = "512mb"
    ssh_keys = [ "${var.ssh_fingerprint}" ]
    depends_on = [ "digitalocean_ssh_key.mysql-ssh-key" ]
}

resource "digitalocean_droplet" "mysql-03" {
    image = "ubuntu-14-04-x64"
    name = "mysql-03"
    region = "ams2"
    size = "${var.default_size}"
    ssh_keys = [ "${var.ssh_fingerprint}" ]
    depends_on = [ "digitalocean_ssh_key.mysql-ssh-key" ]
}
