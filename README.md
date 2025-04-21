# 🐧Desafio de Projeto - Bootcamp Linux para Iniciantes
## Infraestrutura como código: Script de criação de estrutura de usuários, diretórios e permissões

Nesta atividade, fui desafiado a automatizar o processo de criação de usuários, grupos e suas respectivas permissões a partir do conceito de Infraestrutura como Código (IaC). Através de um arquivo bash, pude realizar as tarefas de forma rápida e controlada, minimizando os erros e maximizando a eficiência. <br>
Abaixo, estão algumas explicações adicionais sobre o que o script faz.

## 📋Detalhes da tarefa
O arquivo que contém os scripts é o setup.sh. <br>
Como utilizar: <code style="color: rgb(100,237,255);">./setup.sh </code> <br>
Para melhor controle sobre as saídas emitidas pelo script, é recomendável adicionar o seguinte trecho ao final da linha: <code style="color: rgb(100,237,255);">[> /root/log.txt 2> /root/erros.txt]<code>, pois isso irá redirecionar os outputs para arquivos de log no diretório home do root. Os erros e a saída padrão são colocados em arquivos diferentes para facilitar a análise.

Abaixo, está a relação de usuários e grupos:
|Grupo|Usuários|Diretório|Descrição|
|-----|--------|---------|---------|
|GRP\_ADM|Carlos, Maria, João|/adm|Dep. de Administração|
|GRP\_VEN|Débora, Sebastiana, Roberto|/ven|Dep. de Vendas|
|GRP\_SEC|Josefina, Amanda, Rogério|/sec|Secretariado|

Cada diretório concede todas as permissões ao dono e aos membros do grupo correspondente, mas as bloqueia para outros usuários, seguindo o modo 770 (rwxrwx---). <br>
Além destes, há também o diretório /publico, que pode ser acessado e utilizado por todos os usuários.

Para conveniência, o script deleta tudo o que foi criado antes de executar novamente, para que os testes sejam mais rápidos.
