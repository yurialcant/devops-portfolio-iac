output "lb_dns_name" {
  description = "Nome DNS do Application Load Balancer"
  value       = aws_lb.app_lb.dns_name
}

output "lb_arn" {
  description = "ARN do Application Load Balancer"
  value       = aws_lb.app_lb.arn
}

output "target_group_arn" {
  description = "ARN do Target Group"
  value       = aws_lb_target_group.app_tg.arn
}