 web1_ami                         = "ami-0dea0cf236484a796"
 instance_type                    = "t3.large"
 subnet_id                        = ["subnet-5cea1937"]
 key_name                         = "mgmt"

 server_volume_root_size          = 100
 server_volume_data_size          = 100
 
 sg_name                          = "prod-web-servers-sg"
 description                      = "web server security group"
 
 
 