output "vpc_id" {
    value = module.vpc.vpc_id
}

output "public_subnet_az1_id" {
    value = module.vpc.public_subnet_az1_id
}


output "public_subnet_az2_id" {
    value = module.vpc.public_subnet_az2_id
}


#output "private_subnet_az1_id" {
#    value = aws_subnet.private_subnet_az1.id
#}

#output "private_subnet_az2_id" {
#    value = aws_subnet.private_subnet_az2.id
#}



output "private_app_subnet_az1_id" {
    value = module.vpc.private_app_subnet_az1_id
}

output "private_app_subnet_az2_id" {
    value = module.vpc.private_app_subnet_az2_id
}


output "private_data_subnet_az1_id" {
    value = module.vpc.private_data_subnet_az1_id
}


output "private_data_subnet_az2_id" {
    value = module.vpc.private_data_subnet_az2_id
}
