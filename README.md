# DevOps Portfolio

Bem-vindo(a) ao meu portfólio de projetos de Infraestrutura e Automação! Este repositório demonstra minhas habilidades em diversas áreas do DevOps, através de quatro projetos distintos:

- **Projeto 1 – IaC**: Provisionamento completo de um ambiente Flask "Hello, Terraform!" utilizando Terraform na AWS.
- **Projeto 2 – CI/CD**: Implementação de um pipeline de Integração Contínua e Entrega Contínua utilizando GitHub Actions e/ou Jenkins para uma aplicação Dockerizada.
- **Projeto 3 – Kubernetes**: Orquestração de uma aplicação em um cluster Kubernetes (EKS, AKS ou Minikube) com soluções de monitoramento integradas.
- **Projeto 4 – DevSecOps**: Incorporação de práticas de segurança no pipeline de desenvolvimento, incluindo análise de segurança estática (SAST), análise de segurança dinâmica (DAST) e gestão segura de segredos.

---

## Estrutura de Pastas

devops-portfolio-iac/
├── README.md           - Ponto de entrada do repositório
├── .gitignore          - Arquivos ignorados pelo Git
├── docs/               - Diagramas e documentação
│   └── architecture.png - Diagrama de arquitetura
├── app/                - Código da aplicação Flask
│   └── flask_hello/    - Subdiretório da aplicação Flask
│       ├── app.py          - Código principal da Flask
│       └── requirements.txt - Dependências Python
└── project-1-iac/      - IaC com Terraform
    ├── backend.tf        - Configuração do backend do Terraform
    ├── main.tf           - Recursos principais da infraestrutura
    ├── variables.tf      - Variáveis do Terraform
    ├── outputs.tf        - Saídas do Terraform
    ├── terraform.tfvars.example - Exemplo de variáveis
    └── modules/          - Módulos Terraform reutilizáveis
        ├── network/      - Módulo de rede
        │   ├── main.tf
        │   ├── variables.tf
        │   └── outputs.tf
        └── compute/      - Módulo de computação
            ├── main.tf
            ├── variables.tf
            ├── outputs.tf
            └── user_data.sh  - Script de inicialização

---

## Como Começar

Este guia o ajudará a configurar o ambiente para explorar os projetos neste repositório.

1.  **Pré-requisitos**:
    * **Git**: Necessário para clonar o repositório. Você pode baixá-lo em [https://git-scm.com/downloads](https://git-scm.com/downloads).
    * **Terraform**: Utilizado para provisionar a infraestrutura no Projeto 1. Certifique-se de ter a versão mais recente instalada seguindo as instruções em [https://www.terraform.io/downloads](https://www.terraform.io/downloads).
    * **AWS CLI**: A Interface de Linha de Comando da AWS é necessária para interagir com a AWS e será utilizada pelo Terraform no Projeto 1. Siga as instruções de instalação em [https://aws.amazon.com/cli/](https://aws.amazon.com/cli/). **Certifique-se de ter configurado suas credenciais da AWS corretamente usando `aws configure` ou outras formas de autenticação (como funções IAM, se aplicável).**
    * **Python 3.8+**: Necessário para executar a aplicação Flask no Projeto 1. Você pode baixá-lo em [https://www.python.org/downloads/](https://www.python.org/downloads/).

2.  **Clonar o repositório e entrar no diretório do projeto**:
    Abra seu terminal (no VS Code, você pode usar o terminal integrado) e execute os seguintes comandos:

    ```bash
    git clone https://github.com/yurialcant/devops-portfolio-iac.git
    cd devops-portfolio-iac
    ```
    
3.  **Navegar para o Projeto 1 (IaC com Terraform)**:
    Para começar a explorar o primeiro projeto, navegue até o diretório `project-1-iac`:

    ```bash
    cd project-1-iac
    ```

4.  **Inicializar o Terraform**:
    Antes de provisionar a infraestrutura, você precisa inicializar o Terraform:

    ```bash
    terraform init
    ```

    Este comando baixa os plugins necessários (provider AWS, neste caso) e configura o backend.

5.  **Revisar a configuração do Terraform**:
    Examine os arquivos `.tf` (principalmente `main.tf`, `variables.tf` e `outputs.tf`) para entender a infraestrutura que será provisionada. Consulte também o arquivo `terraform.tfvars.example` para ver um exemplo de como fornecer valores para as variáveis.

6.  **Aplicar a configuração do Terraform**:
    Para criar a infraestrutura na AWS, execute o seguinte comando:

    ```bash
    terraform apply -auto-approve
    ```

    **Aviso:** O comando `-auto-approve` aplicará as mudanças sem pedir confirmação. Em um ambiente de produção, é altamente recomendável remover essa flag e revisar o plano de execução com `terraform plan` antes de aplicar.

7.  **Acessar a aplicação Flask**:
    Após a conclusão do `terraform apply`, as saídas (definidas no `outputs.tf`) mostrarão informações importantes, como o endereço IP público da instância EC2 onde a aplicação Flask estará rodando. Acesse esse endereço no seu navegador para ver a mensagem "Hello, Terraform!".

8.  **Limpar a infraestrutura (Importante)**:
    Para evitar custos desnecessários na AWS, após explorar o projeto, destrua a infraestrutura provisionada pelo Terraform:

    ```bash
    terraform destroy -auto-approve
    ```

    Novamente, tenha cuidado com a flag `-auto-approve` em ambientes de produção.

## Próximos Passos

Este é um ponto de partida! Os outros projetos (`project-2-ci-cd`, `project-3-k8s`, `project-4-devsecops`) serão desenvolvidos e implementados em commits futuros. Fique de olho nas atualizações!

Sinta-se à vontade para explorar o código, fornecer feedback e contribuir para este portfólio.

---
