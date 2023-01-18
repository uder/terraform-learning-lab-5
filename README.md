# terraform-learning-lab-5
- Create S3 bucket and prevent it from being destroyed with one of the meta-arguments. Try to run `terraform destroy` against your configuration 
- Create AWS subnet along ec2 instance and nsg rule permitting 22 port inbound traffic referring to subnet outputs values to make implicit dependency on the subnet.

Create Vnet, Subnet for EC2.

Create an EC2 instance with predefined tags map(string) variable. Make configuration thus terraform shouldn’t apply changes if only tags variable were  changed.

Use count to create VM on condition var.ec2_enabled == true

Use depends_on to explicitly indicate ec2 has to be created after its subnet
