locals {
  // Management resources
  configure_management_resources = {
    settings = {
      log_analytics = {
        enabled = true
      }
      security_center = {
        config = {
          email_security_contact = var.management_security_contact_email
        }
        enabled = true
      }
    }
    tags = null
  }
}