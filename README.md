# custom-labs

Vagrantfile para criação de laboratórios com Hashicorp Vagrant.

O objetivo deste projeto é usar as funcionalidades aplicadas ao arquivo Vagrantfile para montar laboratórios virtuais de forma simples e dinâmica.

## Iniciando o Lab

Faça o download dos arquivos disponíveis neste projeto através do git:

```
https://github.com/xjoohnny/custom-labs.git
```

Acesse o diretório custom-labs e, através do arquivo machines.yml, personalize as características das máquinas virtuais que você deseja construír.

```
cd custom-labs
vim machines.yml
```
Os parâmetros do arquivo .yml são:
- **name:** server01
- **cpus:** 1
- **memory:** 1024
- **hostname:** server01.lab.com
- **ip:** 192.168.120.2
- **system:** centos/7
- **docker:** "true"
- **ansible:** "true"

Caso os parâmetros *"docker"* e *"ansible"* sejam iguais a "true", a instalação dos softwares em questão será realizada para facilitar o processo de provisionamento.

Para deixar o Lab mais completo, os aplicativos abaixo são instalados nos sistemas operacionais:
- *epel-release (quando o SO é Centos/7)*
- *wget*
- *curl*
- *vim*
- *net-tools*
- *bind-utils*
- *git*
- *python (quando o SO é ubuntu/bionic64)*


A seguir construa as máquinas virtuais usando o Vagrant:

```
vagrant up
```

Repare que, no mesmo diretório, serão criados os seguintes arquivos.

Chaves de SSH:

* id_rsa
* id_rsa.pub

Base para /etc/hosts:

* hosts
* .hosts.tmp

*O arquivo .hosts.tmp é um arquivo oculto para armazenamento da identificação das máquinas virtuais, no entanto, já que ele faz parte de um loop, deve conter uma série de valores repetidos - que são filtrados e armazenamos no arquivo hosts.


## Para atualizar o laboratório

Se você tiver uma nova máquina virtual para o laboratório, resincronize o conteúdo do diretório /vagrant de dentro das VMs com o comando:

```
vagrant rsync
```

A seguir reprovisione as máquinas virtuais que já estão em execução para que elas sincronizem o arquivo /etc/hosts com a identificação da nova VM, usando:

```
vagrant up --provision
```

# Informações do Autor

Criado por [Jonathan Dantas Alves](https://www.linkedin.com/in/jonathandantasalves/).
Forked por [João Vithor - xjoohnny](https://www.linkedin.com/in/jvfogaca/).
