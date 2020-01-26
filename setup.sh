#!/bin/sh

case $1 in
    setupmc|mc)
    echo "Installing Dependenices . . ."
    # setupmc
    sudo apt-get update
    sudo apt-get install default-jre-headless default-jdk-headless

    echo "Creating Folders and Scripts . . ."
    # createmc
    mkdir ~/servers/
    mkdir ~/servers/minecraft

    # code from setupmc.sh echoed into a script
    echo '#!/bin/sh' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'd=$(date +%d-%m-%Y)' >> ~/servers/minecraft/setup
    echo 'ver=""' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'if [ $# = 3 ]' >> ~/servers/minecraft/setup
    echo 'then' >> ~/servers/minecraft/setup
    echo '    ver=$3' >> ~/servers/minecraft/setup
    echo 'else' >> ~/servers/minecraft/setup
    echo '    ver=$2' >> ~/servers/minecraft/setup
    echo 'fi' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'case $1 in' >> ~/servers/minecraft/setup
    echo '    vanilla|v)' >> ~/servers/minecraft/setup
    echo '        mkdir vanilla-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/vanilla/$2/server.jar -o vanilla-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -xmx4G -jar server.jar" >> vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/vanilla-$ver/start -dm -S vanilla-$ver" >> vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    paper|p)' >> ~/servers/minecraft/setup
    echo '        mkdir paper-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -xmx8G -jar server.jar" >> paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/paper-$ver/start -dm -S paper-$ver" >> paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    bedrock|b)' >> ~/servers/minecraft/setup
    echo '        echo "TODO"' >> ~/servers/minecraft/setup
    echo '        # mkdir /bedrock-$ver' >> ~/servers/minecraft/setup
    echo '        # download tar.gz and extract it TODO' >> ~/servers/minecraft/setup
    echo '        # curl https://noahcou.github.io/fishcurl/bedrock/$2/ -o /vanilla-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    forge|f)' >> ~/servers/minecraft/setup
    echo '        mkdir forge-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/forge/$2/server.jar -o forge-$ver/server-$d.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -xmx12G -jar server-$d.jar" >> forge-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x forge-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/forge-$ver/start -dm -S forge-$ver" >> forge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x forge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    sponge|s)' >> ~/servers/minecraft/setup
    echo '        echo "TODO"' >> ~/servers/minecraft/setup
    echo '        # mkdir /sponge-$ver' >> ~/servers/minecraft/setup
    echo '        # TODO' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    *)' >> ~/servers/minecraft/setup
    echo '        echo "To check available versions for v, b, f; See:"' >> ~/servers/minecraft/setup
    echo '        echo "https://noahcou.github.io/fishcurl/ OR"' >> ~/servers/minecraft/setup
    echo '        echo "https://github.com/noahcou/fishcurl/"' >> ~/servers/minecraft/setup
    echo '        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible"' >> ~/servers/minecraft/setup
    echo '        echo "Here are the available options"' >> ~/servers/minecraft/setup
    echo '        echo " - First Argument - (one letter also works!)"' >> ~/servers/minecraft/setup
    echo '        echo "vanilla - install a vanilla server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "paper - install a paper plugin server"' >> ~/servers/minecraft/setup
    echo '        echo "bedrock - install a bedrock server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "forge - install a standard modded minecraft server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "FORGE IS TIMESTAMPED SO YOU KNOW IF AN UPDATE IS NEEDED (updates are never required typically)"' >> ~/servers/minecraft/setup
    echo '        echo "sponge - install a modded plugin compatible server (in testing)"' >> ~/servers/minecraft/setup
    echo '        echo " - Second Argument - "' >> ~/servers/minecraft/setup
    echo '        echo "Put MC version here - 1.15.2 - Please use that standard format!"' >> ~/servers/minecraft/setup
    echo '        echo " - Third Argument - (OPTIONAL)"' >> ~/servers/minecraft/setup
    echo '        echo "Optionally put a name for your server folder here"' >> ~/servers/minecraft/setup
    echo '        echo "Default is /vanilla-1.15.2 (/type-version)"' >> ~/servers/minecraft/setup
    echo '        echo "If you include this Argument it will be /type-customtext"' >> ~/servers/minecraft/setup
    echo '        echo "No Spaces"' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo 'esac' >> ~/servers/minecraft/setup



    chmod +x ~/servers/minecraft/setup
    ;;

    setupsteam|steam|s)
    echo "Installing Dependencies . . ."
    # setupsteam
    sudo add-apt-repository multiverse
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install lib32gcc1 steamcmd

    echo "Creating Folders and Scripts . . ."
    # createsteam
    mkdir ~/servers
    mkdir ~/servers/steam
    mkdir ~/servers/steam/steamcmd
    sudo ln -s /usr/games/steamcmd ~/servers/steam/steamcmd/steamcmd

    # code from setupsteam.sh echoed into a script
    echo '#!/bin/sh' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo 'case $1 in' >> ~/servers/steam/setup
    echo '    help|h|-h|-help) ' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '        echo "Here are the options"' >> ~/servers/steam/setup
    echo '        echo "12345 - Appid of server, can be found at https://steamdb.info"' >> ~/servers/steam/setup
    echo '        echo "text - Name of server folder; NO SPACES - required"' >> ~/servers/steam/setup
    echo '        echo "OPTIONAL 3RD ARGUMENT"' >> ~/servers/steam/setup
    echo '        echo "username - username for steam account for account required downloads"' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '    ;;' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '    *)' >> ~/servers/steam/setup
    echo '        if [ $# -le 1 ]' >> ~/servers/steam/setup
    echo '        then' >> ~/servers/steam/setup
    echo '        echo "Here are the options"' >> ~/servers/steam/setup
    echo '        echo "12345 - Appid of server, can be found at https://steamdb.info"' >> ~/servers/steam/setup
    echo '        echo "text - Name of server folder; NO SPACES"' >> ~/servers/steam/setup
    echo '        echo "OPTIONAL 3RD ARGUMENT"' >> ~/servers/steam/setup
    echo '        echo "username - username for steam account for account required downloads"' >> ~/servers/steam/setup
    echo '        return' >> ~/servers/steam/setup
    echo '        fi' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '        if [ $# = 3 ]' >> ~/servers/steam/setup
    echo '        then' >> ~/servers/steam/setup
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup
    echo '            mkdir $2' >> ~/servers/steam/setup
    echo '            cd $2' >> ~/servers/steam/setup
    echo '            echo "steamcmd +login $3 +app_update $1 validate +quit" >> update' >> ~/servers/steam/setup
    echo '            chmod +x update' >> ~/servers/steam/setup
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup
    echo '            steamcmd +login $3 +app_update $1 validate +quit' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup
    echo '            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"' >> ~/servers/steam/setup
    echo '            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen' >> ~/servers/steam/setup
    echo '            chmod +x screen' >> ~/servers/steam/setup
    echo '            cd ..' >> ~/servers/steam/setup
    echo '        else' >> ~/servers/steam/setup
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup
    echo '            mkdir $2' >> ~/servers/steam/setup
    echo '            cd $2' >> ~/servers/steam/setup
    echo '            echo "steamcmd +login anonymous +app_update $1 validate +quit" >> update' >> ~/servers/steam/setup
    echo '            chmod +x update' >> ~/servers/steam/setup
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup
    echo '            steamcmd +login anonymous +app_update $1 validate +quit' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup
    echo '            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"' >> ~/servers/steam/setup
    echo '            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen' >> ~/servers/steam/setup
    echo '            chmod +x screen' >> ~/servers/steam/setup
    echo '            cd ..' >> ~/servers/steam/setup
    echo '        fi' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '    ;;' >> ~/servers/steam/setup
    echo 'esac' >> ~/servers/steam/setup

    chmod +x ~/servers/steam/setup

    ;;

    setupboth|both|b)
    echo "Installing Dependencies for MC . . ."
    #setupmc
    sudo apt-get update
    sudo apt-get install default-jre-headless default-jdk-headless

    echo "Installing Dependencies for Steam . . ."
    # setupsteam
    sudo add-apt-repository multiverse
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install lib32gcc1 steamcmd

    echo "Creating Folders and Scripts for MC . . ."
    # createmc
    mkdir ~/servers/
    mkdir ~/servers/minecraft

    # code from setupmc.sh echoed into a script
    echo '#!/bin/sh' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'd=$(date +%d-%m-%Y)' >> ~/servers/minecraft/setup
    echo 'ver=""' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'if [ $# = 3 ]' >> ~/servers/minecraft/setup
    echo 'then' >> ~/servers/minecraft/setup
    echo '    ver=$3' >> ~/servers/minecraft/setup
    echo 'else' >> ~/servers/minecraft/setup
    echo '    ver=$2' >> ~/servers/minecraft/setup
    echo 'fi' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'case $1 in' >> ~/servers/minecraft/setup
    echo '    vanilla|v)' >> ~/servers/minecraft/setup
    echo '        mkdir vanilla-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/vanilla/$2/server.jar -o vanilla-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -xmx4G -jar server.jar" >> vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/vanilla-$ver/start -dm -S vanilla-$ver" >> vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    paper|p)' >> ~/servers/minecraft/setup
    echo '        mkdir paper-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -xmx8G -jar server.jar" >> paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/paper-$ver/start -dm -S paper-$ver" >> paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    bedrock|b)' >> ~/servers/minecraft/setup
    echo '        echo "TODO"' >> ~/servers/minecraft/setup
    echo '        # mkdir /bedrock-$ver' >> ~/servers/minecraft/setup
    echo '        # download tar.gz and extract it TODO' >> ~/servers/minecraft/setup
    echo '        # curl https://noahcou.github.io/fishcurl/bedrock/$2/ -o /vanilla-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    forge|f)' >> ~/servers/minecraft/setup
    echo '        mkdir forge-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/forge/$2/server.jar -o forge-$ver/server-$d.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -xmx12G -jar server-$d.jar" >> forge-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x forge-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/forge-$ver/start -dm -S forge-$ver" >> forge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x forge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    sponge|s)' >> ~/servers/minecraft/setup
    echo '        echo "TODO"' >> ~/servers/minecraft/setup
    echo '        # mkdir /sponge-$ver' >> ~/servers/minecraft/setup
    echo '        # TODO' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    *)' >> ~/servers/minecraft/setup
    echo '        echo "To check available versions for v, b, f; See:"' >> ~/servers/minecraft/setup
    echo '        echo "https://noahcou.github.io/fishcurl/ OR"' >> ~/servers/minecraft/setup
    echo '        echo "https://github.com/noahcou/fishcurl/"' >> ~/servers/minecraft/setup
    echo '        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible"' >> ~/servers/minecraft/setup
    echo '        echo "Here are the available options"' >> ~/servers/minecraft/setup
    echo '        echo " - First Argument - (one letter also works!)"' >> ~/servers/minecraft/setup
    echo '        echo "vanilla - install a vanilla server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "paper - install a paper plugin server"' >> ~/servers/minecraft/setup
    echo '        echo "bedrock - install a bedrock server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "forge - install a standard modded minecraft server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "FORGE IS TIMESTAMPED SO YOU KNOW IF AN UPDATE IS NEEDED (updates are never required typically)"' >> ~/servers/minecraft/setup
    echo '        echo "sponge - install a modded plugin compatible server (in testing)"' >> ~/servers/minecraft/setup
    echo '        echo " - Second Argument - "' >> ~/servers/minecraft/setup
    echo '        echo "Put MC version here - 1.15.2 - Please use that standard format!"' >> ~/servers/minecraft/setup
    echo '        echo " - Third Argument - (OPTIONAL)"' >> ~/servers/minecraft/setup
    echo '        echo "Optionally put a name for your server folder here"' >> ~/servers/minecraft/setup
    echo '        echo "Default is /vanilla-1.15.2 (/type-version)"' >> ~/servers/minecraft/setup
    echo '        echo "If you include this Argument it will be /type-customtext"' >> ~/servers/minecraft/setup
    echo '        echo "No Spaces"' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo 'esac' >> ~/servers/minecraft/setup


    chmod +x ~/servers/minecraft/setup


    echo "Creating Folders and Scripts for Steam . . ."
    # createsteam
    mkdir ~/servers
    mkdir ~/servers/steam
    mkdir ~/servers/steam/steamcmd
    sudo ln -s /usr/games/steamcmd ~/servers/steam/steamcmd/steamcmd

    # code from setupsteam.sh echoed into a script
    echo '#!/bin/sh' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo 'case $1 in' >> ~/servers/steam/setup
    echo '    help|h|-h|-help) ' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '        echo "Here are the options"' >> ~/servers/steam/setup
    echo '        echo "12345 - Appid of server, can be found at https://steamdb.info"' >> ~/servers/steam/setup
    echo '        echo "text - Name of server folder; NO SPACES - required"' >> ~/servers/steam/setup
    echo '        echo "OPTIONAL 3RD ARGUMENT"' >> ~/servers/steam/setup
    echo '        echo "username - username for steam account for account required downloads"' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '    ;;' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '    *)' >> ~/servers/steam/setup
    echo '        if [ $# -le 1 ]' >> ~/servers/steam/setup
    echo '        then' >> ~/servers/steam/setup
    echo '        echo "Here are the options"' >> ~/servers/steam/setup
    echo '        echo "12345 - Appid of server, can be found at https://steamdb.info"' >> ~/servers/steam/setup
    echo '        echo "text - Name of server folder; NO SPACES"' >> ~/servers/steam/setup
    echo '        echo "OPTIONAL 3RD ARGUMENT"' >> ~/servers/steam/setup
    echo '        echo "username - username for steam account for account required downloads"' >> ~/servers/steam/setup
    echo '        return' >> ~/servers/steam/setup
    echo '        fi' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '        if [ $# = 3 ]' >> ~/servers/steam/setup
    echo '        then' >> ~/servers/steam/setup
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup
    echo '            mkdir $2' >> ~/servers/steam/setup
    echo '            cd $2' >> ~/servers/steam/setup
    echo '            echo "steamcmd +login $3 +app_update $1 validate +quit" >> update' >> ~/servers/steam/setup
    echo '            chmod +x update' >> ~/servers/steam/setup
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup
    echo '            steamcmd +login $3 +app_update $1 validate +quit' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup
    echo '            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"' >> ~/servers/steam/setup
    echo '            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen' >> ~/servers/steam/setup
    echo '            chmod +x screen' >> ~/servers/steam/setup
    echo '            cd ..' >> ~/servers/steam/setup
    echo '        else' >> ~/servers/steam/setup
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup
    echo '            mkdir $2' >> ~/servers/steam/setup
    echo '            cd $2' >> ~/servers/steam/setup
    echo '            echo "steamcmd +login anonymous +app_update $1 validate +quit" >> update' >> ~/servers/steam/setup
    echo '            chmod +x update' >> ~/servers/steam/setup
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup
    echo '            steamcmd +login anonymous +app_update $1 validate +quit' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup
    echo '            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"' >> ~/servers/steam/setup
    echo '            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen' >> ~/servers/steam/setup
    echo '            chmod +x screen' >> ~/servers/steam/setup
    echo '            cd ..' >> ~/servers/steam/setup
    echo '        fi' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '    ;;' >> ~/servers/steam/setup
    echo 'esac' >> ~/servers/steam/setup

    chmod +x ~/servers/steam/setup

    ;;

    *)
    echo "Here are the options"
    echo "setupmc - setup Minecraft server dependencies and folders"
    echo "setupsteam - setup Steam server dependencies and folders as well as steamcmd"
    echo "setupboth - run both of the above ^"

    ;;
esac