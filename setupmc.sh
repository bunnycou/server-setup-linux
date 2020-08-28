#!/bin/sh

ver=""

if [ $# = 4 ]
then
    if [ $4 = "u" ]
    then
        ver=$3
        case $1 in # 'exit 130' to exit
            vanilla|v)
                echo "Vanilla does not require updates through this method, please use the normal method to download the new server"
                echo "Then simply copy the old world folder and server.properties over before starting up the new server"
            ;;

            paper|p)
                echo "Updating Paper-$ver . . ."
                rm paper-$ver/server-*.jar
                curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server-$2.jar
                echo "while true; do" > paper-$ver/start
                echo "java -Xmx8G -jar server-$2.jar" >> paper-$ver/start
                echo "echo Restarting in 15 seconds..." >> paper-$ver/start
                echo "sleep 15" >> paper-$ver/start
                echo "done" >> paper-$ver/start
                chmod +x paper-$ver/start
            ;;

            waterfall|w)
                echo "updating Waterfall!"
                rm waterfall-$ver/waterfall-*.jar
                curl https://papermc.io/api/v1/waterfall/$2/latest/download -0 waterfall-$ver/waterfall-$2.jar
                echo "while true; do" > waterfall-$ver/start
                echo "java -jar waterfall-$2.jar" >> waterfall-$ver/start
                echo "echo Restarting in 15 seconds..." >> waterfall-$ver/start
                echo "sleep 15" >> waterfall-$ver/start
                echo "done" >> waterfall-$ver/start
                chmod +x waterfall-$ver/start
            ;;
        esac
        exit 130
    fi
elif [ $# = 3 ]
then
    ver=$3
else
    ver=$2
fi

case $1 in
    vanilla|v)
        mkdir vanilla-$ver
        curl https://noahcou.github.io/fishcurl/vanilla/$2/server.jar -o vanilla-$ver/server-$2.jar
        echo "while true; do" > vanilla-$ver/start
        echo "java -Xmx4G -jar server-$2.jar" >> vanilla-$ver/start
        echo "echo Restarting in 15 seconds..." >> vanilla-$ver/start
        echo "sleep 15" >> vanilla-$ver/start
        echo "done" >> vanilla-$ver/start
        chmod +x vanilla-$ver/start
        echo "screen -dmS vanilla-$ver ~/servers/minecraft/vanilla-$ver/start" > vanilla-$ver/screen
        chmod +x vanilla-$ver/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" > vanilla-$ver/eula.txt
        echo "eula=true" > vanilla-$ver/eula.txt
    ;;

    paper|p)
        mkdir paper-$ver
        curl https://papermc.io/api/v1/paper/$2/latest/download -o paper-$ver/server-$2.jar
        echo "while true; do" > paper-$ver/start
        echo "java -Xmx8G -jar server-$2.jar" >> paper-$ver/start
        echo "echo Restarting in 15 seconds..." >> paper-$ver/start
        echo "sleep 15" >> paper-$ver/start
        echo "done" >> paper-$ver/start
        chmod +x paper-$ver/start
        echo "screen -dmS paper-$ver ~/servers/minecraft/paper-$ver/start" > paper-$ver/screen
        chmod +x paper-$ver/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" > paper-$ver/eula.txt
        echo "eula=true" > paper-$ver/eula.txt
    ;;

    waterfall|w)
        mkdir waterfall-$ver
        curl https://papermc.io/api/v1/waterfall/$2/latest/download -o waterfall-$ver/waterfall-$2.jar
        echo "while true; do" > waterfall-$ver/start
        echo "java -jar waterfall-$2.jar" >> waterfall-$ver/start
        echo "echo Restarting in 15 seconds..." >> waterfall-$ver/start
        echo "sleep 15" >> waterfall-$ver/start
        echo "done" >> waterfall-$ver/start
        chmod +x waterfall-$ver/start
        echo "screen -dmS waterfall-$ver ~/servers/minecraft/waterfall-$ver/start" > waterfall-$ver/screen
        chmod +x waterfall-$ver/screen
    ;;

    *)
        echo "To check available versions for v; See:"
        echo "https://noahcou.github.io/fishcurl/ OR"
        echo "https://github.com/noahcou/fishcurl/"
        echo "Typically I only like to add 1.14.4 and later as those are multithread compatible I believe (maybe not)"
        echo "Here are the available options"
        echo " - First Argument - (one letter also works!)"
        echo "vanilla - install a vanilla server (pulls from my own files)"
        echo "paper - install a paper plugin server"
        echo "waterfall - install a waterfall server - versioning is 1.15 not 1.15.2!"
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
        echo "./setup p 1.15.2 coolserv u"
    ;;
esac
