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


VENV_DIR="$APP_DIR/venv"

# Cria o ambiente virtual
python3 -m venv "$VENV_DIR"


source "$VENV_DIR/bin/activate"


pip3 install flask


deactivate


cat > "$APP_DIR/app.py" <<EOF
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "👋 Olá! Esta aplicação Flask está rodando na EC2 com sucesso!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
EOF


sudo chmod +x "$APP_DIR/app.py"

# Garante que o usuário ubuntu tenha permissão para escrever no diretório da aplicação
sudo chown -R ubuntu:ubuntu "$APP_DIR"


LOG_FILE="$APP_DIR/flask.log"


nohup bash -c "source '$VENV_DIR/bin/activate' && '$VENV_DIR/bin/python' '$APP_DIR/app.py' > '$LOG_FILE' 2>&1 &"


sudo chmod 644 "$LOG_FILE"

echo "✅ Script finalizado com sucesso!"