module "cognito_user_pool" {
  source  = "mineiros-io/cognito-user-pool/aws"
  version = "~> 0.9.0"

  name = "terraform_userpool"

  # We allow the public to create user profiles
  allow_admin_create_user_only = false

  enable_username_case_sensitivity = false
  advanced_security_mode           = "ENFORCED"

  alias_attributes = [
    "email",
    "phone_number",
    "preferred_username",
  ]

  auto_verified_attributes = [
    "email"
  ]

  # If invited by an admin
  invite_email_subject = "You've been invited to Mineiros.io"
  invite_email_message = "Hi {username}, your temporary password is '{####}'."
  invite_sms_message   = "Hi {username}, your temporary password is '{####}'."

  default_email_option  = "CONFIRM_WITH_LINK"
  email_subject_by_link = "Your Verification Link"
  email_message_by_link = "Please click the link below to verify your email address. {##Verify Email##}."
  sms_message           = "Your verification code is {####}."

  challenge_required_on_new_device = true
  user_device_tracking             = "USER_OPT_IN"

  # These paramters can be used to configure SES for emails
  # ...

  # Require MFA
  mfa_configuration        = "ON"
  allow_software_mfa_token = true

  password_minimum_length    = 5
  password_require_lowercase = true
  password_require_numbers   = true
  password_require_uppercase = true
  password_require_symbols   = true

  temporary_password_validity_days = 3

  schema_attributes = [
    {
      name       = "email", 
      type       = "String"
      required   = true
      min_length = 11
      max_length = 2048
    },
    
  ]

  clients = [
    {
      name                 = "android-mobile-client"
      read_attributes      = ["email", "email_verified", "preferred_username"]
      allowed_oauth_scopes = ["email", "openid"]
      allowed_oauth_flows  = ["implicit"]
      callback_urls        = ["https://mineiros.io/callback", "https://mineiros.io/anothercallback"]
      default_redirect_uri = "https://mineiros.io/callback"
      generate_secret      = true
    }
  ]

  tags = {
    name = "terraform"
    environment= "prod"
  }
}
