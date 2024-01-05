env = "dev"

app_servers = {

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
    password      = "roboshop123"
  }
  shipping = {
    name          = "shipping"
    instance_type = "t3.small"
    password      = "RoboShop@1"
  }

}

database_servers = {

  mysql = {
    name          = "mysql"
    instance_type = "t3.medium"
    password      = "RoboShop@1"
  }
  mongodb = {
    name          = "frontend"
    instance_type = "t3.medium"
  }
  rabbitmq = {
    name          = "rabbitmq"
    instance_type = "t3.medium"
    password      = "roboshop123"
  }
  redis = {
    name          = "redis"
    instance_type = "t3.medium"
  }

}
