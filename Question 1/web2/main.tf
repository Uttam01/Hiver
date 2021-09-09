terraform {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.57.0"
    }
  }

  required_version = ">= 3.57.0"
}



provider "aws"{
    version = "~> 3.57.0"
    profile = "default"
    region = "ap-south-1" 
}

resource "ec2_instance" "web2" {
  ami                          = var.web2_ami
  instance_type                = var.instance_type
  key_name                     = var.key_name
  subnet_id                    = var.subnet_id
  vpc_security_group_ids       = [aws_security_group.sg_web2.id]
  
  associate_public_ip_address  = false
  
  root_block_device {
    volume_size = "${var.server_volume_root_size}"
    volume_type = "gp2"
  }

  ebs_block_device {
    volume_size = "${var.server_volume_data_size}"
    volume_type = "gp2"
    device_name = "/dev/sdf"
  }

  
  tags = {
      Name = "prod-web-server-2"
  }
}