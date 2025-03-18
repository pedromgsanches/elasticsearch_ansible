### Requisitos servidores

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
  - /opt/elasticsearch/{bin,data,log,conf} | 5gb, 10gb, 1gb, 128mb

- Volumes partilhados por todos os nós:
  - /opt/elasticsearch/repo | 20gb


### Install ElasticSearch
- Configurar inventory.ini para o caso pretendido e kibana.yml (variables) para especificidades kibana
- Executar DownloadBIN.sh para download de binários elasticsearch + kibana
- Executar certs/GenSelfCerts.sh ou adicionar os próprios certificados:
	- CA
	- Certificado Cliente/Servidor para o bootstrap do cluster e https
- ./RunPB.sh install.yml
- Login numa das máquinas e set inicial das passwords:
	- export ES_PATH_CONF=/opt/elasticsearch/conf/ && /opt/elasticsearch/bin/elasticsearch/bin/elasticsearch-setup-passwords auto -u "https://<servidor>:9200"
- ./RunPB.sh backups.yml

### Install Kibana
- Configurar kibana.yml (variables) para especificidades kibana
- ./RunPB.sh kibana.yml
- Criar utilizador admin com os roles superuser, monitoring_user e kibana_admin | alternativamente criar role e criar users nominais para os users
