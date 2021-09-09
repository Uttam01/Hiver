provider "aws"{
    profile = "default"
    region = "eu-west-2" 
}

terraform {
    
}

module "nlb" {
    source = "terraform-aws-modules/alb/aws"
    name = "web_nlb"
    load_balancer_type = "network"
    internal = "false"
    vpc_id = var.vpc_id
    subnets = var.subnet_ids
    target_groups = [
        {
            backend_protocol = "HTTP"
            backend_port     = "80"
            target_type      = "instance"
            targets = [
                {
                    target_id = data.aws_instance.web1.id
                    port = 80
                },
                {
                    target_id = data.aws_instance.web2.id
                    port = 8080
                }
            ]
        }
    ]
https_listeners = [
    {
        port      = 443
        protocol  = "HTTPS"
        certificate_arn = " "
        target_group_index = 0
    }
]
http_tcp_listeners = [
    {
        port    = 80
        protocol = "HTTP"
        target_group_index = 0
    }
]

tags = {
    Environment = "Test"
}
}
