module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Viraj-bastion"

  ami                    = "ami-0574da719dca65348"
  instance_type          = "t2.micro"
  key_name               = "ssh-key4"
  monitoring             = true
  vpc_security_group_ids = [module.public-sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
}


module "jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Viraj-jenkins"

  ami                    = "ami-0574da719dca65348"
  instance_type          = "t2.medium"
  key_name               = "ssh-key4"
  monitoring             = true
  vpc_security_group_ids = [module.private-sg.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]
}


module "appserver" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Viraj-appserver"

  ami                    = "ami-0574da719dca65348"
  instance_type          = "t2.micro"
  key_name               = "ssh-key4"
  monitoring             = true
  vpc_security_group_ids = [module.private-sg.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]
}