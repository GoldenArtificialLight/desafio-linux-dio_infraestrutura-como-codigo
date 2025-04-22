#!/bin/bash

declare -a usuarios=( carlos maria joao debora sebastiana roberto josefina amanda rogerio )

# Deleção
echo "Excluindo diretórios"
rm -rf /publico /adm /ven /sec

echo "Excluindo usuários"
for i in ${usuarios[@]}
do
	userdel -f -r $i
done

echo "Excluindo grupos"
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC


