#!/bin/sh

ver=""

if [$# == 3]
then
    ver=$3
else
    ver=$2
fi

case $1 in
    vanilla || v)
        mkdir /vanilla-$ver
        # hard coded because I am bad
        curl https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar -o /vanilla-$ver/server.jar
        echo "java -jar server.jar -xmx 8G" >> /vanilla-$ver/start.sh
        chmod +x /vanilla-$ver/start.sh
        echo "sudo screen ~/servers/minecraft/vanilla-$ver/start.sh -d -S vanilla-$ver" >> /vanilla-$ver/screen.sh
    ;;

    paper || p)
        mkdir /paper-$ver
        curl https://papermc.io/api/v1/paper/$2/latest/download -o /paper-$ver/server.jar
        echo "java -jar server.jar -xmx 8G" >> /paper-$ver/start.sh
        chmod +x /paper-$ver/start.sh
        echo "sudo screen ~/servers/minecraft/paper-$ver/start.sh -d -S paper-$ver" >> /paper-$ver/screen.sh
    ;;

    bedrock || b)
        mkdir /bedrock-$ver
        # hard coded because I am bad
        # wget url -o /bedrock-$ver/server.jar

    forge || f)
        mkdir /forge-$ver
    ;;

    sponge || s)
        mkdir /sponge-$ver
    ;;

    *)
        echo 'Here are the available options'
        echo ' - First Argument - '
        echo 'vanilla - install a vanilla server (hard coded to be the most recent version 2020/1/23)'
        echo 'paper - install a paper plugin server'
        echo 'bedrock - install a bedrock server (hard coded to be the most recent version 2020/1/23 but broke anyways)'
        echo 'forge - install a standard modded minecraft server (requires the ad download so broken pog)'
        echo 'sponge - install a modded plugin compatible server (broken right now until forge works, paper is the only option i guess?)'
        echo ' - Second Argument - '
        echo 'Put MC version here - 1.15.2 - Please use that standard format!'
        echo ' - Third Argument (OPTIONAL) - '
        echo 'Optionally put a name for your server folder here'
        echo 'Default is /vanilla-1.15.2 (/type-version)'
        echo 'If you include this Argument it will be /type-customtext'
    ;;
esac