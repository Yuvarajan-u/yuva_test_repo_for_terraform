resource "aws_ebs_volume" "myebs" {
availability_zone = aws_instance.myvm1.availability_zone
size = 5
type = "gp2"
tags = {
Name = "disk-for-vm1"
}
}

resource "aws_volume_attachment" "ebs_attach" {
device_name = "/dev/sdh"
volume_id = aws_ebs_volume.myebs.id
instance_id = aws_instance.myvm1.id
}
