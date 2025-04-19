resource "aws_lb" "app_lb" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false # Ajuste conforme necessário

  tags = merge({
    Name = "${var.name}-alb"
  }, var.tags)
}

resource "aws_lb_target_group" "app_tg" {
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id
  health_check {
    path     = var.health_check_path
    protocol = var.health_check_protocol
    port     = var.health_check_port
    matcher  = var.health_check_matcher
    interval = var.health_check_interval
    timeout  = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = merge({
    Name = "${var.name}-tg"
  }, var.tags)
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = var.http_listener_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

# Listener para HTTPS
# resource "aws_lb_listener" "https_listener" {
#   load_balancer_arn = aws_lb.app_lb.arn
#   port              = var.https_listener_port
#   protocol          = "HTTPS"
#   ssl_policy        = var.ssl_policy
#   certificate_arn   = var.certificate_arn
#
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.app_tg.arn
#   }
# }

resource "aws_lb_target_group_attachment" "app_attachment" {
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = var.instance_id
  port             = var.instance_port
}