data "aws_instance" "web1" {
  filter {
    name   = "tag:Name"
    values = ["prod-web-server-1"]
  }
}
data "aws_instance" "web2" {
  filter {
    name   = "tag:Name"
    values = ["prod-web-server-2"]
  }
}