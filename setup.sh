#!/bin/bash

# Diretórios: /public /adm /ven /sec
# Grupos: GRP_ADM GRP_VEN GRP_SEC
# Usuários: Ver mapa
#
# 1. Deletar itens existentes:
# 	1.1 Deletar diretórios
# 	1.2 Deletar usuários
# 	1.3 Deletar grupos
#
# 2. Criar grupos
# 
# 3. Criar usuários
# 	3.1 Criar usuários com uma senha padrão que
# 		deverá ser substituída no primeiro login
# 	3.2 Adicioná-los aos grupos correspondentes
# 
# 4. Criar diretórios
#	4.1 Alterar o grupo para o correspondente,
#		mantendo o root como dono
#	4.2 Adicionar permissões totais ao dono e
#		ao grupo, mas remover os outros
#	4.3 Adicionar permissão 777 ao diretório
#		público
#
# 5. Exibir informações para checagem
# 	5.1 Remover esta funcionalidade para que o
# 		script seja menos verboso

declare -a usuarios=( carlos maria joao debora sebastiana roberto josefina amanda rogerio )

# Deleção
# Excluindo diretórios
rm -rfi /publico /adm /ven /sec

# Excluindo usuários
for i in ${usuarios[@]}
do
	userdel -f -m $i
done

# Excluindo grupos
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

# Criação dos grupos
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criação dos usuários
# adm
useradd carlos 	-c "Carlos" -m -G GRP_ADM -s /bin/bash -p $(openssl passwd -6 12345)
useradd maria 	-c "Maria" 	-m -G GRP_ADM -s /bin/bash -p $(openssl passwd -6 12345)
useradd joao 	-c "João" 	-m -G GRP_ADM -s /bin/bash -p $(openssl passwd -6 12345)

# ven
useradd debora		-c "Debora"		-m -G GRP_VEN -s /bin/bash -p $(openssl passwd -6 12345)
useradd sebastiana	-c "Sebastiana"	-m -G GRP_VEN -s /bin/bash -p $(openssl passwd -6 12345)
useradd roberto		-c "Roberto"	-m -G GRP_VEN -s /bin/bash -p $(openssl passwd -6 12345)

# sec
useradd josefina -c "Josefina"	-m -G GRP_SEC -s /bin/bash -p $(openssl passwd -6 12345)
useradd amanda	 -c "Amanda"	-m -G GRP_SEC -s /bin/bash -p $(openssl passwd -6 12345)
useradd rogerio	 -c "Rogerio"	-m -G GRP_SEC -s /bin/bash -p $(openssl passwd -6 12345)

# Tornando a senha descartável
for i in "${usuarios[@]}"
do
	passwd $i -e
done
unset usuarios

# Criando diretórios
mkdir /publico /adm /ven /sec

# Atualizando permissões
chmod 777 /publico
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
chmod 770 /adm /ven /sec

# Finalizado
# REMOVER ESSAS LINHAS
cat /etc/passwd
cat /etc/group
ls -l /
