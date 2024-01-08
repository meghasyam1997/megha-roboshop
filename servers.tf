module "database_servers" {
  source = "./module"

  for_each       = var.database_servers
  component_name = each.value["name"]
  env            = var.env
  instance_type  = each.value["instance_type"]
  password       = lookup(each.value, "password", "null" )
  app_type       = "db"
}

module "app_servers" {
  depends_on = [module.database_servers]
  source     = "./module"

  for_each       = var.app_servers
  component_name = each.value["name"]
  env            = var.env
  instance_type  = each.value["instance_type"]
  password       = lookup(each.value, "password", "null" )
  app_type       = "app"
}

