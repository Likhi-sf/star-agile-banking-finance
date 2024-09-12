resource "aws_instance" "Prod-server" {
  ami           = "ami-0522ab6e1ddcc7055"  
  instance_type = "t2.micro"
  key_name = "practice Key"
  vpc_security_group_ids = ["sg-030ed4287a6e0b6c7"]
  tags = {
    Name = "Prod-server"
  }
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("./practice Key.pem")
    host = self.public_ip
  }
  provisioner "remote-exec"{
  inline = ["echo 'wait to start the instance'"]
  } 
  provisioner "local-exec" {
  command = "echo ${aws_instance.Prod-server.public_ip} > inventory"
  }
  provisioner "local-exec" {
     command = "/var/lib/jenkins/workspace/project-pipeline/terraform-files/ansibleplaybook.yml"
  }
}
  

  
