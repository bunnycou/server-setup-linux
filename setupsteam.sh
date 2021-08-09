#!/bin/sh

case $1 in
    help|h|-h|-help) 

        echo "Here are the options"
        echo "12345 - Appid of server, can be found at https://steamdb.info"
        echo "text - Name of server folder; NO SPACES - required"
        echo "OPTIONAL 3RD ARGUMENT"
        echo "username - username for steam account for account required downloads"
        echo "FOR EXAMPLE"
        echo "./setup 4020 gmod coolusername"

    ;;

    *)
        if [ $# -le 1 ]
        then
        echo "Here are the options"
        echo "12345 - Appid of server, can be found at https://steamdb.info"
        echo "text - Name of server folder; NO SPACES"
        echo "OPTIONAL 3RD ARGUMENT"
        echo "username - username for steam account for account required downloads"
        echo "FOR EXAMPLE"
        echo "./setup 4020 gmod coolusername"
        return
        fi

        if [ $# = 3 ]
        then
            echo "Setting up $2 . . ."
            mkdir $2
            cd $2
            echo "~/servers/steam/disableipv6" >> update
            echo "steamcmd +login $3 +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit" >> update
            chmod +x update
            echo "Downloading and installing $2"
            ~/servers/steam/disableipv6
            steamcmd +login $3 +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit

            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"
            echo "I personally use a start bash script that is then executed by a screen bash script for convenience (similar to how the minecraft servers are setup)!"
            echo "screen -dmS $2 ~/servers/steam/$2/start" >> screen
            chmod +x screen
            cd ..
        else
            echo "Setting up $2 . . ."
            mkdir $2
            cd $2
            echo "~/servers/steam/disableipv6" >> update
            echo "steamcmd +login anonymous +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit" >> update
            chmod +x update
            echo "Downloading and installing $2"
            ~/servers/steam/disableipv6
            steamcmd +login anonymous +force_install_dir ~/servers/steam/$2 +app_update $1 validate +quit

            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"
            echo "I personally use a start bash script that is then executed by a screen bash script for convenience (similar to how the minecraft servers are setup)!"
            echo "screen -dmS $2 ~/servers/steam/$2/start" >> screen
            chmod +x screen
            cd ..
        fi

    ;;
esac
