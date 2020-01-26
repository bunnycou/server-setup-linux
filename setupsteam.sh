#!/bin/sh



case $1 in
    help|h|-h|-help) 

        echo "Here are the options"
        echo "12345 - Appid of server, can be found at https://steamdb.info"
        echo "text - Name of server folder; NO SPACES"
        echo "OPTIONAL 3RD ARGUMENT"
        echo "username - username for steam account for account required downloads"

    ;;

    *)
        if [ $# = 0 ]
        then
        echo "Here are the options"
        echo "12345 - Appid of server, can be found at https://steamdb.info"
        echo "text - Name of server folder; NO SPACES"
        echo "OPTIONAL 3RD ARGUMENT"
        echo "username - username for steam account for account required downloads"
        return
        fi

        if [ $# = 3 ]
        then
            echo "Setting up $2 . . ."
            mkdir $2
            cd $2
            echo "steamcmd +login $3 +app_update $1 validate +quit" >> update.sh
            chmod +x update.sh
            echo "Downloading and installing $2"
            steamcmd +login $3 +app_update $1 validate +quit

            echo "Due to the complexity of steam servers a screen.sh will be created for you but you will be required to configure the APP yourself"
            echo "I personally use a start.sh that is then executed by the screen.sh for convenience!"
            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen.sh
            cd ..
        else
            echo "Setting up $2 . . ."
            mkdir $2
            cd $2
            echo "steamcmd +login anonymous +app_update $1 validate +quit" >> update.sh
            chmod +x update.sh
            echo "Downloading and installing $2"
            steamcmd +login anonymous +app_update $1 validate +quit

            echo "Due to the complexity of steam servers a screen.sh will be created for you but you will be required to configure the APP yourself"
            echo "I personally use a start.sh that is then executed by the screen.sh for convenience!"
            echo "sudo screen ~/servers/steam/$2/APP -d -S $2" >> screen.sh
            cd ..
        fi

    ;;
esac