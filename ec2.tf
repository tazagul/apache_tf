resource "aws_instance" "instance" {
  ami               = data.aws_ami.centos.id
  instance_type     = var.instance_type
  key_name          = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id,aws_security_group.web.id]