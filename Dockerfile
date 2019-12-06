FROM java:8

LABEL maintainer="theoplaysmc@gmail.com"

RUN groupadd -g 1000 bungeecord && \
    useradd -g bungeecord -u 1000 -r -M bungeecord && \
    touch /run/first_time && \
    mkdir -p /opt/bungeecord /usr/src/bungeecord && \
    echo "set -g status off" > /root/.tmux.conf

COPY bungeecord /usr/local/bin/
ONBUILD COPY . /usr/src/bungeecord

EXPOSE 25577

VOLUME ["/opt/bungeecord"]

ENTRYPOINT ["/usr/local/bin/bungeecord"]
CMD ["run"]
