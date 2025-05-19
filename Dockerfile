# Basisimage
FROM ubuntu:22.04

# Voorkom interactieve prompts bij installatie
ENV DEBIAN_FRONTEND=noninteractive

# Installeer Wine en CA-certificaten voor TLS
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends wine32 ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Werkdirectory in de container
WORKDIR /app

# Kopieer je gecompileerde .exe en het start-script
COPY my_nuitka_app.exe /app/
COPY start.sh /app/

# Maak het start-script uitvoerbaar
RUN chmod +x /app/start.sh

# Exposeer poort 8080 (hoewel Render de eigen poort via $PORT bindt)
EXPOSE 8080

# Start de applicatie via het script, dat $PORT gebruikt
CMD ["/app/start.sh"]
