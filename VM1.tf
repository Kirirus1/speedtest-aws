provider "aws" {
  access_key = "AKIA************BGHS"
  secret_key = "DcUvO+9M****************************LzWH"
  region     = "us-east-2"
}


resource "aws_instance" "VM1" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  key_name = "your_key_name"

  provisioner "remote-exec" {
    inline = [
"curl -fsSL https://get.docker.com -o get-docker.sh",
"sudo sh get-docker.sh",
"sudo docker pull adolfintel/speedtest",
"sudo docker run -e MODE=standalone -p 80:80 -d adolfintel/speedtest",
  ]
}

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("D:/Terraform/SSH/your_key_name.pem")
      host        = self.public_ip
    }
  }



