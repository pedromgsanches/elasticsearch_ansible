# 0- Requisitos servidores

requistos ansible-server:
 - python3
 - wget
 - ansible

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




# 1- Configurar inventory.ini para o caso pretendido

# 2- Executar DownloadBIN.sh

# 3- Executar certs/GenSelfCerts.sh ou adicionar os próprios certificados:
	- CA
	- Certificado Cliente/Servidor para o bootstrap do cluster e https

# 4- Install_ES_Playbook.sh

# 5- Login numa das máquinas e set inicial das passwords:
	- export ES_PATH_CONF=/opt/elasticsearch/conf/ && /opt/elasticsearch/bin/elasticsearch/bin/elasticsearch-setup-passwords auto -u "https://<servidor>:9200"

# 6- Backup_Playbook.sh

# 7- Kibana_Playbook.sh

