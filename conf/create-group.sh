#!/bin/bash
# Autor: Francisco Dias
# Data de criação: 18/05/2020
# Data de atualização: 18/05/2020
# Versão: 0.01
# Testado e homologado para a versão do Ubuntu Server 16.04 LTS x64
# Kernel >= 4.4.x
#
# Script de criação de grupos em lote.

gawk -F ":" '{ print $2,$3 }' usuario.txt | while read LISTA; 
	do $(echo "/usr/bin/samba-tool group add $LISTAGG --group-scope=Global --group-type=Security");
done;