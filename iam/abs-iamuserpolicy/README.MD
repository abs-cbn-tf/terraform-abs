Terraform IAM User and Policy Configuration
This Terraform configuration creates an IAM user and attaches IAM policies to the user. It also provides an output value for the IAM user name.

Prerequisites
Before using this Terraform module, ensure you have the following prerequisites in place:

Valid AWS credentials with appropriate permissions to create IAM resources.
Terraform installed on your local machine or the desired execution environment.
Usage
Follow the steps below to use this Terraform configuration:

Clone the repository and navigate to the project directory.

Open the main.tf file and update the following variables as per your requirements:

var.iam_user_name: The desired IAM user name.
var.iam_policies: A list of IAM policies to attach to the user. Each policy should include the following attributes:
name: The name of the policy.
description: The description of the policy.
policy: The policy document in JSON format.

Optionally, you can customize the IAM policy attachment process by modifying the aws_iam_user_policy_attachment resource block.
