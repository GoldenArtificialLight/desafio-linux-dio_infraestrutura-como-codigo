# Desafio de Projeto - Bootcamp Linux para Iniciantes
### Infraestrutura como código: Script de criação de estrutura de usuários, diretórios e permissões

O arquivo setup.sh contém um script que cria automaticamente usuários, grupos, diretórios e gerencia suas permissões. <br>
Como utilizar: <code style="color: rgba(100,237,255,0.87);">./setup.sh [> /root/log.txt 2> /root/erros.txt]</code> <br>
O trecho entre colchetes irá redirecionar os outputs para arquivos de log no diretório home do root. Os erros e a saída padrão são colocados em arquivos diferentes para facilitar a análise.

Abaixo, está a relação de usuários e grupos:
|Grupo|Usuários|Diretório|Descrição|
|-----|--------|---------|---------|
|GRP\_ADM|Carlos, Maria, João|/adm|Dep. de Administração|
|GRP\_VEN|Débora, Sebastiana, Roberto|/ven|Dep. de Vendas|
|GRP\_SEC|Josefina, Amanda, Rogério|/sec|Secretariado|

Cada diretório concede todas as permissões ao dono e aos membros do grupo correspondente, mas as bloqueia para outros usuários, seguindo o modo 770 (rwxrwx---). <br>
Além destes, há também o diretório /publico, que pode ser acessado e utilizado por todos os usuários.

Para conveniência, o script deleta tudo o que foi criado antes de executar novamente, para que os testes sejam mais rápidos.
