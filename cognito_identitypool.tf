module "cognito-identity-pool" {
  source                           = "corpit-consulting-public/cognito-identity-pool-mod/aws"
  version                          = "v2.0.0"
  identity_pool_name               = "terraform_cognito_identitypool"
  allow_unauthenticated_identities = true
}