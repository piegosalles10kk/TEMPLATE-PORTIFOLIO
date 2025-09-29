#!/bin/sh

# Substitui o placeholder DUMMY_API_URL nos arquivos JavaScript
# pelo valor que o Docker Compose forneceu em REACT_APP_API_URL
find /usr/share/nginx/html -name '*.js' -exec sed -i "s|DUMMY_API_URL|${REACT_APP_API_URL}|g" {} \;

# Verifica se a configuração do nginx está correta
echo "🔧 Verificando configuração do nginx..."
nginx -t

if [ $? -eq 0 ]; then
    echo "✅ Configuração do nginx OK - Iniciando na porta 500..."
else
    echo "❌ Erro na configuração do nginx!"
    exit 1
fi

# Continua para o comando principal do NGINX
exec "$@"
