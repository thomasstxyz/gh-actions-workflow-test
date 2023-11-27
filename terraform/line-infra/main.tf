resource "random_string" "random_string" {
  keepers = {
    first = "${timestamp()}"
  }     
  length = 4
  numeric = false
  special = false
  upper = false
}

resource "exoscale_iam_role" "my_role" {
  name = "thomassttest321"
  description = "Example role"
  editable = true

  policy = {
    default_service_strategy = "deny"
    services = {
      sos = {
        type = "allow"
      }
    }
  }

}

resource "exoscale_iam_api_key" "my_api_key" {
  name = "thomassttest321-${random_string.random_string.result}"
  role_id = exoscale_iam_role.my_role.id
}