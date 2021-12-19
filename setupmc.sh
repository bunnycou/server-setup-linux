#!/bin/sh

ver=""

if [ $# = 4 ]
then
    if [ $4 = "u" ]
    then
        ver=$3
        case $1 in # 'exit 130' to exit
            purpur|p)
                echo "Updating $ver-purpur . . ."
                rm $ver-purpur/server-*.jar

                curl -o ./$ver-purpur/server-$2.jar https://api.purpurmc.org/v2/purpur/$2/latest/download

                echo "while true; do" > $ver-purpur/start
                echo "java -Xmx8G -jar server-$2.jar" >> $ver-purpur/start
                echo "echo Restarting in 15 seconds..." >> $ver-purpur/start
                echo "sleep 15" >> $ver-purpur/start
                echo "done" >> $ver-purpur/start
                chmod +x $ver-purpur/start
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
    purpur|p)
        mkdir $ver-purpur
        
        curl -o ./$ver-purpur/server-$2.jar https://api.purpurmc.org/v2/purpur/$2/latest/download

        echo "while true; do" > $ver-purpur/start
        echo "java -Xmx8G -jar server-$2.jar" >> $ver-purpur/start
        echo "echo Restarting in 15 seconds..." >> $ver-purpur/start
        echo "sleep 15" >> $ver-purpur/start
        echo "done" >> $ver-purpur/start
        chmod +x $ver-purpur/start
        echo "screen -dmS $ver-purpur ~/servers/minecraft/$ver-purpur/start" > $ver-purpur/screen
        chmod +x $ver-purpur/screen
        echo "# EULA (https://account.mojang.com/documents/minecraft_eula)" > $ver-purpur/eula.txt
        echo "eula=true" > $ver-purpur/eula.txt
    ;;
    ;;

    *)
        echo "Here are the available options"
        echo " - First Argument - (one letter also works!)"
        echo "purpur - purpur plugin server"
        echo "waterfall - removed support because I don't want to use a python workaround for paper's new api"
        echo " - Second Argument - "
        echo "Put MC version here - 1.18.1 - Please use that standard format!"
        echo " - Third Argument - (OPTIONAL)"
        echo "Optionally put a name for your server folder here"
        echo "Default is /1.18.1-purpur (/version-type)"
        echo "If you include this Argument it will be /customtext-type"
        echo "No Spaces Allowed"
        echo " - Fourth Argument - (OPTIONAL)"
        echo "u - Update the server.jar"
        echo "DO NOT USE when changing the major minecraft version, only minor (although it still can be used for that)"
        echo "Third argument becomes required" 
        echo "Make it the name of the folder version if you did not use a custom name"
        echo "./setup p 1.16.5 1.16.4 u"
        echo "./setup p 1.16.5 coolserv u"
    ;;
esac
