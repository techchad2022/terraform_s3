# //////////////////////////////////
# PROVIDER
# //////////////////////////////////
provider "aws" {
    alias = "default"
    profile = var.profile
    region =  var.region
}

provider "aws" {
  alias = "replica"
  region = var.region1
}