#!/bin/sh
# Substitui o placeholder DUMMY_API_URL nos arquivos JavaScript
# pelo valor que o Docker Compose forneceu em REACT_APP_API_URL
find /usr/share/nginx/html -name '*.js' -exec sed -i "s|DUMMY_API_URL|${REACT_APP_API_URL}|g" {} \;

# Continua para o comando principal do NGINX
exec "$@"