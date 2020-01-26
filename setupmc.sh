#!/bin/sh

d=$(date +%d-%m-%Y)
ver=""

if [ $# = 3 ]
then
    ver=$3
else
    ver=$2
fi

case $1 in
    vanilla|v)
        mkdir vanilla-$ver
        curl https://noahcou.github.io/fishcurl/vanilla/$2/server.jar -o vanilla-$ver/server.jar
        echo "java -xmx4G -jar server.jar" >> vanilla-$ver/start
        chmod +x vanilla-$ver/start
        echo "sudo screen ~/servers/minecraft/vanilla-$ver/start -dm -S vanilla-$ver" >> vanilla-$ver/screen
        chmod +x vanilla-$ver/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> vanilla-$ver/eula.txt
        echo "eula=true" >> vanilla-$ver/eula.txt
    ;;

    paper|p)
        mkdir paper-$ver
        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server.jar
        echo "java -xmx8G -jar server.jar" >> paper-$ver/start
        chmod +x paper-$ver/start
        echo "sudo screen ~/servers/minecraft/paper-$ver/start -dm -S paper-$ver" >> paper-$ver/screen
        chmod +x paper-$ver/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> paper-$ver/eula.txt
        echo "eula=true" >> paper-$ver/eula.txt
    ;;

    bedrock|b)
        echo "TODO"
        # mkdir /bedrock-$ver
        # download tar.gz and extract it TODO
        # curl https://noahcou.github.io/fishcurl/bedrock/$2/ -o /vanilla-$ver/server.jar
    ;;

    forge|f)
        mkdir forge-$ver
        curl https://noahcou.github.io/fishcurl/forge/$2/server.jar -o forge-$ver/server-$d.jar
        echo "java -xmx12G -jar server-$d.jar" >> forge-$ver/start
        chmod +x forge-$ver/start
        echo "sudo screen ~/servers/minecraft/forge-$ver/start -dm -S forge-$ver" >> forge-$ver/screen
        chmod +x forge-$ver/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" >> forge-$ver/eula.txt
        echo "eula=true" >> forge-$ver/eula.txt
    ;;

    sponge|s)
        echo "TODO"
        # mkdir /sponge-$ver
        # TODO
    ;;

    *)
        echo "To check available versions for v, b, f; See:"
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
        echo " - Second Argument - "
        echo "Put MC version here - 1.15.2 - Please use that standard format!"
        echo " - Third Argument - (OPTIONAL)"
        echo "Optionally put a name for your server folder here"
        echo "Default is /vanilla-1.15.2 (/type-version)"
        echo "If you include this Argument it will be /type-customtext"
        echo "No Spaces"
    ;;
esac