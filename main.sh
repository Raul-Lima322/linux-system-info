#!/bin/bash

verde="\033[0;32m"
azul="\033[0;34m"
amarelo="\033[1;33m"
reset="\033[0m"

dividir() {
    echo -e "${azul}--------------------------------------------------${reset}"
}

clear
dividir
clear
echo -e "${amarelo}                  Inf do Sistema             ${reset}"

dividir

echo -e "${verde}[-]Informações de SO ${reset}"
echo ""
echo -e "User: $(whoami)"
echo -e "Sistema: $(uname -o)"
echo -e "Kernel: $(uname -r)"
dividir

echo -e "${verde}[-]Processador ${reset}" 
echo ""
echo "Modelo: $(grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2 | sed 's/^[ \t]*//') e $(grep -c 'processor' /proc/cpuinfo) Threads"
dividir

echo -e "${verde}[-]Memória Ram ${reset}"
echo ""
echo "$(free -h | grep -E "Total|Mem" | awk '{print "Total:           " $2 "\nEm Uso:          " $3 "\nLivre:           " $4}')"
dividir

echo -e "${verde}[-]Rede${reset}"
echo ""
echo "Ip local: $(hostname -i)"
echo "Ip publico: $(curl -s ifconfig.me || echo 'Erro ao conectar')"
