#!/bin/sh

case $1 in
    setupmc|minecraft|mc|m)
    echo "Installing Dependenices . . ."
    # setupmc
    sudo apt-get update
    sudo apt-get install default-jre-headless default-jdk-headless unzip

    echo "Creating Folders and Scripts . . ."
    # createmc
    mkdir ~/servers/
    mkdir ~/servers/minecraft

    if [ -f ~/servers/minecraft/setup ]
    then
        rm ~/servers/minecraft/setup
    fi

    # code from setupmc.sh echoed into a script
    echo '#!/bin/sh' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'ver=""' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'if [ $4 == "u" ]' >> ~/servers/minecraft/setup
    echo 'then' >> ~/servers/minecraft/setup
    echo '    ver=$3' >> ~/servers/minecraft/setup
    echo '    case $1 in # 'exit 130' to exit' >> ~/servers/minecraft/setup
    echo '        vanilla|v)' >> ~/servers/minecraft/setup
    echo '            echo "Vanilla does not require updates through this method, please use the normal method to download the new server"' >> ~/servers/minecraft/setup
    echo '            echo "Then simply copy the old world folder and server.properties over before starting up the new server"' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '        paper|p)' >> ~/servers/minecraft/setup
    echo '            echo "Updating Paper-$ver . . ."' >> ~/servers/minecraft/setup
    echo '            rm paper-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '            curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '        bedrock|b)' >> ~/servers/minecraft/setup
    echo '            echo "Bedrock does not require updates through this method, please use the normal method to download the new server"' >> ~/servers/minecraft/setup
    echo '            echo "Then simply copy the old world folder and server.properties over before starting up the new server"' >> ~/servers/minecraft/setup
    echo '            echo "(More may be required, I do not use bedrock that often)"' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '        forge|f)' >> ~/servers/minecraft/setup
    echo '            echo "Updating Forge-$ver . . ."' >> ~/servers/minecraft/setup
    echo '            rm forge-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '            curl https://noahcou.github.io/fishcurl/forge/$2/forge-installer.jar -o forge-$ver/installer.jar' >> ~/servers/minecraft/setup
    echo '            cd forge-$ver' >> ~/servers/minecraft/setup
    echo '            java -jar installer.jar --installServer' >> ~/servers/minecraft/setup
    echo '            rm installer.jar' >> ~/servers/minecraft/setup
    echo '            rm installer.jar.log' >> ~/servers/minecraft/setup
    echo '            mv forge-*.jar server.jar' >> ~/servers/minecraft/setup
    echo '            cd ..' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '        sponge|s)' >> ~/servers/minecraft/setup
    echo '            echo "Updating Sponge-$ver . . ."' >> ~/servers/minecraft/setup
    echo '            rm sponge-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '            curl https://noahcou.github.io/fishcurl/forge/$2/forge-installer.jar -o sponge-$ver/installer.jar' >> ~/servers/minecraft/setup
    echo '            cd sponge-$ver' >> ~/servers/minecraft/setup
    echo '            java -jar installer.jar --installServer' >> ~/servers/minecraft/setup
    echo '            rm installer.jar' >> ~/servers/minecraft/setup
    echo '            rm installer.jar.log' >> ~/servers/minecraft/setup
    echo '            mv forge-*.jar server.jar' >> ~/servers/minecraft/setup
    echo '            cd ..' >> ~/servers/minecraft/setup
    echo '            rm sponge-$ver/mods/sponge.jar' >> ~/servers/minecraft/setup
    echo '            curl https://noahcou.github.io/fishcurl/sponge/$2/sponge.jar -o sponge-$ver/mods/sponge.jar' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '    esac' >> ~/servers/minecraft/setup
    echo '    exit 130' >> ~/servers/minecraft/setup
    echo 'elif [ $# = 3 ]' >> ~/servers/minecraft/setup
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
    echo '        echo "java -Xmx4G -jar server.jar" >> vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/vanilla-$ver/start -S vanilla-$ver" >> vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    paper|p)' >> ~/servers/minecraft/setup
    echo '        mkdir paper-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx8G -jar server.jar" >> paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/paper-$ver/start -S paper-$ver" >> paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    bedrock|b)' >> ~/servers/minecraft/setup
    echo '        mkdir /bedrock-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/bedrock/$2/server.zip -o bedrock-server.zip' >> ~/servers/minecraft/setup
    echo '        unzip server.zip -d bedrock-$ver/' >> ~/servers/minecraft/setup
    echo '        rm server.zip' >> ~/servers/minecraft/setup
    echo '        echo "LD_LIBRARY_PATH=. ./bedrock_server" >> bedrock-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x bedrock-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/bedrock-$ver/start -S bedrock-$ver" >> bedrock-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x bedrock-$ver/screen' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    forge|f)' >> ~/servers/minecraft/setup
    echo '        mkdir forge-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/forge/$2/forge-installer.jar -o forge-$ver/installer.jar' >> ~/servers/minecraft/setup
    echo '        cd forge-$ver' >> ~/servers/minecraft/setup
    echo '        java -jar installer.jar --installServer' >> ~/servers/minecraft/setup
    echo '        rm installer.jar' >> ~/servers/minecraft/setup
    echo '        rm installer.jar.log' >> ~/servers/minecraft/setup
    echo '        mv forge-*.jar server.jar' >> ~/servers/minecraft/setup
    echo '        cd ..' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx10G -jar server.jar" >> forge-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x forge-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/forge-$ver/start -S forge-$ver" >> forge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x forge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    sponge|s)' >> ~/servers/minecraft/setup
    echo '        mkdir sponge-$ver' >> ~/servers/minecraft/setup
    echo '        mkdir sponge-$ver/mods' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/forge/$2/forge-installer.jar -o sponge-$ver/installer.jar' >> ~/servers/minecraft/setup
    echo '        cd sponge-$ver' >> ~/servers/minecraft/setup
    echo '        java -jar installer.jar --installServer' >> ~/servers/minecraft/setup
    echo '        rm installer.jar' >> ~/servers/minecraft/setup
    echo '        rm installer.jar.log' >> ~/servers/minecraft/setup
    echo '        mv forge-*.jar server.jar' >> ~/servers/minecraft/setup
    echo '        cd ..' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx12G -jar server.jar" >> sponge-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x sponge-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/sponge-$ver/start -S sponge-$ver" >> sponge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x sponge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> sponge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> sponge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/sponge/$2/sponge.jar -o sponge-$ver/mods/sponge.jar' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    *)' >> ~/servers/minecraft/setup
    echo '        echo "To check available versions for v, b, f, s; See:"' >> ~/servers/minecraft/setup
    echo '        echo "https://noahcou.github.io/fishcurl/ OR"' >> ~/servers/minecraft/setup
    echo '        echo "https://github.com/noahcou/fishcurl/"' >> ~/servers/minecraft/setup
    echo '        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible"' >> ~/servers/minecraft/setup
    echo '        echo "Here are the available options"' >> ~/servers/minecraft/setup
    echo '        echo " - First Argument - (one letter also works!)"' >> ~/servers/minecraft/setup
    echo '        echo "vanilla - install a vanilla server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "paper - install a paper plugin server"' >> ~/servers/minecraft/setup
    echo '        echo "bedrock - install a bedrock server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "forge - install a standard modded minecraft server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "sponge - install a modded plugin compatible server (in testing)"' >> ~/servers/minecraft/setup
    echo '        echo " - Second Argument - "' >> ~/servers/minecraft/setup
    echo '        echo "Put MC version here - 1.15.2 - Please use that standard format!"' >> ~/servers/minecraft/setup
    echo '        echo " - Third Argument - (OPTIONAL)"' >> ~/servers/minecraft/setup
    echo '        echo "Optionally put a name for your server folder here"' >> ~/servers/minecraft/setup
    echo '        echo "Default is /vanilla-1.15.2 (/type-version)"' >> ~/servers/minecraft/setup
    echo '        echo "If you include this Argument it will be /type-customtext"' >> ~/servers/minecraft/setup
    echo '        echo "No Spaces"' >> ~/servers/minecraft/setup
    echo '        echo " - Fourth Argument - (OPTIONAL)"' >> ~/servers/minecraft/setup
    echo '        echo "u - Update the server.jar, works for paper, forge, and sponge"' >> ~/servers/minecraft/setup
    echo '        echo "DO NOT USE when upgrading/changing the minecraft version"' >> ~/servers/minecraft/setup
    echo '        echo "Third argument becomes required, make it the same as your second argument if you did not use a custom name"' >> ~/servers/minecraft/setup
    echo '        echo "./setup p 1.15.2 1.15.2 u"' >> ~/servers/minecraft/setup
    echo '        echo "./setup p 1.15.2 coolserv u"' >> ~/servers/minecraft/setup
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

    if [ -f ~/servers/steam/setup ]
    then
        rm ~/servers/steam/setup
    fi

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
    echo '            echo "sudo screen ~/servers/steam/$2/APP -S $2" >> screen' >> ~/servers/steam/setup
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
    echo '            echo "sudo screen ~/servers/steam/$2/APP -S $2" >> screen' >> ~/servers/steam/setup
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
    sudo apt-get install default-jre-headless default-jdk-headless unzip

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

    if [ -f ~/servers/minecraft/setup ]
    then
        rm ~/servers/minecraft/setup
    fi

    # code from setupmc.sh echoed into a script
    echo '#!/bin/sh' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'ver=""' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'if [ $4 == "u" ]' >> ~/servers/minecraft/setup
    echo 'then' >> ~/servers/minecraft/setup
    echo '    ver=$3' >> ~/servers/minecraft/setup
    echo '    case $1 in # 'exit 130' to exit' >> ~/servers/minecraft/setup
    echo '        vanilla|v)' >> ~/servers/minecraft/setup
    echo '            echo "Vanilla does not require updates through this method, please use the normal method to download the new server"' >> ~/servers/minecraft/setup
    echo '            echo "Then simply copy the old world folder and server.properties over before starting up the new server"' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '        paper|p)' >> ~/servers/minecraft/setup
    echo '            echo "Updating Paper-$ver . . ."' >> ~/servers/minecraft/setup
    echo '            rm paper-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '            curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '        bedrock|b)' >> ~/servers/minecraft/setup
    echo '            echo "Bedrock does not require updates through this method, please use the normal method to download the new server"' >> ~/servers/minecraft/setup
    echo '            echo "Then simply copy the old world folder and server.properties over before starting up the new server"' >> ~/servers/minecraft/setup
    echo '            echo "(More may be required, I do not use bedrock that often)"' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '        forge|f)' >> ~/servers/minecraft/setup
    echo '            echo "Updating Forge-$ver . . ."' >> ~/servers/minecraft/setup
    echo '            rm forge-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '            curl https://noahcou.github.io/fishcurl/forge/$2/forge-installer.jar -o forge-$ver/installer.jar' >> ~/servers/minecraft/setup
    echo '            cd forge-$ver' >> ~/servers/minecraft/setup
    echo '            java -jar installer.jar --installServer' >> ~/servers/minecraft/setup
    echo '            rm installer.jar' >> ~/servers/minecraft/setup
    echo '            rm installer.jar.log' >> ~/servers/minecraft/setup
    echo '            mv forge-*.jar server.jar' >> ~/servers/minecraft/setup
    echo '            cd ..' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '        sponge|s)' >> ~/servers/minecraft/setup
    echo '            echo "Updating Sponge-$ver . . ."' >> ~/servers/minecraft/setup
    echo '            rm sponge-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '            curl https://noahcou.github.io/fishcurl/forge/$2/forge-installer.jar -o sponge-$ver/installer.jar' >> ~/servers/minecraft/setup
    echo '            cd sponge-$ver' >> ~/servers/minecraft/setup
    echo '            java -jar installer.jar --installServer' >> ~/servers/minecraft/setup
    echo '            rm installer.jar' >> ~/servers/minecraft/setup
    echo '            rm installer.jar.log' >> ~/servers/minecraft/setup
    echo '            mv forge-*.jar server.jar' >> ~/servers/minecraft/setup
    echo '            cd ..' >> ~/servers/minecraft/setup
    echo '            rm sponge-$ver/mods/sponge.jar' >> ~/servers/minecraft/setup
    echo '            curl https://noahcou.github.io/fishcurl/sponge/$2/sponge.jar -o sponge-$ver/mods/sponge.jar' >> ~/servers/minecraft/setup
    echo '        ;;' >> ~/servers/minecraft/setup
    echo '    esac' >> ~/servers/minecraft/setup
    echo '    exit 130' >> ~/servers/minecraft/setup
    echo 'elif [ $# = 3 ]' >> ~/servers/minecraft/setup
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
    echo '        echo "java -Xmx4G -jar server.jar" >> vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/vanilla-$ver/start -S vanilla-$ver" >> vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    paper|p)' >> ~/servers/minecraft/setup
    echo '        mkdir paper-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx8G -jar server.jar" >> paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/paper-$ver/start -S paper-$ver" >> paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    bedrock|b)' >> ~/servers/minecraft/setup
    echo '        mkdir /bedrock-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/bedrock/$2/server.zip -o bedrock-server.zip' >> ~/servers/minecraft/setup
    echo '        unzip server.zip -d bedrock-$ver/' >> ~/servers/minecraft/setup
    echo '        rm server.zip' >> ~/servers/minecraft/setup
    echo '        echo "LD_LIBRARY_PATH=. ./bedrock_server" >> bedrock-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x bedrock-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/bedrock-$ver/start -S bedrock-$ver" >> bedrock-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x bedrock-$ver/screen' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    forge|f)' >> ~/servers/minecraft/setup
    echo '        mkdir forge-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/forge/$2/forge-installer.jar -o forge-$ver/installer.jar' >> ~/servers/minecraft/setup
    echo '        cd forge-$ver' >> ~/servers/minecraft/setup
    echo '        java -jar installer.jar --installServer' >> ~/servers/minecraft/setup
    echo '        rm installer.jar' >> ~/servers/minecraft/setup
    echo '        rm installer.jar.log' >> ~/servers/minecraft/setup
    echo '        mv forge-*.jar server.jar' >> ~/servers/minecraft/setup
    echo '        cd ..' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx10G -jar server.jar" >> forge-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x forge-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/forge-$ver/start -S forge-$ver" >> forge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x forge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> forge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    sponge|s)' >> ~/servers/minecraft/setup
    echo '        mkdir sponge-$ver' >> ~/servers/minecraft/setup
    echo '        mkdir sponge-$ver/mods' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/forge/$2/forge-installer.jar -o sponge-$ver/installer.jar' >> ~/servers/minecraft/setup
    echo '        cd sponge-$ver' >> ~/servers/minecraft/setup
    echo '        java -jar installer.jar --installServer' >> ~/servers/minecraft/setup
    echo '        rm installer.jar' >> ~/servers/minecraft/setup
    echo '        rm installer.jar.log' >> ~/servers/minecraft/setup
    echo '        mv forge-*.jar server.jar' >> ~/servers/minecraft/setup
    echo '        cd ..' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx12G -jar server.jar" >> sponge-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x sponge-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "sudo screen ~/servers/minecraft/sponge-$ver/start -S sponge-$ver" >> sponge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x sponge-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> sponge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" >> sponge-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        curl https://noahcou.github.io/fishcurl/sponge/$2/sponge.jar -o sponge-$ver/mods/sponge.jar' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    *)' >> ~/servers/minecraft/setup
    echo '        echo "To check available versions for v, b, f, s; See:"' >> ~/servers/minecraft/setup
    echo '        echo "https://noahcou.github.io/fishcurl/ OR"' >> ~/servers/minecraft/setup
    echo '        echo "https://github.com/noahcou/fishcurl/"' >> ~/servers/minecraft/setup
    echo '        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible"' >> ~/servers/minecraft/setup
    echo '        echo "Here are the available options"' >> ~/servers/minecraft/setup
    echo '        echo " - First Argument - (one letter also works!)"' >> ~/servers/minecraft/setup
    echo '        echo "vanilla - install a vanilla server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "paper - install a paper plugin server"' >> ~/servers/minecraft/setup
    echo '        echo "bedrock - install a bedrock server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "forge - install a standard modded minecraft server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "sponge - install a modded plugin compatible server (in testing)"' >> ~/servers/minecraft/setup
    echo '        echo " - Second Argument - "' >> ~/servers/minecraft/setup
    echo '        echo "Put MC version here - 1.15.2 - Please use that standard format!"' >> ~/servers/minecraft/setup
    echo '        echo " - Third Argument - (OPTIONAL)"' >> ~/servers/minecraft/setup
    echo '        echo "Optionally put a name for your server folder here"' >> ~/servers/minecraft/setup
    echo '        echo "Default is /vanilla-1.15.2 (/type-version)"' >> ~/servers/minecraft/setup
    echo '        echo "If you include this Argument it will be /type-customtext"' >> ~/servers/minecraft/setup
    echo '        echo "No Spaces"' >> ~/servers/minecraft/setup
    echo '        echo " - Fourth Argument - (OPTIONAL)"' >> ~/servers/minecraft/setup
    echo '        echo "u - Update the server.jar, works for paper, forge, and sponge"' >> ~/servers/minecraft/setup
    echo '        echo "DO NOT USE when upgrading/changing the minecraft version"' >> ~/servers/minecraft/setup
    echo '        echo "Third argument becomes required, make it the same as your second argument if you did not use a custom name"' >> ~/servers/minecraft/setup
    echo '        echo "./setup p 1.15.2 1.15.2 u"' >> ~/servers/minecraft/setup
    echo '        echo "./setup p 1.15.2 coolserv u"' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo 'esac' >> ~/servers/minecraft/setup

    chmod +x ~/servers/minecraft/setup


    echo "Creating Folders and Scripts for Steam . . ."
    # createsteam
    mkdir ~/servers
    mkdir ~/servers/steam
    mkdir ~/servers/steam/steamcmd
    sudo ln -s /usr/games/steamcmd ~/servers/steam/steamcmd/steamcmd

    if [ -f ~/servers/steam/setup ]
    then
        rm ~/servers/steam/setup
    fi

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
    echo '            echo "sudo screen ~/servers/steam/$2/APP -S $2" >> screen' >> ~/servers/steam/setup
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
    echo '            echo "sudo screen ~/servers/steam/$2/APP -S $2" >> screen' >> ~/servers/steam/setup
    echo '            chmod +x screen' >> ~/servers/steam/setup
    echo '            cd ..' >> ~/servers/steam/setup
    echo '        fi' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '    ;;' >> ~/servers/steam/setup
    echo 'esac' >> ~/servers/steam/setup

    chmod +x ~/servers/steam/setup

    ;;

    *)
    echo "Here are the options (single letters are also accepted [mc, s, b]"
    echo "setupmc - setup Minecraft server dependencies and folders"
    echo "setupsteam - setup Steam server dependencies and folders as well as steamcmd"
    echo "setupboth - run both of the above ^"

    ;;
esac