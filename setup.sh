#!/bin/sh

case $1 in
    minecraft|mc|m)
    echo "Installing Dependenices . . ."
    # setupmc
    sudo apt-get update
    sudo apt-get install -y openjdk-17-jdk-headless

    echo "Creating Folders and Scripts . . ."
    # createmc
    mkdir ~/servers/
    mkdir ~/servers/minecraft

    cd ~/servers/minecraft

    curl -o setup https://raw.githubusercontent.com/noahcou/server-setup-lin/main/setupmc.sh
    chmod +x ~/servers/minecraft/setup

    cd ~

    ;;

    steam|s)
    echo "Installing Dependencies . . ."
    # setupsteam
    sudo add-apt-repository multiverse
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install -y lib32gcc1 libtinfo5 libtinfo5:i386 steamcmd

    echo "Creating Folders and Scripts . . ."
    # createsteam
    mkdir ~/servers
    mkdir ~/servers/steam
    mkdir ~/servers/steam/steamcmd
    sudo ln -s /usr/games/steamcmd ~/servers/steam/steamcmd/steamcmd

    echo '#!/bin/sh' > ~/servers/steam/disableipv6
    echo 'sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1' >> ~/servers/steam/disableipv6
    echo 'sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1' >> ~/servers/steam/disableipv6
    chmod +x ~/servers/steam/disableipv6

    echo '#!/bin/sh' > ~/servers/steam/enableipv6
    echo 'sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0' >> ~/servers/steam/enableipv6
    echo 'sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0' >> ~/servers/steam/enableipv6
    chmod +x ~/servers/steam/enableipv6
    
    cd ~/servers/steam

    curl -o setup https://raw.githubusercontent.com/noahcou/server-setup-lin/main/setupsteam.sh

    chmod +x ~/servers/steam/setup

    cd ~

    ;;

    both|b)
    echo "Installing Dependencies for MC . . ."
    #setupmc
    sudo apt-get update
    sudo apt-get install -y openjdk-17-jdk-headless

    echo "Installing Dependencies for Steam . . ."
    # setupsteam
    sudo add-apt-repository multiverse
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install -y lib32gcc1 libtinfo5 libtinfo5:i386 steamcmd

    echo "Creating Folders and Scripts for MC . . ."
    # createmc
    mkdir ~/servers/
    mkdir ~/servers/minecraft

    cd ~/servers/minecraft

    curl -o setup https://raw.githubusercontent.com/noahcou/server-setup-lin/main/setupmc.sh
    chmod +x ~/servers/minecraft/setup

    cd ~


    echo "Creating Folders and Scripts for Steam . . ."
    # createsteam
    mkdir ~/servers
    mkdir ~/servers/steam
    mkdir ~/servers/steam/steamcmd
    sudo ln -s /usr/games/steamcmd ~/servers/steam/steamcmd/steamcmd

    echo '#!/bin/sh' > ~/servers/steam/disableipv6
    echo 'sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1' >> ~/servers/steam/disableipv6
    echo 'sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1' >> ~/servers/steam/disableipv6
    chmod +x ~/servers/steam/disableipv6

    echo '#!/bin/sh' > ~/servers/steam/enableipv6
    echo 'sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0' >> ~/servers/steam/enableipv6
    echo 'sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0' >> ~/servers/steam/enableipv6
    chmod +x ~/servers/steam/enableipv6
    
    cd ~/servers/steam

    curl -o setup https://raw.githubusercontent.com/noahcou/server-setup-lin/main/setupsteam.sh

    chmod +x ~/servers/steam/setup

    cd ~

    ;;

    *)
    echo "Here are the options (single letters are also accepted [m, s, b])"
    echo "minecraft - setup Minecraft server dependencies and folders"
    echo "steam - setup Steam server dependencies and folders as well as steamcmd"
    echo "both - run both of the options listed above"

    ;;
esac
