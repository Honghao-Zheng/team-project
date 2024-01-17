resource "aws_lb" "project" {
  name               = "project-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.aws_security_group_ingress]
  subnets            = [for subnet in var.public_subnets : subnet]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "project" {
  load_balancer_arn = aws_lb.project.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.project.arn
  }
}

resource "aws_lb_target_group" "project" {
  name             = "team-project-load-balancer"
  port             = 3000
  protocol         = "HTTP"
  protocol_version = "HTTP1"
  health_check {
    path     = "/api/status/health-check"
    protocol = "HTTP"
  }
  vpc_id = var.vpc_id
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.project.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.project.arn
  }
  condition {
    path_pattern {
      values = ["/api/*"]
    }
  }

}
