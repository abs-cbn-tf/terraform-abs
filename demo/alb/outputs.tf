
output "push_web_target_group_arn" {
  value = module.push_web_alb.target_group_arn
}

output "ent_web_target_group_arn" {
  value = module.ent_web_alb.target_group_arn
}
