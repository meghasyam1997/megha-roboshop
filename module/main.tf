resource "aws_instance" "instance" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.ami.id
  vpc_security_group_ids = [data.aws_security_group.allow_all.id]

  tags = {
    Name = local.name
  }
}
resource "null_resource" "provisioner" {
  count = var.provisioner ? 1 : 0
  depends_on = [aws_instance.instance , aws_route53_record.records]
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "centos"
      password = "DevOps321"
      host = aws_instance.instance.private_ip
    }

    inline = [
      "rm -rf roboshop-shell",
      "git clone https://github.com/meghasyam1997/roboshop-shell.git ",
      "cd roboshop-shell",
      "sudo bash ${var.component_name}.sh ${var.password}"
    ]
  }
}

resource "aws_route53_record" "records" {
  zone_id  = "Z0620294274OZE1BA7710"
  name     = "${var.instance_type}-${var.env}.msdevops72.online"
  type     = "A"
  ttl      = 30
  records  = [aws_instance.instance.private_ip]
}