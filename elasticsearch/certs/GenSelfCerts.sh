# Gere a chave privada da CA
openssl genrsa -out ca.key 4096

# Gere o certificado da CA com SHA512 explicitamente
# openssl req -new -x509 -sha512 -days 3650 -key ca.key -out ca.crt -subj "/C=PT/ST=Lisboa/L=Lisboa/O=ACME/CN=Elastic-CA"

openssl req -new -x509 -sha512 -days 3650 -key ca.key -out ca.crt

# 1. Gerar a chave privada
openssl genrsa -out dual.key 2048

# 2. Criar uma solicitação de assinatura de certificado (CSR) usando a configuração
openssl req -new -key dual.key -out dual.csr -config cert.cnf

# 3. Assinar o CSR com a CA para gerar o certificado
openssl x509 -req -days 365 -in dual.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out dual.crt -extensions v3_req -extfile cert.cnf
