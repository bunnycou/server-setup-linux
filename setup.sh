#!/bin/sh

case $1 in
    setupmc)
    echo "Installing Dependenices . . ."
    sudo apt-get update
    sudo apt-get install default-jre
    sudo apt-get install default-jdk-headless


    ;;

    setupsteam)
    echo "Installing Dependencies . . ."
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install lib32gcc1


    ;;

    setupmcsteam)
    echo "Installing Dependencies for MC . . ."
    sudo apt-get update
    sudo apt-get install default-jre
    sudo apt-get install default-jdk-headless

    echo "Installing Dependencies for Steam . . ."
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install lib32gcc1

    echo "Creating Folders and scripts . . ."
    # Minecraft Folders and scripts
    sudo mkdir ~/servers/minecraft/


    # Steamcmd Folders and scripts
    sudo mkdir ~/servers/steamcmd/
    

    ;;

    *)
    echo Here are the options
    echo setupmc - setup Minecraft server dependencies and folders
    echo setupsteam - setup Steam server dependencies and folders as well as steamcmd
    echo 
    ;;
esac