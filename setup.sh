#!/bin/sh

case $1 in
    setupmc)
    echo "Installing Dependenices . . ."
    setupmc

    echo "Creating Folders and Scripts . . ."
    createmc

    ;;

    setupsteam)
    echo "Installing Dependencies . . ."
    setupsteam

    echo "Creating Folders and Scripts . . ."
    createsteam

    ;;

    setupboth)
    echo "Installing Dependencies for MC . . ."
    setupmc

    echo "Installing Dependencies for Steam . . ."
    setupsteam

    echo "Creating Folders and Scripts for MC . . ."
    createmc

    echo "Creating Folders and Scripts for Steam . . ."
    createsteam


    ;;

    *)
    echo "Here are the options"
    echo "setupmc - setup Minecraft server dependencies and folders"
    echo "setupsteam - setup Steam server dependencies and folders as well as steamcmd"
    echo "setupboth - run both of the above ^"

    ;;
esac

function setupmc {
    sudo apt-get update
    sudo apt-get install default-jre
    sudo apt-get install default-jdk-headless
}

function setupsteam{
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install lib32gcc1
}

function createmc {
    mkdir ~/servers/
    mkdir ~/servers/minecraft

    echo "#!/bin/sh" >> ~/servers/minecraft/create.sh
}

function createsteam{
    mkdir ~/servers
}