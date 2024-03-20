#!/bin/bash

# Função para exibir meu banner
show_banner() {
    echo ' _____          _ ____        _        _____                      _ _         '
    echo '|  __ \        | |  _ \      | |      / ____|                    (_) |        '
    echo '| |__) |___  __| | |_) |_   _| |_ ___| (___   ___  ___ _   _ _ __ _| |_ _   _ '
    echo '|  _  // _ \/ _` | |  _ <| | | | __/ _ \___ \ / _ \/ __| | | | '\''__| | __| | | |'
    echo '| | \ \  __/ (_| | |_) | |_| | ||  __/___) |  __/ (__| |_| | |  | | |_| |_| |'
    echo '|_|  \_\___|\__,_|____/ \__, |\__\___|_____/ \___|\___|\__,_|_|  |_|\__|\__, |'
    echo '                         __/ |                                           __/ |'
    echo '                        |___/                                           |___/ '
    echo ''
}

# Definição de variáveis para o meu banner
author="Desenvolvido por: Rammon Ramos"
company="RedByte Security"
version="Versão 0.01"

# Exibindo o meu banner
show_banner
echo "$author"
echo "$company"
echo "$version"
echo "==========================================="

# Loop para processar os subdomínios
for palavra in $(cat subdomains.txt); do
    # Executando a consulta DNS para o subdomínio atual e filtrando a saída
    output=$(host -t cname "$palavra.$1" | grep -v "alias for")
    
    # Verificando se a saída não está vazia
    if [[ ! -z "$output" ]]; then
        # Exibindo uma mensagem informativa quando um possível subdomínio takeover é encontrado
        echo "Possível subdomínio takeover encontrado para: $palavra.$1"
        echo "$output"
        echo "==========================================="
    fi
done
