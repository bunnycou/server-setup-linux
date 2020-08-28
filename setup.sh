#!/bin/sh

case $1 in
    setupmc|minecraft|mc|m)
    echo "Installing Dependenices . . ."
    # setupmc
    sudo apt-get update
    sudo apt-get install openjdk-8-jre-headless openjdk-8-jdk-headless unzip

    echo "Creating Folders and Scripts . . ."
    # createmc
    mkdir ~/servers/
    mkdir ~/servers/minecraft

    # code from setupmc.sh echoed into a script
    echo '#!/bin/sh' > ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'ver=""' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'if [ $# = 4 ]' >> ~/servers/minecraft/setup
    echo 'then' >> ~/servers/minecraft/setup
    echo '    if [ $4 = "u" ]' >> ~/servers/minecraft/setup
    echo '    then' >> ~/servers/minecraft/setup
    echo '        ver=$3' >> ~/servers/minecraft/setup
    echo '        case $1 in # 'exit 130' to exit' >> ~/servers/minecraft/setup
    echo '            vanilla|v)' >> ~/servers/minecraft/setup
    echo '                echo "Vanilla does not require updates through this method, please use the normal method to download the new server"' >> ~/servers/minecraft/setup
    echo '                echo "Then simply copy the old world folder and server.properties over before starting up the new server"' >> ~/servers/minecraft/setup
    echo '            ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '            paper|p)' >> ~/servers/minecraft/setup
    echo '                echo "Updating Paper-$ver . . ."' >> ~/servers/minecraft/setup
    echo '                rm paper-$ver/server-*.jar' >> ~/servers/minecraft/setup
    echo '                curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server-$2.jar' >> ~/servers/minecraft/setup
    echo '            ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '            waterfall|w)' >> ~/servers/minecraft/setup
    echo '                echo "updating Waterfall!"' >> ~/servers/minecraft/setup
    echo '                rm waterfall-$ver/waterfall-*.jar' >> ~/servers/minecraft/setup
    echo '                curl https://papermc.io/api/v1/waterfall/$2/latest/download -0 waterfall-$ver/waterfall-$2.jar' >> ~/servers/minecraft/setup
    echo '            ;;' >> ~/servers/minecraft/setup
    echo '        esac' >> ~/servers/minecraft/setup
    echo '        exit 130' >> ~/servers/minecraft/setup
    echo '    fi' >> ~/servers/minecraft/setup
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
    echo '        curl https://noahcou.github.io/fishcurl/vanilla/$2/server.jar -o vanilla-$ver/server-$2.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx4G -jar server-$2.jar" > vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "screen -dmS vanilla-$ver ~/servers/minecraft/vanilla-$ver/start" > vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" > vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" > vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    paper|p)' >> ~/servers/minecraft/setup
    echo '        mkdir paper-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server-$2.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx8G -jar server-$2.jar" > paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "screen -dmS paper-$ver ~/servers/minecraft/paper-$ver/start" > paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" > paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" > paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    waterfall|w)' >> ~/servers/minecraft/setup
    echo '        mkdir waterfall-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://papermc.io/api/v1/waterfall/$2/latest/download -o waterfall-$ver/waterfall-$2.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -jar waterfall-$2.jar" > waterfall-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x waterfall-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "screen -dmS waterfall-$ver ~/servers/minecraft/waterfall-$ver/start" > waterfall-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x waterfall-$ver/screen' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    *)' >> ~/servers/minecraft/setup
    echo '        echo "To check available versions for v; See:"' >> ~/servers/minecraft/setup
    echo '        echo "https://noahcou.github.io/fishcurl/ OR"' >> ~/servers/minecraft/setup
    echo '        echo "https://github.com/noahcou/fishcurl/"' >> ~/servers/minecraft/setup
    echo '        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible I believe (maybe not)"' >> ~/servers/minecraft/setup
    echo '        echo "Here are the available options"' >> ~/servers/minecraft/setup
    echo '        echo " - First Argument - (one letter also works!)"' >> ~/servers/minecraft/setup
    echo '        echo "vanilla - install a vanilla server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "paper - install a paper plugin server"' >> ~/servers/minecraft/setup
    echo '        echo "waterfall - install a waterfall server - versioning is 1.15 not 1.15.2!"' >> ~/servers/minecraft/setup
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
    sudo apt-get install lib32gcc1 libtinfo5 libtinfo5:i386 steamcmd

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

    # code from setupsteam.sh echoed into a script
    echo '#!/bin/sh' > ~/servers/steam/setup
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
    echo '            echo "~/servers/steam/disableipv6" >> update' >> ~/servers/steam/setup
    echo '            echo "steamcmd +login $3 +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit" >> update' >> ~/servers/steam/setup
    echo '            chmod +x update' >> ~/servers/steam/setup
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup
    echo '            ~/servers/steam/disableipv6' >> ~/servers/steam/setup
    echo '            steamcmd +login $3 +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup
    echo '            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"' >> ~/servers/steam/setup
    echo '            echo "screen -dmS $2 ~/servers/steam/$2/start" >> screen' >> ~/servers/steam/setup
    echo '            chmod +x screen' >> ~/servers/steam/setup
    echo '            cd ..' >> ~/servers/steam/setup
    echo '        else' >> ~/servers/steam/setup
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup
    echo '            mkdir $2' >> ~/servers/steam/setup
    echo '            cd $2' >> ~/servers/steam/setup
    echo '            echo "~/servers/steam/disableipv6" >> update' >> ~/servers/steam/setup
    echo '            echo "steamcmd +login anonymous +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit" >> update' >> ~/servers/steam/setup
    echo '            chmod +x update' >> ~/servers/steam/setup
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup
    echo '            ~/servers/steam/disableipv6' >> ~/servers/steam/setup
    echo '            steamcmd +login anonymous +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup
    echo '            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"' >> ~/servers/steam/setup
    echo '            echo "screen -dmS $2 ~/servers/steam/$2/start" >> screen' >> ~/servers/steam/setup
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
    sudo apt-get install openjdk-8-jre-headless openjdk-8-jdk-headless unzip

    echo "Installing Dependencies for Steam . . ."
    # setupsteam
    sudo add-apt-repository multiverse
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get install lib32gcc1 libtinfo5 libtinfo5:i386 steamcmd

    echo "Creating Folders and Scripts for MC . . ."
    # createmc
    mkdir ~/servers/
    mkdir ~/servers/minecraft

    # code from setupmc.sh echoed into a script
    echo '#!/bin/sh' > ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'ver=""' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo 'if [ $# = 4 ]' >> ~/servers/minecraft/setup
    echo 'then' >> ~/servers/minecraft/setup
    echo '    if [ $4 = "u" ]' >> ~/servers/minecraft/setup
    echo '    then' >> ~/servers/minecraft/setup
    echo '        ver=$3' >> ~/servers/minecraft/setup
    echo '        case $1 in # 'exit 130' to exit' >> ~/servers/minecraft/setup
    echo '            vanilla|v)' >> ~/servers/minecraft/setup
    echo '                echo "Vanilla does not require updates through this method, please use the normal method to download the new server"' >> ~/servers/minecraft/setup
    echo '                echo "Then simply copy the old world folder and server.properties over before starting up the new server"' >> ~/servers/minecraft/setup
    echo '            ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '            paper|p)' >> ~/servers/minecraft/setup
    echo '                echo "Updating Paper-$ver . . ."' >> ~/servers/minecraft/setup
    echo '                rm paper-$ver/server-*.jar' >> ~/servers/minecraft/setup
    echo '                curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server-$2.jar' >> ~/servers/minecraft/setup
    echo '            ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '            waterfall|w)' >> ~/servers/minecraft/setup
    echo '                echo "updating Waterfall!"' >> ~/servers/minecraft/setup
    echo '                rm waterfall-$ver/waterfall-*.jar' >> ~/servers/minecraft/setup
    echo '                curl https://papermc.io/api/v1/waterfall/$2/latest/download -0 waterfall-$ver/waterfall-$2.jar' >> ~/servers/minecraft/setup
    echo '            ;;' >> ~/servers/minecraft/setup
    echo '        esac' >> ~/servers/minecraft/setup
    echo '        exit 130' >> ~/servers/minecraft/setup
    echo '    fi' >> ~/servers/minecraft/setup
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
    echo '        curl https://noahcou.github.io/fishcurl/vanilla/$2/server.jar -o vanilla-$ver/server-$2.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx4G -jar server-$2.jar" > vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "screen -dmS vanilla-$ver ~/servers/minecraft/vanilla-$ver/start" > vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x vanilla-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" > vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" > vanilla-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    paper|p)' >> ~/servers/minecraft/setup
    echo '        mkdir paper-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server-$2.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -Xmx8G -jar server-$2.jar" > paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "screen -dmS paper-$ver ~/servers/minecraft/paper-$ver/start" > paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x paper-$ver/screen' >> ~/servers/minecraft/setup
    echo '        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" > paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '        echo "eula=true" > paper-$ver/eula.txt' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    waterfall|w)' >> ~/servers/minecraft/setup
    echo '        mkdir waterfall-$ver' >> ~/servers/minecraft/setup
    echo '        curl https://papermc.io/api/v1/waterfall/$2/latest/download -o waterfall-$ver/waterfall-$2.jar' >> ~/servers/minecraft/setup
    echo '        echo "java -jar waterfall-$2.jar" > waterfall-$ver/start' >> ~/servers/minecraft/setup
    echo '        chmod +x waterfall-$ver/start' >> ~/servers/minecraft/setup
    echo '        echo "screen -dmS waterfall-$ver ~/servers/minecraft/waterfall-$ver/start" > waterfall-$ver/screen' >> ~/servers/minecraft/setup
    echo '        chmod +x waterfall-$ver/screen' >> ~/servers/minecraft/setup
    echo '    ;;' >> ~/servers/minecraft/setup
    echo '' >> ~/servers/minecraft/setup
    echo '    *)' >> ~/servers/minecraft/setup
    echo '        echo "To check available versions for v; See:"' >> ~/servers/minecraft/setup
    echo '        echo "https://noahcou.github.io/fishcurl/ OR"' >> ~/servers/minecraft/setup
    echo '        echo "https://github.com/noahcou/fishcurl/"' >> ~/servers/minecraft/setup
    echo '        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible I believe (maybe not)"' >> ~/servers/minecraft/setup
    echo '        echo "Here are the available options"' >> ~/servers/minecraft/setup
    echo '        echo " - First Argument - (one letter also works!)"' >> ~/servers/minecraft/setup
    echo '        echo "vanilla - install a vanilla server (pulls from my own files)"' >> ~/servers/minecraft/setup
    echo '        echo "paper - install a paper plugin server"' >> ~/servers/minecraft/setup
    echo '        echo "waterfall - install a waterfall server - versioning is 1.15 not 1.15.2!"' >> ~/servers/minecraft/setup
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

    echo '#!/bin/sh' > ~/servers/steam/disableipv6
    echo 'sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1' >> ~/servers/steam/disableipv6
    echo 'sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1' >> ~/servers/steam/disableipv6
    chmod +x ~/servers/steam/disableipv6

    echo '#!/bin/sh' > ~/servers/steam/enableipv6
    echo 'sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0' >> ~/servers/steam/enableipv6
    echo 'sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0' >> ~/servers/steam/enableipv6
    chmod +x ~/servers/steam/enableipv6

    # code from setupsteam.sh echoed into a script
    echo '#!/bin/sh' > ~/servers/steam/setup
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
    echo '            echo "~/servers/steam/disableipv6" >> update' >> ~/servers/steam/setup
    echo '            echo "steamcmd +login $3 +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit" >> update' >> ~/servers/steam/setup
    echo '            chmod +x update' >> ~/servers/steam/setup
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup
    echo '            ~/servers/steam/disableipv6' >> ~/servers/steam/setup
    echo '            steamcmd +login $3 +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup
    echo '            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"' >> ~/servers/steam/setup
    echo '            echo "screen -dmS $2 ~/servers/steam/$2/start" >> screen' >> ~/servers/steam/setup
    echo '            chmod +x screen' >> ~/servers/steam/setup
    echo '            cd ..' >> ~/servers/steam/setup
    echo '        else' >> ~/servers/steam/setup
    echo '            echo "Setting up $2 . . ."' >> ~/servers/steam/setup
    echo '            mkdir $2' >> ~/servers/steam/setup
    echo '            cd $2' >> ~/servers/steam/setup
    echo '            echo "~/servers/steam/disableipv6" >> update' >> ~/servers/steam/setup
    echo '            echo "steamcmd +login anonymous +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit" >> update' >> ~/servers/steam/setup
    echo '            chmod +x update' >> ~/servers/steam/setup
    echo '            echo "Downloading and installing $2"' >> ~/servers/steam/setup
    echo '            ~/servers/steam/disableipv6' >> ~/servers/steam/setup
    echo '            steamcmd +login anonymous +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit' >> ~/servers/steam/setup
    echo '' >> ~/servers/steam/setup
    echo '            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"' >> ~/servers/steam/setup
    echo '            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"' >> ~/servers/steam/setup
    echo '            echo "screen -dmS $2 ~/servers/steam/$2/start" >> screen' >> ~/servers/steam/setup
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