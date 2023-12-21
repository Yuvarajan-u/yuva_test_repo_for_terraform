resource "null_resource" "test1" {
 triggers = {
  always_run = "${timestamp()}"
 }

connection {
  type = "ssh"
  user = "ubuntu"
  host = aws_instance.myvm2.public_ip
  private_key = file("~/testkey1.pem")
  }

provisioner "remote-exec" {
  inline = [
  "sudo systemctl start apache2"
  ]
}
}

