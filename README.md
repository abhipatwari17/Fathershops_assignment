# Fathershops_assignment

Terraform State Management and Infrastructure Deployment
Terraform State Management:
Backend for Terraform State Management (AWS S3 &amp; DynamoDB):
To manage Terraform state and ensure locking, we utilize AWS services, namely Amazon S3 for state
storage and DynamoDB for state locking. This combination offers a robust and reliable solution for
keeping track of our infrastructures configuration.

Steps for Terraform State Management:

Navigate to the &#39;backend&#39; folder, where we have centralized the configuration for state
management.

The following commands are essential for ensuring smooth state management:
terraform fmt: This command is used to automatically format Terraform files for consistency. It
ensures that the code is clean and easy to read, following industry best practices.

terraform init: This initializes the necessary providers and modules, ensuring that Terraform is set up
to interact with the target infrastructure.

terraform validate: The validate command checks the Terraform configuration for correctness and
ensures that all necessary variables and resources are defined correctly.

terraform plan: Before making any changes to the infrastructure, we run the plan command to
preview what will be created, modified, or deleted. This step helps us understand the potential
impact of our changes.

terraform apply: Once the plan is reviewed and approved, we proceed with the apply command to
create, modify, or delete infrastructure resources. This is the step where the actual changes are
made to the infrastructure.

terraform destroy: In cases where the infrastructure is no longer needed or requires
decommissioning, the destroy command is used to safely tear down the entire environment.



Infrastructure Deployment:
Our Infrastructure Components:
Our infrastructure deployment consists of various AWS services that are crucial to our operations.
These include:
Virtual Private Cloud (VPC): The VPC serves as the foundation of our network, providing isolation and
security for our resources. It defines the private address space and subnets for our infrastructure.
Identity and Access Management (IAM): IAM enables us to manage user access to AWS services
securely. We create IAM roles with the necessary permissions to interact with AWS resources.

Security Groups (SG): Security groups act as virtual firewalls for our instances. They control inbound
and outbound traffic, ensuring the security and integrity of our infrastructure.

ElastiCache (Memcached): ElastiCache with Memcached is employed for PHP session data
management for our WordPress sites. It enhances the performance and scalability of our
applications.
Relational Database Service (RDS): We utilize RDS to host the databases for our WordPress websites.
RDS offers a managed and scalable database solution with built-in backups and maintenance
capabilities.
Elastic Kubernetes Service (EKS): EKS is our choice for orchestrating and managing containers. It
provides a scalable and reliable platform for deploying our applications using Kubernetes.

WordPress Websites: Our WordPress sites are hosted on EC2 instances. We customize these
instances to meet the specific needs of our applications.

 Encrypt SSL Certificates: We automate the process of obtaining SSL certificates from Lets
Encrypt for each WordPress website, ensuring the security and encryption of our web traffic. These
certificates also come with automated renewal capabilities.

Steps for Infrastructure Deployment:
To initiate the infrastructure deployment, please remain in the current folder where the main
Terraform configuration files are located.

Execute the following commands to ensure a successful deployment:

terraform fmt: This command ensures that Terraform files are consistently formatted, making them
easy to read and maintain.
terraform init: Initialize the required providers and modules to establish the foundation for our
infrastructure.
terraform validate: Validate the Terraform files to confirm that they are accurate and well-
structured.
terraform plan: Review the output of this command to understand the expected changes to
resources. It provides insights into what will be created, modified, or deleted in the infrastructure.

terraform apply: This command is the execution phase. It creates, modifies, or deletes infrastructure
resources based on the defined Terraform configuration.

terraform destroy: When it becomes necessary to decommission the infrastructure, the destroy
command allows for the safe and controlled removal of all resources.
