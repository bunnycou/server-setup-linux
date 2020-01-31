#!/bin/sh



case $1 in
    help|h|-h|-help) 

        echo "Here are the options"
        echo "12345 - Appid of server, can be found at https://steamdb.info"
        echo "text - Name of server folder; NO SPACES - required"
        echo "OPTIONAL 3RD ARGUMENT"
        echo "username - username for steam account for account required downloads"

    ;;

    *)
        if [ $# -le 1 ]
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
            echo "sudo ~/servers/steam/disableipv6" >> update
            echo "steamcmd +login $3 +app_update $1 validate +quit" >> update
            echo "sudo ~/servers/steam/enableipv6" >> update
            chmod +x update
            echo "Downloading and installing $2"
            ~/servers/steam/disableipv6
            steamcmd +login $3 +app_update $1 validate +quit
            ~/servers/steam/enableipv6

            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"
            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"
            echo "sudo screen ~/servers/steam/$2/APP -S $2" >> screen
            chmod +x screen
            cd ..
        else
            echo "Setting up $2 . . ."
            mkdir $2
            cd $2
            echo "sudo ~/servers/steam/disableipv6" >> update
            echo "steamcmd +login anonymous +app_update $1 validate +quit" >> update
            echo "sudo ~/servers/steam/enableipv6" >> update
            chmod +x update
            echo "Downloading and installing $2"
            ~/servers/steam/disableipv6
            steamcmd +login anonymous +app_update $1 validate +quit
            ~/servers/steam/enableipv6

            echo "Due to the complexity of steam servers a screen bash script will be created for you but you will be required to configure the APP yourself"
            echo "I personally use a start bash script that is then executed by the screen bash script for convenience!"
            echo "sudo screen ~/servers/steam/$2/APP -S $2" >> screen
            chmod +x screen
            cd ..
        fi

    ;;
esac