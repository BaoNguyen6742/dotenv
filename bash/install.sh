#!/bin/bash

install_location="$HOME/.bash_aliases"

if [ $(ls -d */ 2>/dev/null | wc -l) -ne 0 ]; then
    if [ $# -ne 1 ]; then
        echo "Error: Only accept one argument (Linux, WSL)"
        exit 1
    else
        for arg in "$@"; do
            if [ -d "$arg" ]; then
                config_file="./$arg/.bash_aliases"
                cp "$config_file" "$install_location"
                source "$install_location"
                echo "Success: $arg installed"
                echo "Please run 'source $install_location' to apply the changes"
                echo
            else
                echo "Error: $arg is not a valid type, only accept (Linux, WSL)"
            fi
        done
    fi
else
    cp ./.bash_aliases "$install_location"
    source "$install_location"
    echo "Success: Bash config installed in $install_location"
    echo "Please run 'source $install_location' to apply the changes"
    echo
fi