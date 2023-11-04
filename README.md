# Terraform-project2
# Jenkins Server Deployment on AWS EC2 with Terraform

This repository contains the code and documentation to automate the deployment of a Jenkins server on an Amazon Web Services (AWS) EC2 instance using Terraform. The goal of this project is to set up a Jenkins server that is accessible via the internet on port 80, with SSH access, within a Virtual Private Cloud (VPC).

## Main Requirements

To achieve the objectives of this project, the following requirements must be met:

1. The Jenkins server must be deployed on an AWS EC2 instance.
2. The EC2 instance should be accessible via the internet on port 80.
3. The EC2 instance should allow SSH access.
4. Terraform is used to implement the installation.

## Project Components

The project is structured into the following components:

1. **VPC Creation**: Terraform code to create the Virtual Private Cloud (VPC) where the Jenkins server will be deployed.

2. **Internet Gateway**: Creation of an Internet Gateway and its attachment to the VPC using a Route Table, ensuring internet connectivity.

3. **Public Subnet**: Creation of a Public Subnet and association with the Route Table, allowing the EC2 instance to have a public IP address.

4. **Security Group**: Definition of a Security Group for the EC2 Instance to manage inbound and outbound traffic effectively.

5. **Jenkins Installation Script**: A script that automates the installation of Jenkins on the EC2 Instance.

6. **EC2 Instance Creation**: Terraform code to create the EC2 Instance, attach an Elastic IP for internet access, and associate a Key Pair for SSH access.

7. **Verification**: Steps and instructions to verify that the deployment is successful, ensuring that the Jenkins server is up and running.

## Getting Started

To get started with this project, follow these steps:

1. Clone this repository to your local machine.

2. Review and customize the Terraform code to match your requirements, such as instance type, security group rules, and other parameters.

3. Execute the Terraform scripts to create the infrastructure and deploy Jenkins:

   ```bash
   terraform init
   terraform apply
   ```

4. Follow the verification steps in the README to ensure that Jenkins is functioning correctly.

## Contribution

We welcome contributions from the community to enhance and improve this project. If you have any ideas, bug fixes, or feature suggestions, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

Thank you for using and contributing to this Jenkins server deployment project. If you encounter any issues or have questions, please don't hesitate to reach out to us. Happy automating with Jenkins on AWS!
