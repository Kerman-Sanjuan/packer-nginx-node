packer { # Definir que estamos usando AWS.
    amazon = {
      version = ">= 1.3.2"
      source  = "github.com/hashicorp/amazon"
    }
}

source "amazon-ebs" "ami"{ # Definir que AMI base usamos -> Donde guardar el AMI.
  ami_name = "builded-ami-with-packer"
  source_ami = "ami-0cd59ecaf368e5ccf"  # Ubuntu server 20.04 LTS
  instance_type = "t2.micro"
  region = "us-east-1"
  ssh_username = "ec2-user"



}
g
build { # Que instalar, copiar y demas.

  sources = ["source.amazon-ebs.ami"] # Podemos crear varios, podriamos juntar providers para que esto funcione.
  
  # Ahora se ponen todos los provisioner en el orden que se quiera.
  #
  #
  # 1. Descargar codigo fuente.
  #

  provisioner "file" {

  }
  provisioner "ansible"{
    playbook_file = "./config/playbook.yml"
  }



}
