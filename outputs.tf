
output "ecr_repository_url" {
  value       = module.ecs_task_definition.ecr_repository_url
  description = "URL of ECR Repository app Docker image"
}

output "cloudwatch_log_group_name" {
  value = module.ecs_task_definition.cloudwatch_log_group_name
}

output "load_balancer_arn" {
  value       = module.ecs_service.load_balancer_arn
  description = "ARN of load balancer"
}

output "load_balancer_arn_suffix" {
  value       = module.ecs_service.load_balancer_arn_suffix
  description = "ARN suffix of load balancer"
}

output "load_balancer_dns_name" {
  value = module.ecs_service.load_balancer_dns_name
}

output "load_balancer_zone_id" {
  value = module.ecs_service.load_balancer_zone_id
}

output "load_balancer_listener_arn" {
  value       = module.ecs_service.load_balancer_listener_arn
  description = "ARN of load balancer listener"
}

output "load_balancer_target_group_arn" {
  value       = module.ecs_service.load_balancer_target_group_arn
  description = "ARN of load balancer target group"
}

output "monitoring_sns_topic_arn" {
  value       = module.ecs_service.monitoring_sns_topic_arn
  description = "ARN of SNS topic that Slack forwarder lambda is listening to (only set if enable_monitoring = true)"
}

output "task_iam_role_id" {
  value       = module.ecs_task_definition.task_iam_role_id
  description = "Id of IAM role that ECS task will assume"
}

output "task_security_group_id" {
  value       = module.ecs_service.task_security_group_id
  description = "ID of Security Group for ECS Task"
}

output "lb_security_group_id" {
  value       = module.ecs_service.lb_security_group_id
  description = "ID of Security Group for load balancer"
}
