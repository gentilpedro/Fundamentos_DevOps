# Fundamentos_DevOps

Repositorio destinado a aprendizado de DevOps

* Ansible (Orquestramento de Maquinas);
* SonarQube ( Qualidade de Código );
* Jekins ( Automacao Server );
* SonarType ( Gerenciamento de Repositorios );
* Git ( Versionamento de codigo );
* Mysql e Redis ( Banco de dados );
* Bahs ( Shell Prompts );
* CentOs ( S.O );
* Graphana  & Prometheus ( Monitoramento );
* Docker ( Containers );
* Java, Node e Dotnet ( Aplicacoes );

# Aula 01 criando um lab ansible

1. Primeiro passo criar os arquivos do vagrant  na pasta desejada

```bash
vagrant init
```

2. Segundo passo criar as conifgs da vm, no caso esse é a meu control-node maquina( Mestre ) do Ansible

   ```
   Vagrant.configure("2") do |config|
     config.vm.box = "generic/rocky9"
     config.vm.hostname = "control-node"
     config.vm.network "private_network", ip:"192.168.1.2"
     config.vm.synced_folder "./", "/vagrant"
     config.vm.provision "shell", path: "provision.sh"
     config.vm.provider "vmware_desktop" do |v|
       v.vmx["memsize"] = "1024"
       v.vmx["numvcpus"] = "2"
     end
   end
   ```

   3. Agora vamos criar o Provision.sh
      o provision faz o download do ansible e suas dependencias, e os ips das maquinas "escravas";

      ```shell
      #!/usr/bin/env bash
      echo "Instalando e configurando dependencias..."
      echo "Instalando EPEL repository..."
      sudo dnf install -y epel-release

      echo "Instalando Ansible..."
      sudo dnf install -y ansible

      echo "Configurando o /etc/hosts..."
      sudo tee -a /etc/hosts > /dev/null <<EOT
      192.168.1.2 control-node
      192.168.1.3 app-01
      192.168.1.4 db-01
      EOT


      ```
   4. agora vamos criar as vms definindo as portas de cada um em cada sub-past
   5. Depois dentro da vm mestre vamos configurar os gp, no caminho /etc/ansible/hosts

      ```
      sudo vi /etc/ansible/hosts

      [app]
       app-01
      [db]
       db-01
      ```
   6. apos isso criar as sshs publicas ssh-keygen

# Aula 02 (30/03/26)
