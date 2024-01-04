resource "aws_instance" "instance" {
  for_each               = var.components
  instance_type          = each.value["instance_type"]
  ami                    = data.aws_ami.ami.id
  vpc_security_group_ids = [data.aws_security_group.allow_all.id]

  tags = {
    Name = "${each.value["name"]}-${var.env}"
  }
}

resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id  = "Z0620294274OZE1BA7710"
  name     = "${each.value["name"]}-${var.env}.msdevops72.online"
  type     = "A"
  ttl      = 30
  records  = [aws_instance.instance[each.value["name"]].private_ip]
}