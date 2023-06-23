data "terraform_remote_state" "ecs_module" {
  backend = "local"

  config = {
    path = "/Users/ronelmigsjordaperez/Documents/terraform-abs/ManagedServices/ECS/terraform.tfstate"
  }
}
#------------------------------------------------------------------------------
# AWS Auto Scaling - CloudWatch Alarm CPU High
#------------------------------------------------------------------------------
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  depends_on          = [data.terraform_remote_state.ecs_module]
  alarm_name          = "${data.terraform_remote_state.ecs_module.outputs.service_name}-cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 120
  statistic           = "Maximum"
  threshold           = 70
  dimensions = {
    ClusterName = data.terraform_remote_state.ecs_module.outputs.cluster_arn
    ServiceName = data.terraform_remote_state.ecs_module.outputs.service_name
  }
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy.arn]

  # tags = var.tags
}

#------------------------------------------------------------------------------
# AWS Auto Scaling - CloudWatch Alarm CPU Low
#------------------------------------------------------------------------------
resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  depends_on          = [data.terraform_remote_state.ecs_module]
  alarm_name          = "${data.terraform_remote_state.ecs_module.outputs.service_name}-cpu-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 120
  statistic           = "Average"
  threshold           = 30
  dimensions = {
    ClusterName = data.terraform_remote_state.ecs_module.outputs.cluster_arn
    ServiceName = data.terraform_remote_state.ecs_module.outputs.service_name
  }
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy.arn]

  # tags = var.tags
}

#------------------------------------------------------------------------------
# AWS Auto Scaling - Scaling Up Policy
#------------------------------------------------------------------------------
resource "aws_appautoscaling_policy" "scale_up_policy" {

  name               = "${data.terraform_remote_state.ecs_module.outputs.service_name}-scale-up-policy"
  depends_on         = [aws_appautoscaling_target.scale_target, data.terraform_remote_state.ecs_module]
  service_namespace  = "ecs"
  resource_id        = "service/${data.terraform_remote_state.ecs_module.outputs.cluster_arn}/${data.terraform_remote_state.ecs_module.outputs.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 300
    metric_aggregation_type = "Maximum"
    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }
}

#------------------------------------------------------------------------------
# AWS Auto Scaling - Scaling Down Policy
#------------------------------------------------------------------------------
resource "aws_appautoscaling_policy" "scale_down_policy" {
  name               = "${data.terraform_remote_state.ecs_module.outputs.service_name}-scale-down-policy"
  depends_on         = [aws_appautoscaling_target.scale_target, data.terraform_remote_state.ecs_module]
  service_namespace  = "ecs"
  resource_id        = "service/${data.terraform_remote_state.ecs_module.outputs.cluster_arn}/${data.terraform_remote_state.ecs_module.outputs.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 300
    metric_aggregation_type = "Maximum"
    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
}

#------------------------------------------------------------------------------
# AWS Auto Scaling - Scaling Target
#------------------------------------------------------------------------------
resource "aws_appautoscaling_target" "scale_target" {
  depends_on         = [data.terraform_remote_state.ecs_module]
  service_namespace  = "ecs"
  resource_id        = "service/${data.terraform_remote_state.ecs_module.outputs.cluster_arn}/${data.terraform_remote_state.ecs_module.outputs.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = 1
  max_capacity       = 2
}
