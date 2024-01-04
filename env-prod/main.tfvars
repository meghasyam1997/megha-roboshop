env = "prod"

components = {
  frontend = {
    name          = "frontend"
    instance_type = "t3.small"
  }
  catalogue = {
    name          = "catalogue"
    instance_type = "t3.small"
  }
  cart = {
    name          = "cart"
    instance_type = "t3.small"
  }
  user = {
    name          = "user"
    instance_type = "t3.small"
  }
  payment = {
    name          = "payment"
    instance_type = "t3.small"
  }
  shipping = {
    name          = "shipping"
    instance_type = "t3.small"
  }
  mysql = {
    name          = "mysql"
    instance_type = "t3.medium"
  }
  mongodb = {
    name          = "frontend"
    instance_type = "t3.medium"
  }
  rabbitmq = {
    name          = "rabbitmq"
    instance_type = "t3.medium"
  }
}
