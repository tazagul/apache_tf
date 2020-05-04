resource "aws_instance" "instance" {
  ami               = data.aws_ami.centos.id
  instance_type     = var.instance_type
  key_name          = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id,aws_security_group.web.id]
  

  
  provisioner "remote-exec" {
    connection {
      host          = self.public_ip
      type          = "ssh"
      user          = "centos"
      private_key   = file(var.PATH_TO_PRIVATE_KEY)
      }
      inline = [
        "sudo yum install httpd -y",
        "sudo systemctl start httpd && sudo systemctl enable httpd",
        ]
      } 

}