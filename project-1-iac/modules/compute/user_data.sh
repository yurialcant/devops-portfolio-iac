#!/bin/bash
set -e
set -x

echo "🔧 Iniciando configuração da instância EC2..."

# Atualiza os pacotes
sudo apt-get update -y
sudo apt-get install -y python3-pip

# Instala Flask
pip3 install --user flask

# Define diretório da aplicação
APP_DIR="/home/ubuntu/app"
mkdir -p "$APP_DIR"

# Cria aplicação Flask simples
cat > "$APP_DIR/app.py" <<EOF
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "👋 Olá! Esta aplicação Flask está rodando na EC2 com sucesso!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
EOF

# Redireciona logs para arquivo
LOG_FILE="$APP_DIR/flask.log"

# Inicia a aplicação Flask com nohup
nohup python3 "$APP_DIR/app.py" > "$LOG_FILE" 2>&1 &

echo "✅ Script finalizado com sucesso!"


