# Create Kubernetes <p align="right"> <a href="https://kubernetes.io" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/kubernetes/kubernetes-icon.svg" alt="kubernetes" width="80" height="80"/> </a> </p>

This repository contains scripts and configurations for deploying a K8s instance on AWS.

## Prerequisites

Before you can use these scripts, ensure that you have the following:

- Linux or macOS environment
- AWS CLI installed and configured with credentials
- Jenkins & Ansible installed and running
- Git installed

Please make the following modifications in the `aws_create` script according to your environment:
- VPC-ID
- Availability Zone (AZ)
- Security groups
- AMI-ID
- Subnets
- PEM file name

## Create Jenkins Job with a Pipeline and choose "Pipeline Script from SCM".

To-do's in Jenkins:
------------------------------------------
1. Add the AWS PEM file in Jenkins credentials with the ID "pemfile".

## NOTE: Jenkins Job name and AWS EC2 Instance name must be same.
Instance Name will be in aws_create.sh

Please ensure you have completed the above steps before proceeding.

## Contributing

Contributions are welcome! If you would like to contribute to this project, please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and test them thoroughly.
4. Commit your changes and push them to your forked repository.
5. Submit a pull request, explaining the purpose and changes of your contribution.

## License

This project is licensed under the [MIT License](LICENSE).
