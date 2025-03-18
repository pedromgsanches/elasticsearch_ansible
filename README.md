### 0- Requisitos servidores

requistos ansible-server:
 - python3
 - wget
 - ansible
 - ansible-galaxy collection install community.elastic -vvv

requisitos servidores ES:
- oel8+,
- swapoff
- /etc/security/limits.conf
    elasticsearch  -  nofile  65535
    elasticsearch  -  nproc   4096
    elasticsearch  -  memlock unlimited
- echo "vm.max_map_count=262144" >> /etc/sysctl.conf

- volumes:
  - /opt/elasticsearch/{bin,data,log,conf}

- Volumes partilhados por todos os nós:
  - /opt/elasticsearch/repo




### 1- Configurar inventory.ini para o caso pretendido e kibana.yml (variables) para especificidades kibana

### 2- Executar DownloadBIN.sh

### 3- Executar certs/GenSelfCerts.sh ou adicionar os próprios certificados:
	- CA
	- Certificado Cliente/Servidor para o bootstrap do cluster e https

### 4- ./RunPB.sh install.yml

### 5- Login numa das máquinas e set inicial das passwords:
	- export ES_PATH_CONF=/opt/elasticsearch/conf/ && /opt/elasticsearch/bin/elasticsearch/bin/elasticsearch-setup-passwords auto -u "https://<servidor>:9200"

### 6- ./RunPB.sh backups.yml

### 7- ./RunPB.sh kibana.yml

### 8- Criar utilizador admin com os roles superuser, monitoring_user e kibana_admin | alternativamente criar role e criar users nominais para os users
