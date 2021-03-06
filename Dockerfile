FROM lanopsdev/gameserver-steamcmd:latest
MAINTAINER Thornton Phillis (dev@th0rn0.co.uk)

# Env - Defaults

ENV SRCDS_PORT 27015 

# Env - Server

ENV SRCDS_SRV_DIR /home/steam/left4dead2
ENV SRCDS_APP_ID 222860

# Env - SourceMod & MetaMod

ENV SOURCEMOD_VERSION_MAJOR 1.10
ENV SOURCEMOD_VERSION_MINOR 0
ENV SOURCEMOD_BUILD 6502
ENV METAMOD_VERSION_MAJOR 1.10
ENV METAMOD_VERSION_MINOR 7
ENV METAMOD_BUILD 968

# Add Start Script

RUN mkdir -p ${SRCDS_SRV_DIR}
RUN { \
        echo '@ShutdownOnFailedCommand 1'; \
        echo '@NoPromptForPassword 1'; \
        echo 'login anonymous'; \
        echo 'force_install_dir $SRCDS_SRV_DIR'; \
        echo 'app_update $SRCDS_APP_ID'; \
        echo 'quit'; \
} > /home/steam/left4dead2_update.txt
ADD resources/root/startServer.sh /home/steam/startServer.sh

# Pre Load LanOps Server Configs & Addons

RUN mkdir -p ${SRCDS_SRV_DIR}/left4dead2/cfg/
COPY resources/root/cfg /tmp/cfg/
RUN mkdir /tmp/dump
RUN chmod -R 777 /tmp/dump

# Expose Ports

EXPOSE ${SRCDS_PORT}
EXPOSE ${SRCDS_PORT}/udp
EXPOSE 27020 27005 51840

# Start Server

ENTRYPOINT ["/home/steam/startServer.sh"]
CMD ["-maxplayers 8 +sv_pure 1 +sv_region -1 +exec server.cfg +sv_lan 0 +map c1m1_hotel +ip 0.0.0.0"]
