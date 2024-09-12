resource "aws_instance" "Prod-server" {
  ami           = "ami-0e86e20dae9224db8"  
  instance_type = "t2.micro"
  key_name = "practice Key"
  security_groups = [
      "sg-00bd58231a14bfc2c"
  ]
  tags = {
    Name = "Prod-server"
  }
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("./practice key.pem")
    host = self.public_ip
  }
  provisioner "remote-exec"{
  inline = ["echo 'wait to start the instance'"]
  } 
  provisioner "local-exec" {
  command = "echo ${aws_instance.Prod-server.public_ip} > inventory"
  }
  provisioner "local-exec" {
     command = "/var/lib/jenkins/workspace/project-pipeline/ansibleplaybook.yml"
  }
}
  

  
