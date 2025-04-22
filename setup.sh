#!/bin/bash

declare -a usuarios=( carlos maria joao debora sebastiana roberto josefina amanda rogerio )

echo "Criação dos grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criação dos usuários"
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

echo "Alterando a senha para ser usada apenas no primeiro login"
for i in "${usuarios[@]}"
do
	passwd $i -e
done
unset usuarios

echo "Criando diretórios"
mkdir /publico /adm /ven /sec

echo "Atualizando permissões"
chmod 777 /publico
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
chmod 770 /adm /ven /sec

echo "Finalizado"
