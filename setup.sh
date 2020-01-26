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
    echo '#!/bin/sh' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo 'd=$(date +%d-%m-%Y)' >> ~/servers/minecraft/setup.sh
    echo 'ver=""' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo 'if [ $# = 3 ]' >> ~/servers/minecraft/setup.sh
    echo 'then' >> ~/servers/minecraft/setup.sh
    echo '    ver=$3' >> ~/servers/minecraft/setup.sh
    echo 'else' >> ~/servers/minecraft/setup.sh
    echo '    ver=$2' >> ~/servers/minecraft/setup.sh
    echo 'fi' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo 'case $1 in' >> ~/servers/minecraft/setup.sh
    echo '    vanilla|v)' >> ~/servers/minecraft/setup.sh
    echo '        mkdir vanilla-$ver' >> ~/servers/minecraft/setup.sh
    echo '        curl https://noahcou.github.io/fishcurl/vanilla/$2/server.jar -o vanilla-$ver/server.jar' >> ~/servers/minecraft/setup.sh
    echo '        echo "java -jar server.jar -xmx 4G" >> vanilla-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        chmod +x vanilla-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "sudo screen ~/servers/minecraft/vanilla-$ver/start.sh -d -S vanilla-$ver" >> vanilla-$ver/screen.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '        echo "eula=true" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    paper|p)' >> ~/servers/minecraft/setup.sh
    echo '        mkdir paper-$ver' >> ~/servers/minecraft/setup.sh
    echo '        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar' >> ~/servers/minecraft/setup.sh
    echo '        echo "java -jar server.jar -xmx 8G" >> paper-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        chmod +x paper-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "sudo screen ~/servers/minecraft/paper-$ver/start.sh -d -S paper-$ver" >> paper-$ver/screen.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '        echo "eula=true" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    bedrock|b)' >> ~/servers/minecraft/setup.sh
    echo '        echo "TODO"' >> ~/servers/minecraft/setup.sh
    echo '        # mkdir /bedrock-$ver' >> ~/servers/minecraft/setup.sh
    echo '        # download tar.gz and extract it TODO' >> ~/servers/minecraft/setup.sh
    echo '        # curl https://noahcou.github.io/fishcurl/bedrock/$2/ -o /vanilla-$ver/server.jar' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    forge|f)' >> ~/servers/minecraft/setup.sh
    echo '        mkdir forge-$ver' >> ~/servers/minecraft/setup.sh
    echo '        curl https://noahcou.github.io/fishcurl/forge/$2/server.jar -o forge-$ver/server-$d.jar' >> ~/servers/minecraft/setup.sh
    echo '        echo "java -jar server.jar -xmx 12G" >> forge-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        chmod +x forge-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "sudo screen ~/servers/minecraft/forge-$ver/start.sh -d -S forge-$ver" >> forge-$ver/screen.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '        echo "eula=true" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    sponge|s)' >> ~/servers/minecraft/setup.sh
    echo '        echo "TODO"' >> ~/servers/minecraft/setup.sh
    echo '        # mkdir /sponge-$ver' >> ~/servers/minecraft/setup.sh
    echo '        # TODO' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    *)' >> ~/servers/minecraft/setup.sh
    echo '        echo "To check available versions for v, b, f; See:"' >> ~/servers/minecraft/setup.sh
    echo '        echo "https://noahcou.github.io/fishcurl/ OR"' >> ~/servers/minecraft/setup.sh
    echo '        echo "https://github.com/noahcou/fishcurl/"' >> ~/servers/minecraft/setup.sh
    echo '        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible"' >> ~/servers/minecraft/setup.sh
    echo '        echo "Here are the available options"' >> ~/servers/minecraft/setup.sh
    echo '        echo " - First Argument - (one letter also works!)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "vanilla - install a vanilla server (pulls from my own files)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "paper - install a paper plugin server"' >> ~/servers/minecraft/setup.sh
    echo '        echo "bedrock - install a bedrock server (pulls from my own files)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "forge - install a standard modded minecraft server (pulls from my own files)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "FORGE IS TIMESTAMPED SO YOU KNOW IF AN UPDATE IS NEEDED (updates are never required typically)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "sponge - install a modded plugin compatible server (in testing)"' >> ~/servers/minecraft/setup.sh
    echo '        echo " - Second Argument - "' >> ~/servers/minecraft/setup.sh
    echo '        echo "Put MC version here - 1.15.2 - Please use that standard format!"' >> ~/servers/minecraft/setup.sh
    echo '        echo " - Third Argument - (OPTIONAL)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "Optionally put a name for your server folder here"' >> ~/servers/minecraft/setup.sh
    echo '        echo "Default is /vanilla-1.15.2 (/type-version)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "If you include this Argument it will be /type-customtext"' >> ~/servers/minecraft/setup.sh
    echo '        echo "No Spaces"' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo 'esac' >> ~/servers/minecraft/setup.sh








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
    echo '#!/bin/sh' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo 'case $1 in' >> ~/servers/steam/setup.sh
    echo '    help|h|-h|-help) ' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '        echo "Here are the options"' >> ~/servers/steam/setup.sh
    echo '        echo "12345 - Appid of server, can be found at https://steamdb.info"' >> ~/servers/steam/setup.sh
    echo '        echo "text - Name of server folder; NO SPACES - required"' >> ~/servers/steam/setup.sh
    echo '        echo "OPTIONAL 3RD ARGUMENT"' >> ~/servers/steam/setup.sh
    echo '        echo "username - username for steam account for account required downloads"' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '    ;;' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '    *)' >> ~/servers/steam/setup.sh
    echo '        if [ $# -le 1 ]' >> ~/servers/steam/setup.sh
    echo '        then' >> ~/servers/steam/setup.sh
    echo '        echo "Here are the options"' >> ~/servers/steam/setup.sh
    echo '        echo "12345 - Appid of server, can be found at https://steamdb.info"' >> ~/servers/steam/setup.sh
    echo '        echo "text - Name of server folder; NO SPACES"' >> ~/servers/steam/setup.sh
    echo '        echo "OPTIONAL 3RD ARGUMENT"' >> ~/servers/steam/setup.sh
    echo '        echo "username - username for steam account for account required downloads"' >> ~/servers/steam/setup.sh
    echo '        return' >> ~/servers/steam/setup.sh
    echo '        fi' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '        if [ $# = 3 ]' >> ~/servers/steam/setup.sh
    echo '        then' >> ~/servers/steam/setup.sh
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup.sh
    echo '            mkdir $2' >> ~/servers/steam/setup.sh
    echo '            cd $2' >> ~/servers/steam/setup.sh
    echo '            echo "steamcmd +login $3 +app_update $1 validate +quit" >> update.sh' >> ~/servers/steam/setup.sh
    echo '            chmod +x update.sh' >> ~/servers/steam/setup.sh
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup.sh
    echo '            steamcmd +login $3 +app_update $1 validate +quit' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '            echo "Due to the complexity of steam servers a screen.sh will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup.sh
    echo '            echo "I personally use a start.sh that is then executed by the screen.sh for convenience!"' >> ~/servers/steam/setup.sh
    echo '            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen.sh' >> ~/servers/steam/setup.sh
    echo '            cd ..' >> ~/servers/steam/setup.sh
    echo '        else' >> ~/servers/steam/setup.sh
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup.sh
    echo '            mkdir $2' >> ~/servers/steam/setup.sh
    echo '            cd $2' >> ~/servers/steam/setup.sh
    echo '            echo "steamcmd +login anonymous +app_update $1 validate +quit" >> update.sh' >> ~/servers/steam/setup.sh
    echo '            chmod +x update.sh' >> ~/servers/steam/setup.sh
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup.sh
    echo '            steamcmd +login anonymous +app_update $1 validate +quit' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '            echo "Due to the complexity of steam servers a screen.sh will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup.sh
    echo '            echo "I personally use a start.sh that is then executed by the screen.sh for convenience!"' >> ~/servers/steam/setup.sh
    echo '            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen.sh' >> ~/servers/steam/setup.sh
    echo '            cd ..' >> ~/servers/steam/setup.sh
    echo '        fi' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '    ;;' >> ~/servers/steam/setup.sh
    echo 'esac' >> ~/servers/steam/setup.sh



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
    echo '#!/bin/sh' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo 'd=$(date +%d-%m-%Y)' >> ~/servers/minecraft/setup.sh
    echo 'ver=""' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo 'if [ $# = 3 ]' >> ~/servers/minecraft/setup.sh
    echo 'then' >> ~/servers/minecraft/setup.sh
    echo '    ver=$3' >> ~/servers/minecraft/setup.sh
    echo 'else' >> ~/servers/minecraft/setup.sh
    echo '    ver=$2' >> ~/servers/minecraft/setup.sh
    echo 'fi' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo 'case $1 in' >> ~/servers/minecraft/setup.sh
    echo '    vanilla|v)' >> ~/servers/minecraft/setup.sh
    echo '        mkdir vanilla-$ver' >> ~/servers/minecraft/setup.sh
    echo '        curl https://noahcou.github.io/fishcurl/vanilla/$2/server.jar -o vanilla-$ver/server.jar' >> ~/servers/minecraft/setup.sh
    echo '        echo "java -jar server.jar -xmx 4G" >> vanilla-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        chmod +x vanilla-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "sudo screen ~/servers/minecraft/vanilla-$ver/start.sh -d -S vanilla-$ver" >> vanilla-$ver/screen.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '        echo "eula=true" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    paper|p)' >> ~/servers/minecraft/setup.sh
    echo '        mkdir paper-$ver' >> ~/servers/minecraft/setup.sh
    echo '        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar' >> ~/servers/minecraft/setup.sh
    echo '        echo "java -jar server.jar -xmx 8G" >> paper-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        chmod +x paper-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "sudo screen ~/servers/minecraft/paper-$ver/start.sh -d -S paper-$ver" >> paper-$ver/screen.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '        echo "eula=true" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    bedrock|b)' >> ~/servers/minecraft/setup.sh
    echo '        echo "TODO"' >> ~/servers/minecraft/setup.sh
    echo '        # mkdir /bedrock-$ver' >> ~/servers/minecraft/setup.sh
    echo '        # download tar.gz and extract it TODO' >> ~/servers/minecraft/setup.sh
    echo '        # curl https://noahcou.github.io/fishcurl/bedrock/$2/ -o /vanilla-$ver/server.jar' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    forge|f)' >> ~/servers/minecraft/setup.sh
    echo '        mkdir forge-$ver' >> ~/servers/minecraft/setup.sh
    echo '        curl https://noahcou.github.io/fishcurl/forge/$2/server.jar -o forge-$ver/server-$d.jar' >> ~/servers/minecraft/setup.sh
    echo '        echo "java -jar server.jar -xmx 12G" >> forge-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        chmod +x forge-$ver/start.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "sudo screen ~/servers/minecraft/forge-$ver/start.sh -d -S forge-$ver" >> forge-$ver/screen.sh' >> ~/servers/minecraft/setup.sh
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '        echo "eula=true" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    sponge|s)' >> ~/servers/minecraft/setup.sh
    echo '        echo "TODO"' >> ~/servers/minecraft/setup.sh
    echo '        # mkdir /sponge-$ver' >> ~/servers/minecraft/setup.sh
    echo '        # TODO' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo '' >> ~/servers/minecraft/setup.sh
    echo '    *)' >> ~/servers/minecraft/setup.sh
    echo '        echo "To check available versions for v, b, f; See:"' >> ~/servers/minecraft/setup.sh
    echo '        echo "https://noahcou.github.io/fishcurl/ OR"' >> ~/servers/minecraft/setup.sh
    echo '        echo "https://github.com/noahcou/fishcurl/"' >> ~/servers/minecraft/setup.sh
    echo '        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible"' >> ~/servers/minecraft/setup.sh
    echo '        echo "Here are the available options"' >> ~/servers/minecraft/setup.sh
    echo '        echo " - First Argument - (one letter also works!)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "vanilla - install a vanilla server (pulls from my own files)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "paper - install a paper plugin server"' >> ~/servers/minecraft/setup.sh
    echo '        echo "bedrock - install a bedrock server (pulls from my own files)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "forge - install a standard modded minecraft server (pulls from my own files)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "FORGE IS TIMESTAMPED SO YOU KNOW IF AN UPDATE IS NEEDED (updates are never required typically)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "sponge - install a modded plugin compatible server (in testing)"' >> ~/servers/minecraft/setup.sh
    echo '        echo " - Second Argument - "' >> ~/servers/minecraft/setup.sh
    echo '        echo "Put MC version here - 1.15.2 - Please use that standard format!"' >> ~/servers/minecraft/setup.sh
    echo '        echo " - Third Argument - (OPTIONAL)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "Optionally put a name for your server folder here"' >> ~/servers/minecraft/setup.sh
    echo '        echo "Default is /vanilla-1.15.2 (/type-version)"' >> ~/servers/minecraft/setup.sh
    echo '        echo "If you include this Argument it will be /type-customtext"' >> ~/servers/minecraft/setup.sh
    echo '        echo "No Spaces"' >> ~/servers/minecraft/setup.sh
    echo '    ;;' >> ~/servers/minecraft/setup.sh
    echo 'esac' >> ~/servers/minecraft/setup.sh


    echo "Creating Folders and Scripts for Steam . . ."
    # createsteam
    mkdir ~/servers
    mkdir ~/servers/steam
    mkdir ~/servers/steam/steamcmd
    sudo ln -s /usr/games/steamcmd ~/servers/steam/steamcmd/steamcmd

    # code from setupsteam.sh echoed into a script
    echo '#!/bin/sh' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo 'case $1 in' >> ~/servers/steam/setup.sh
    echo '    help|h|-h|-help) ' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '        echo "Here are the options"' >> ~/servers/steam/setup.sh
    echo '        echo "12345 - Appid of server, can be found at https://steamdb.info"' >> ~/servers/steam/setup.sh
    echo '        echo "text - Name of server folder; NO SPACES - required"' >> ~/servers/steam/setup.sh
    echo '        echo "OPTIONAL 3RD ARGUMENT"' >> ~/servers/steam/setup.sh
    echo '        echo "username - username for steam account for account required downloads"' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '    ;;' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '    *)' >> ~/servers/steam/setup.sh
    echo '        if [ $# -le 1 ]' >> ~/servers/steam/setup.sh
    echo '        then' >> ~/servers/steam/setup.sh
    echo '        echo "Here are the options"' >> ~/servers/steam/setup.sh
    echo '        echo "12345 - Appid of server, can be found at https://steamdb.info"' >> ~/servers/steam/setup.sh
    echo '        echo "text - Name of server folder; NO SPACES"' >> ~/servers/steam/setup.sh
    echo '        echo "OPTIONAL 3RD ARGUMENT"' >> ~/servers/steam/setup.sh
    echo '        echo "username - username for steam account for account required downloads"' >> ~/servers/steam/setup.sh
    echo '        return' >> ~/servers/steam/setup.sh
    echo '        fi' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '        if [ $# = 3 ]' >> ~/servers/steam/setup.sh
    echo '        then' >> ~/servers/steam/setup.sh
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup.sh
    echo '            mkdir $2' >> ~/servers/steam/setup.sh
    echo '            cd $2' >> ~/servers/steam/setup.sh
    echo '            echo "steamcmd +login $3 +app_update $1 validate +quit" >> update.sh' >> ~/servers/steam/setup.sh
    echo '            chmod +x update.sh' >> ~/servers/steam/setup.sh
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup.sh
    echo '            steamcmd +login $3 +app_update $1 validate +quit' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '            echo "Due to the complexity of steam servers a screen.sh will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup.sh
    echo '            echo "I personally use a start.sh that is then executed by the screen.sh for convenience!"' >> ~/servers/steam/setup.sh
    echo '            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen.sh' >> ~/servers/steam/setup.sh
    echo '            cd ..' >> ~/servers/steam/setup.sh
    echo '        else' >> ~/servers/steam/setup.sh
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup.sh
    echo '            mkdir $2' >> ~/servers/steam/setup.sh
    echo '            cd $2' >> ~/servers/steam/setup.sh
    echo '            echo "steamcmd +login anonymous +app_update $1 validate +quit" >> update.sh' >> ~/servers/steam/setup.sh
    echo '            chmod +x update.sh' >> ~/servers/steam/setup.sh
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup.sh
    echo '            steamcmd +login anonymous +app_update $1 validate +quit' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '            echo "Due to the complexity of steam servers a screen.sh will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup.sh
    echo '            echo "I personally use a start.sh that is then executed by the screen.sh for convenience!"' >> ~/servers/steam/setup.sh
    echo '            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen.sh' >> ~/servers/steam/setup.sh
    echo '            cd ..' >> ~/servers/steam/setup.sh
    echo '        fi' >> ~/servers/steam/setup.sh
    echo '' >> ~/servers/steam/setup.sh
    echo '    ;;' >> ~/servers/steam/setup.sh
    echo 'esac' >> ~/servers/steam/setup.sh



    ;;

    *)
    echo "Here are the options"
    echo "setupmc - setup Minecraft server dependencies and folders"
    echo "setupsteam - setup Steam server dependencies and folders as well as steamcmd"
    echo "setupboth - run both of the above ^"

    ;;
esac