#!/bin/bash
# Autor: Profº Robson Vaamonde
# Adaptado por: Francisco Dias
# Data de criação: 26/09/2016
# Data de atualização: 12/06/2020
# Versão: 0.11
# Testado e homologado para a versão do Ubuntu Server 16.04 LTS x64
# Kernel >= 4.4.x
#
# Configuração do PAM (Pluggable Authentication Modules for Linux) integrado com Winbind e SAMBA-4
#
# Utilizar o comando: sudo -i para executar o script
#
# Caminho para o Log do Script-25.sh
LOG="/var/log/script-25.log"
#
# Variável da Data Inicial para calcular tempo de execução do Script
DATAINICIAL=`date +%s`
#
# Validando o ambiente, verificando se o usuário e "root"
USUARIO=`id -u`
UBUNTU=`lsb_release -rs`
KERNEL=`uname -r | cut -d'.' -f1,2`

if [ "$USUARIO" == "0" ]
then
	if [ "$UBUNTU" == "16.04" ]
		then
			if [ "$KERNEL" == "4.4" ]
				then
					 clear
					 #
					 #Variaveis de ambiente para o script
					 #
					 DOMAIN="TI-PRO\administrator"
					 USER="root"
					 PASSWORD="pro@2020"
					 ADMIN="administrator"
					 
					 echo -e "Usuário é `whoami`, continuando a executar o Script-25.sh"
					 echo
					 echo -e "Rodando o Script-25.sh em: `date`" > $LOG
					 echo -e "================================================================================="
					 echo -e "           Configuração da Integração do PAM com Winbind e SAMBA-4"
					 echo -e "================================================================================="
					 echo
					 echo -e "Pressione <Enter> para iniciar a configuração"
					 read
					 sleep 2
					 clear
					 
					 echo -e "Atualizando as configuarações do PAM, pressione <Enter>."
					 read "Habilitar o recurso de: Create home directory on login"
					 sleep 2
					 clear
					 #Executando comando pam-auth-update
					 pam-auth-update
					 read "Atualização feita com sucesso!!!, pressione <Enter> para continuar com o script."
					 sleep 2
					 clear
					 read "Atualizando os arquivos de configuração do PAM, pressione <Enter> para continuar..."
					 sleep 2
					 echo
					 echo -e "Fazendo o backup do arquivo de configuração COMMON-PASSWORD, aguarde..."
					 #Backup deve ser feito em outro local o arquivo de configuração
					 cp -v /etc/pam.d/common-password /var/log/common-password.old >> $LOG
					 echo -e "Arquivo backupeado com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 echo -e "Atualizando o arquivo de configuração COMMON-PASSWORD, aguarde..."
					 #Atualizando o arquivo de configuração
					 cp -v conf/common-password /etc/pam.d/common-password >> $LOG
					 echo -e "Arquivo e atualizado com sucesso!!!, continuando o script..."
					 sleep 2
					 echo
					 read "Editando o arquivo de configuração COMMON-PASSWORD, pressione <Enter> para continuar..."
					 sleep 2
					 #Editando o arquivo de configuração
					 vim /etc/pam.d/common-password
					 read "Arquivo editado com sucesso!!!, pressione <Enter> para continuando o script..."
					 sleep 2
					 clear
					 echo -e "Reinicializando o serviço do Winbind, aguarde..."
					 #Reinicializando o serviço
					 sudo service winbind restart >> $LOG
					 echo -e "Serviços reinicializado com sucesso!!!, contiuando o script..."
					 sleep 2
					 echo
					 echo -e "Adicionando o usuário $ADMIN ao grupo do SUDO, aguarde..."
					 #Alterando o grupo do usuário administrator
					 usermod -aG sudo $DOMAIN >> $LOG
					 echo -e "Grupo adicionado com sucesso!!!, continuado com o script..."
					 echo
					 echo -e "Verificando as informação do Winbind do usuário $ADMIN, aguarde..."
					 echo
					 #Verificando as configurações de integração do Winbindo do usuário administrator
					 wbinfo -i $ADMIN
					 echo
					 read "Informações do Winbind obtidas com sucesso!!!, pressione <Enter> para continuar..."
					 sleep 2
					 clear
					 echo
					 echo -e "Criando o diretório base do usuário $ADMIN"
					 echo -e "Pressione <Enter> para continuar"
					 read "Para sair do login do usuário $ADMIN, digite exit <Enter>"
					 sleep 2
					 #Criando a estruura de diretório e acesso a pasta pessoal
					 su - $ADMIN >> $LOG
					 echo -e "Diretório criado com sucesso!!!, continuando o script..."
					 echo
					 echo -e "Fim do Script-25.sh em: `date`" >> $LOG
					 echo -e "    Finalização da Configuração da Integração do PAM com Winbind e SAMBA-4"
					 echo -e "================================================================================="
					 echo
					 # Script para calcular o tempo gasto para a execução do script-25.sh
						DATAFINAL=`date +%s`
						SOMA=`expr $DATAFINAL - $DATAINICIAL`
						RESULTADO=`expr 10800 + $SOMA`
						TEMPO=`date -d @$RESULTADO +%H:%M:%S`
					 echo -e "Tempo gasto para execução do script-25.sh: $TEMPO"
					 read "Pressione <Enter> para concluir o processo."
					 else
						 echo -e "Versão do Kernel: $KERNEL não homologada para esse script, versão: >= 4.4 "
						 read "Pressione <Enter> para finalizar o script"
			fi
		else
			 echo -e "Distribuição GNU/Linux: `lsb_release -is` não homologada para esse script, versão: $UBUNTU"
			 read "Pressione <Enter> para finalizar o script"
		fi
else
	 echo -e "Usuário não é ROOT, execute o comando com a opção: sudo -i <Enter> depois digite a senha do usuário `whoami`"
	 read "Pressione <Enter> para finalizar o script"
fi
