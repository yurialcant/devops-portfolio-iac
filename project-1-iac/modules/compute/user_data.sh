#!/bin/bash
# Atualização da lista de pacotes e instalação de dependências
sudo apt-get update -y
sudo apt-get install -y python3-pip

# Instalação do Flask
pip3 install flask

# Criação do diretório para a aplicação
mkdir -p /home/ubuntu/app

# Criação do arquivo app.py com o código da aplicação
cat <<EOF > /home/ubuntu/app/app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, Terraform!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF

# Executa a aplicação Flask
python3 /home/ubuntu/app/app.py &
