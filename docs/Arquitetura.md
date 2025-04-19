## Fluxo de Tráfego da Aplicação

1.  **Requisição do Usuário:**
    * Um usuário, utilizando um navegador web, digita o endereço web. Este endereço é o **Nome DNS do Application Load Balancer (ALB)**.
    * O navegador realiza uma consulta ao servidor DNS para resolver o Nome DNS do ALB para um endereço IP.

2.  **Chegada ao Load Balancer:**
    * A requisição HTTP (na porta 80) é então enviada para o endereço IP do Application Load Balancer (ALB).
    * O ALB recebe a requisição.

3.  **Processamento no Load Balancer:**
    * O ALB opera na camada 7 (camada de aplicação) do modelo OSI.
    * Ele avalia as regras de seus **listeners**. No seu caso, você configurou um listener para tráfego HTTP na porta 80.
    * Com base nas regras do listener e no **target group** associado (que contém sua instância EC2), o ALB decide para qual instância encaminhar o tráfego. Como você tem apenas uma instância, toda a requisição será direcionada para ela.
    * O ALB encaminha a requisição HTTP para a sua **Instância EC2** na porta especificada no target group (provavelmente também porta 80, correspondendo à porta em que sua aplicação Flask está escutando).

4.  **Processamento na Instância EC2:**
    * A requisição HTTP chega à sua instância EC2.
    * O **Security Group (SG-HTTP)** associado à sua instância deve permitir o tráfego de entrada na porta 80 vindo do endereço IP do Load Balancer (embora, para simplificar, muitas vezes se permite tráfego da VPC ou de qualquer lugar para testes iniciais).
    * O servidor web (embutido no Flask durante o desenvolvimento ou um servidor como Gunicorn em produção) na sua instância EC2 recebe a requisição.
    * A **aplicação Flask** processa a requisição e gera uma resposta HTTP (por exemplo, o conteúdo da página do seu portfólio).

5.  **Resposta para o Load Balancer:**
    * A aplicação Flask envia a resposta HTTP de volta para o servidor web na instância EC2.
    * O servidor web envia a resposta de volta para o Application Load Balancer (ALB). O **Security Group de saída** da instância EC2 geralmente permite todo o tráfego de saída, então a resposta pode sair sem problemas.

6.  **Resposta para o Usuário:**
    * O Application Load Balancer (ALB) recebe a resposta HTTP da instância EC2.
    * O ALB então encaminha essa resposta de volta para o usuário (o navegador web) que originou a requisição.

7.  **Renderização no Navegador:**
    * O navegador do usuário recebe a resposta HTTP do ALB e renderiza o conteúdo do seu portfólio para o usuário visualizar.

**Em resumo, o fluxo é:**

`Usuário (Navegador) -> DNS do ALB -> ALB -> Instância EC2 (Flask App) -> ALB -> Usuário (Navegador)`
