#!/bin/bash
set -e
set -x

echo "🔧 Iniciando configuração da instância EC2..."

# Atualiza os pacotes
sudo apt-get update -y
sudo apt-get install -y python3-pip python3-venv

# Define diretório da aplicação
APP_DIR="/home/ubuntu/app"
mkdir -p "$APP_DIR"

# Define diretório do ambiente virtual
VENV_DIR="$APP_DIR/venv"

# Cria o ambiente virtual
python3 -m venv "$VENV_DIR"

# Ativa o ambiente virtual
source "$VENV_DIR/bin/activate"

# Instala Flask dentro do ambiente virtual
pip3 install flask

# Desativa o ambiente virtual (boa prática após a instalação)
deactivate

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

# Tornar o script app.py executável
sudo chmod +x "$APP_DIR/app.py"

# Garante que o usuário ubuntu tenha permissão para escrever no diretório da aplicação
sudo chown -R ubuntu:ubuntu "$APP_DIR"

# Redireciona logs para arquivo
LOG_FILE="$APP_DIR/flask.log"

# Inicia a aplicação Flask com nohup, ativando o ambiente virtual diretamente
nohup bash -c "source '$VENV_DIR/bin/activate' && '$VENV_DIR/bin/python' '$APP_DIR/app.py' > '$LOG_FILE' 2>&1 &"

# Garante permissão de leitura para o usuário ubuntu no arquivo de log
sudo chmod 644 "$LOG_FILE"

echo "✅ Script finalizado com sucesso!"