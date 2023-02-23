data "template_file" "ec2ud" {
  template = file("user-data.sh")
  vars = {
    AWS_ACCESS_KEY = var.aws_access_key
    AWS_SECRET_KEY = var.aws_secret_key
    AWS_REGION     = var.aws_region
  }
}

resource "aws_instance" "go-ping" {
  ami           = data.aws_ami.amazon.id
  instance_type = "t3.micro"
  user_data     = data.template_file.ec2ud.rendered

  tags = {
    Name = "go-ping"
  }
}