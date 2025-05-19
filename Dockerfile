FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        wine32 \
        wine64 \
        wine \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY my_nuitka_app.exe /app/
COPY start.sh        /app/

RUN chmod +x /app/start.sh

EXPOSE 8080

CMD ["/app/start.sh"]
