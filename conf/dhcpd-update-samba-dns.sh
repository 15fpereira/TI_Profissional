#!/bin/bash
# Autor: Francisco Dias
# Data de criação: 18/05/2020
# Data de atualização: 18/05/2020
# Versão: 0.01
# Testado e homologado para a versão do Ubuntu Server 16.04 LTS x64
# Kernel >= 4.4.x

# Início do script dhcpd-update-samba-dns.sh

. /etc/dhcp/dhcpd/dhcpd-update-samba-dns.conf || exit 1

ACTION=$1
IP=$2
HNAME=$3

export DOMAIN REALM PRINCIPAL NAMESERVER ZONE DHCPUSERNAME DHCPPASSWORD ACTION IP HNAME

/etc/dhcp/dhcpd/samba-dnsupdate.sh -m &

# Fim do script dhcpd-update-samba-dns.sh
