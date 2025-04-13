#!/bin/bash

# 🛠️ Ativa depuração e falha imediata em erros
set -e
set -x

echo "🔧 Iniciando execução do user_data.sh..."

# Atualiza pacotes
sudo apt-get update -y

# Instala Python e pip
sudo apt-get install -y python3-pip

# Instala o Flask apenas para o usuário atual (evita problemas de permissão no GitHub Actions)
pip3 install --user flask

# Cria diretório da aplicação no workspace atual (evita /home/ubuntu que exige root)
APP_DIR="${PWD}/app"
mkdir -p "$APP_DIR"

# Cria um app Flask de exemplo
cat <<EOF > "$APP_DIR/app.py"
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World from Flask!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
EOF

echo "✅ Script finalizado com sucesso!"

