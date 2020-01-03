
terraform {
  required_version = ">= 0.12"
}

module "ecs_service" {
  source  = "aoggz/fargate-service/aws"
  version = "2.0.2"

  resource_prefix                           = var.resource_prefix
  ecs_cluster_id                            = var.ecs_cluster_id
  acm_certificate_domain                    = var.acm_certificate_domain
  app_domain                                = var.app_domain
  route53_hosted_zone_id                    = var.route53_hosted_zone_id
  task_count                                = var.task_count
  ecs_task_definition_arn                   = module.ecs_task_definition.task_definition_arn
  alb_internal                              = var.alb_internal
  alb_subnets_public                        = var.alb_subnets_public
  alb_subnets_private                       = var.alb_subnets_private
  alb_listener_default_action               = var.alb_listener_default_action
  alb_listener_default_redirect_host        = var.alb_listener_default_redirect_host
  alb_listener_default_redirect_port        = var.alb_listener_default_redirect_port
  alb_listener_default_redirect_protocol    = var.alb_listener_default_redirect_protocol
  alb_listener_default_redirect_status_code = var.alb_listener_default_redirect_status_code
  vpc_id                                    = var.vpc_id
  account_name                              = var.account_name
}

module "ecs_task_definition" {
  source  = "aoggz/web-fargate-task-definition/aws"
  version = "0.1.1"

  resource_prefix                        = var.resource_prefix
  log_retention_in_days                  = var.log_retention_in_days
  app_port                               = var.app_port
  web_image                              = var.web_image
  web_version                            = var.web_version
  web_cpu                                = var.web_cpu
  web_memory                             = var.web_memory
  account_name                           = var.account_name
  web_environment_variables              = var.web_environment_variables
  reverse_proxy_version                  = var.reverse_proxy_version
  app_domain                             = var.app_domain
  reverse_proxy_cpu                      = var.reverse_proxy_cpu
  reverse_proxy_memory                   = var.reverse_proxy_memory
  reverse_proxy_timeout                  = var.reverse_proxy_timeout
  reverse_proxy_cert_country             = var.reverse_proxy_cert_country
  reverse_proxy_cert_state               = var.reverse_proxy_cert_state
  reverse_proxy_cert_locality            = var.reverse_proxy_cert_locality
  reverse_proxy_cert_organization        = var.reverse_proxy_cert_organization
  reverse_proxy_cert_organizational_unit = var.reverse_proxy_cert_organizational_unit
  reverse_proxy_cert_email_address       = var.reverse_proxy_cert_email_address
  xray_cpu                               = var.xray_cpu
  xray_memory                            = var.xray_memory
}
