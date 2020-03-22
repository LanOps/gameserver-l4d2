# L4D2 Docker Image
[![Build Status](http://drone.th0rn0.co.uk/api/badges/LanOps/gameserver-l4d2/status.svg)](http://drone.th0rn0.co.uk/LanOps/gameserver-l4d2)

## Usage

```
docker run -it --name "L4D2" \
    -e SRCDS_HOSTNAME=myServer \
    -e SRCDS_MAP=c1m1_hotel \
    -e SRCDS_MAXPLAYERS=8 \
    -e SRCDS_RCONPW=default \
    -e SRCDS_TICKRATE=64 \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-l4d2
```

### For Persistance mount the /home/steam/left4dead2 directory

```
docker run -it --name "L4D2" \
    -v localVolume:/home/steam/left4dead2 \
    -e SRCDS_HOSTNAME=myServer \
    -e SRCDS_MAP=c1m1_hotel \
    -e SRCDS_MAXPLAYERS=8 \
    -e SRCDS_RCONPW=default \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-left4dead2
```


## Environment Variables

* SRCDS_PORT - Port Number for the server to run on (Default 27015)
* SRCDS_PURE - Set the pure level of the server (Default 1)
* SRCDS_MAXPLAYERS - Max number of players (Default 14) - NOTE: Only works at the initial creation of the container. Comes with L4DToolz for higher server capacity. Check their docs for more info.
* SRCDS_HOSTNAME - Server Name (Default myServer)
* SRCDS_PW - Password for access to the server (Default password)
* SRCDS_RCONPW - Password for RCON (Default rconpass)
* SRCDS_REGION - Server Region (Default -1)
* SRCDS_LAN - Set Lan Server (Default 0)
* SRCDS_MAP - Starting Map (Default c1m1_hotel)
* SRCDS_TICKRATE - L4D2 Tickrate (Default 64)
