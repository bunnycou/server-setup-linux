#!/bin/sh

d=$(date +%d-%m-%Y)
ver=""

if [ $4 = "u" ]
then
    ver=$3
    case $1 in # 'exit 130' to exit
        vanilla|v)
            echo "Vanilla does not requite updates through this method, please use the normal method to download the new server"
            echo "Then simply copy the old world folder and server.properties over before starting up the new server"
        ;;

        paper|p)
            echo "Updating Paper-$ver . . ."
            rm paper-$ver/server.jar
            curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar
        ;;

        bedrock|b)
            echo "Bedrock does not require updates through this method, please use the normal method to download the new server"
            echo "Then simply copy the old world folder and server.properties over before starting up the new server"
            echo "(More may be required, I do not use bedrock that often)"
        ;;

        forge|f)
            echo "Updating Forge-$ver . . ."
            rm forge-$ver/server-*.jar
            curl https://noahcou.github.io/fishcurl/forge/$2/server.jar -o forge-$ver/server-$d.jar
        ;;

        sponge|s)
            echo "Updating Sponge-$ver . . ."
            rm sponge-$ver/server-*.jar
            curl https://noahcou.github.io/fishcurl/forge/$2/server.jar -o sponge-$ver/server-$d.jar
            rm sponge-$ver/mods/sponge.jar
            curl https://noahcou.github.io/fishcurl/sponge/$2/sponge.jar -o sponge-$ver/mods/sponge-$d.jar
        ;;
    esac
    exit 130
elif [ $# = 3 ]
then
    ver=$3
else
    ver=$2
fi

case $1 in
    vanilla|v)
        mkdir vanilla-$ver
        curl https://noahcou.github.io/fishcurl/vanilla/$2/server.jar -o vanilla-$ver/server.jar
        echo "java -Xmx4G -jar server.jar" >> vanilla-$ver/start
        chmod +x vanilla-$ver/start
        echo "sudo screen ~/servers/minecraft/vanilla-$ver/start -S vanilla-$ver" >> vanilla-$ver/screen
        chmod +x vanilla-$ver/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> vanilla-$ver/eula.txt
        echo "eula=true" >> vanilla-$ver/eula.txt
    ;;

    paper|p)
        mkdir paper-$ver
        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar
        echo "java -Xmx8G -jar server.jar" >> paper-$ver/start
        chmod +x paper-$ver/start
        echo "sudo screen ~/servers/minecraft/paper-$ver/start -S paper-$ver" >> paper-$ver/screen
        chmod +x paper-$ver/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> paper-$ver/eula.txt
        echo "eula=true" >> paper-$ver/eula.txt
    ;;

    bedrock|b)
        mkdir /bedrock-$ver
        curl https://noahcou.github.io/fishcurl/bedrock/$2/server.zip -o bedrock-server.zip
        unzip server.zip -d bedrock-$ver/
        rm server.zip
        echo "LD_LIBRARY_PATH=. ./bedrock_server" >> bedrock-$ver/start
        chmod +x bedrock-$ver/start
        echo "sudo screen ~/servers/minecraft/bedrock-$ver/start -S bedrock-$ver" >> bedrock-$ver/screen
        chmod +x bedrock-$ver/screen
    ;;

    forge|f)
        mkdir forge-$ver
        curl https://noahcou.github.io/fishcurl/forge/$2/server.jar -o forge-$ver/server-$d.jar
        echo "java -Xmx10G -jar server-$d.jar" >> forge-$ver/start
        chmod +x forge-$ver/start
        echo "sudo screen ~/servers/minecraft/forge-$ver/start -S forge-$ver" >> forge-$ver/screen
        chmod +x forge-$ver/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> forge-$ver/eula.txt
        echo "eula=true" >> forge-$ver/eula.txt
    ;;

    sponge|s)
        mkdir sponge-$ver
        mkdir sponge-$ver/mods
        curl https://noahcou.github.io/fishcurl/forge/$2/server.jar -o sponge-$ver/server-$d.jar
        echo "java -Xmx12G -jar server-$d.jar" >> sponge-$ver/start
        chmod +x sponge-$ver/start
        echo "sudo screen ~/servers/minecraft/forge-$ver/start -S forge-$ver" >> sponge-$ver/screen
        chmod +x sponge-$ver/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> sponge-$ver/eula.txt
        echo "eula=true" >> sponge-$ver/eula.txt
        curl https://noahcou.github.io/fishcurl/sponge/$2/sponge.jar -o sponge-$ver/mods/sponge-$d.jar
    ;;

    *)
        echo "To check available versions for v, b, f, s; See:"
        echo "https://noahcou.github.io/fishcurl/ OR"
        echo "https://github.com/noahcou/fishcurl/"
        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible"
        echo "Here are the available options"
        echo " - First Argument - (one letter also works!)"
        echo "vanilla - install a vanilla server (pulls from my own files)"
        echo "paper - install a paper plugin server"
        echo "bedrock - install a bedrock server (pulls from my own files)"
        echo "forge - install a standard modded minecraft server (pulls from my own files)"
        echo "FORGE IS TIMESTAMPED SO YOU KNOW IF AN UPDATE IS NEEDED (updates are never required typically)"
        echo "sponge - install a modded plugin compatible server (in testing)"
        echo "SPONGE IS TIMESTAMPED SO YOU KNOW IF AN UPDATE IS NEEDED (updates are never required typically)"
        echo " - Second Argument - "
        echo "Put MC version here - 1.15.2 - Please use that standard format!"
        echo " - Third Argument - (OPTIONAL)"
        echo "Optionally put a name for your server folder here"
        echo "Default is /vanilla-1.15.2 (/type-version)"
        echo "If you include this Argument it will be /type-customtext"
        echo "No Spaces"
        echo " - Fourth Argument - (OPTIONAL)"
        echo "u - Update the server.jar, works for paper, forge, and sponge"
        echo "DO NOT USE when upgrading/changing the minecraft version"
        echo "Third argument becomes required, make it the same as your second argument if you did not use a custom name"
        echo "./setup p 1.15.2 1.15.2 u"
    ;;
esac