# Infraestrutura de TI baseada em ambiente Linux

Este Projeto simula um ambiende organizacional de infraestrutura de TI com servidores e serviços totalmente baseado em distribuição Linux. Somente estação de trabalho de usuário vai utilizar Microsoft Windows.
As configurações e serviços, que serão promovidos no Ubuntu Server, será feito através de EXECUÇÃO DE SCRIPT. A cada configuração, serviço promovido, atualização do Ubuntu Server será feito o COMMIT do script aqui no github. 

# Projeto

Os serviços: AD DC, DNS, DHCP e File Server será implementado em um Ubuntu Servidor em um SAMBA-4, não recomendo implementar os serviços no mesmo servidor, em caso de um cenário real cada serviço deve ser implementado em um servidor diferente. Fiz esse projeto em um servidor por que e só um LaB e para não ficar pesado em minha estação de trabalho. Em produção, elegi uma VM para cada serviço.
Este projeto também tem um Firewall e Proxy baseado em uma distribuição Linux. A distribuição Linux que vou utilizar no Projeto e o Endian Firewall Community release 3.3.0 para gerenciar o firewall e o Proxy.
Vou implementar serviços como APACHE E MYSQL para simular uma um sistema de gestão empresárial GRP.

# Documentação

Todo o projeto terá a configuração do serviço e procedimento operacional documentado e adicionado aqui no github como modelo de documentação de toda infraestrutura de TI.
	
	1 - Instalação Endian Firewall;
	2 - Comfiguração de Firewall e Proxy;
	3 - Instalação do SAMBA-4 no Linux Ubuntu Server
