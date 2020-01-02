# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

yaml = YAML.load_file("machines.yml")

Vagrant.configure("2") do |config|
  yaml.each do |server|

    config.trigger.before :up do |before|
      before.ruby do |env,machine|
        File.open('.hosts.tmp', 'a') do |hosts|
          hosts.write("127.0.0.1 localhost \n#{server['ip']} #{server['hostname']} \n")
        File.open("hosts", "w+") { |file| file.puts File.readlines(".hosts.tmp").uniq }
        end
        if !(File.exists?('id_rsa'))
          system("ssh-keygen -b 2048 -t rsa -f id_rsa -q -N ''")
        end
      end
    end

    config.vm.define server["name"] do |srv|
      srv.vm.box = server["system"]
      srv.vm.network "private_network", ip: server["ip"]
      srv.vm.hostname = server["hostname"]
      srv.vm.provider "virtualbox" do |vb|
        vb.name = server["name"]
        vb.memory = server["memory"]
        vb.cpus = server["cpus"]
      end

      # STANDARD CONFIG - CENTOS7
      if server["system"] == "centos/7"
        srv.vm.provision "shell", inline: "sudo yum install epel-release -y"
        srv.vm.provision "shell", inline: "sudo yum install wget curl net-tools bind-utils telnet vim git -y"
      end

      # STANDARD CONFIG - UBUNTU
      if server["system"] == "ubuntu/bionic64"
        srv.vm.provision "shell", inline: "apt update -y"
        srv.vm.provision "shell", inline: "apt install python curl wget net-tools telnet software-properties-common -y"
      end

      # DOCKER CONFIG - CENTOS7
      if server["docker"] == "true" && server["system"] == "centos/7"
        srv.vm.provision "shell", inline: "sudo yum install -y yum-utils device-mapper-persistent-data lvm2"
        srv.vm.provision "shell", inline: "sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo"
        srv.vm.provision "shell", inline: "sudo yum install docker-ce docker-ce-cli containerd.io -y"
	srv.vm.provision "shell", inline: "sudo systemctl start docker && sudo systemctl enable docker"
      end

      # ANSIBLE CONFIG - CENTOS7
      if server["ansible"] == "true" && server["system"] == "centos/7"
        srv.vm.provision "shell", inline: "sudo yum install -y ansible"
      end

      # DOCKER CONFIG - UBUNTU
      if server["docker"] == "true" && server["system"] == "ubuntu/bionic64"
        srv.vm.provision "shell", inline: "sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y"
        srv.vm.provision "shell", inline: "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
        srv.vm.provision "shell", inline: "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'"
        srv.vm.provision "shell", inline: "apt update -y"
        srv.vm.provision "shell", inline: "sudo apt-get install docker-ce docker-ce-cli containerd.io -y"
      end
     
      # ANSIBLE CONFIG - UBUNTU
      if server["ansible"] == "true" && server["system"] == "ubuntu/bionic64"
        srv.vm.provision "shell", inline: "sudo apt-add-repository ppa:ansible/ansible -y"
        srv.vm.provision "shell", inline: "apt update -y"
        srv.vm.provision "shell", inline: "apt install ansible -y"
      end

      # POST PROVISION SHELL
      
      config.vm.provision "shell", inline: "cp /vagrant/hosts /etc/hosts"
      config.vm.provision "shell", inline: "mkdir -p /root/.ssh"
      config.vm.provision "shell", inline: "cp /vagrant/id_rsa /root/.ssh/id_rsa"
      config.vm.provision "shell", inline: "cp /vagrant/id_rsa.pub /root/.ssh/authorized_keys"
      config.vm.provision "shell", inline: "chmod 600 /root/.ssh/id_rsa"
      
    end
  end
end
