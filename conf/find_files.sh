#!/bin/bash
# Autor: Francisco Dias
# Data de criação: 18/05/2020
# Data de atualização: 18/05/2020
# Versão: 0.01
# Testado e homologado para a versão do Ubuntu Server 16.04 LTS x64
# Kernel >= 4.4.x
#
# Criando as váriaveis de validação do diretório
LOG="/var/log/samba/log.pesquisa_arquivos"
DIRETORIO="/arquivos/ti-pro.intra/gestao"
cd $DIRETORIO
LOCAL="`pwd`"

#Fazendo o teste lógico para a localização de arquivos
if [ $DIRETORIO == $LOCAL ]; then
	echo -e "Localizando arquivos indevidos na Pasta: $DIRETORIO em: `date`" > $LOG
	echo >> $LOG
	  find -type f -print0 | xargs -0 file -s | egrep ‘(Audio file|video|executable)’ >> $LOG
	echo >> $LOG
	echo -e "Finalização da localização de arquivos feita com sucesso!!!" >> $LOG
else
	echo -e "Diretório $DIRETORIO inexistente, verificar as configurações da váriavél de ambiente, localização dos arquivos, etc" >> $LOG
fi
