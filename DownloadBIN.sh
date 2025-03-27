export VERSION=$(grep es_version inventory.ini | sed 's/es_version=\|"//g')
export ARCH=$(grep es_arch inventory.ini | sed 's/es_arch=\|"//g')

cd files

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${VERSION}-linux-${ARCH}.tar.gz

wget https://artifacts.elastic.co/downloads/kibana/kibana-${VERSION}-linux-${ARCH}.tar.gz



