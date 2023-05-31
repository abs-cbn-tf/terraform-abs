**Modify the Terraform code in main.tf with your desired configuration details:**


AWS provider configuration: Replace the region value with your desired AWS region and configure the appropriate profile.

KMS key resource configuration: Adjust the count value based on the number of KMS keys you want to create.

KMS key attributes: Replace the description and deletion_window_in_days values with your desired configuration.

Output configuration: Modify the output value based on your needs.



**Resource Inputs**

The resource inputs are defined within the main.tf file and can be modified according to your requirements. Some of the key inputs include:

>description: The description of the KMS key.

>deletion_window_in_days: The number of days the KMS key is retained before it is deleted.

> tags: Additional tags to assign to the KMS key.

**Outputs**

>The outputs section in main.tf defines the output value for the KMS key ARNs. Modify the output configuration as needed.

Below Components can be created: 

**KMS** : Creates KMS Key, Delete the KMS Key, Update the Deletion window and Create multiple kms key

![image](https://github.com/abs-cbn-tf/terraform-abs/assets/133660640/9f29da97-3481-4b92-bdbc-196f0d0f0ea0)

