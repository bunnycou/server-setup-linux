#!/bin/sh

case $1 in
    setupmc|mc)
    echo "Installing Dependenices . . ."
    setupmc

    echo "Creating Folders and Scripts . . ."
    createmc

    ;;

    setupsteam|steam|s)
    echo "Installing Dependencies . . ."
    setupsteam

    echo "Creating Folders and Scripts . . ."
    createsteam

    ;;

    setupboth|both|b)
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
    sudo apt-get install default-jre-headless default-jdk-headless
}

function setupsteam{
    sudo add-apt-repository multiverse
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install lib32gcc1 steamcmd
    sudo ln -s /usr/games/steamcmd steamcmd
}

function createmc {
    mkdir ~/servers/
    mkdir ~/servers/minecraft

    # code from setupmc.sh echoed into a script
    echo "#!/bin/sh" >> ~/servers/minecraft/setup.sh
}

function createsteam{
    mkdir ~/servers
    mkdir ~/servers/steam

    # code from setupsteam.sh echoed into a script
    echo "#!/bin/sh" >> ~/servers/steam/setup.sh
}