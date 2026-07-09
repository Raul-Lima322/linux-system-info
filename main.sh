#!/bin/bash

verde="\033[0;32m"
azul="\033[0;34m"
amarelo="\033[1;33m"
reset="\033[0m"

dividir() {
    echo -e "${azul}--------------------------------------------------${reset}"
}

clear
echo -e "${amarelo}                  Inf do Sistema             ${reset}"

dividir

#Informaçoẽs do sistema operacional
echo -e "${verde}[-]Informações de SO ${reset}"
echo ""
echo "User: $(whoami)"
echo "Sistema: $(uname -o)"
echo "Distro: $(hostnamectl | awk -F: '/Operating System/ {print substr($2, 2)}')"
echo "Kernel: $(uname -r)"
dividir

#Cpu (Processador)
echo -e "${verde}[-]Processador ${reset}" 
echo ""
echo "Cpu: $(grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2 | sed 's/^[ \t]*//') e $(grep -c 'processor' /proc/cpuinfo) Threads"
dividir

#Memória Ram
echo -e "${verde}[-]Memória Ram ${reset}"
echo ""
echo "$(free -h | grep -E "Total|Mem" | awk '{print "Total:           " $2 "\nEm Uso:          " $3 "\nLivre:           " $7}')"
dividir

#Rede
echo -e "${verde}[-]Rede${reset}"
echo ""
echo "Ip local: $(hostname -I | awk '{print$1}')"
echo "Ip publico: $(curl -s ifconfig.me || echo 'Erro ao conectar')"
dividir
