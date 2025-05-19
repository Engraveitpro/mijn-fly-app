# Basisimage
FROM ubuntu:22.04

# Voorkom interactieve prompts
ENV DEBIAN_FRONTEND=noninteractive

# Voeg i386-architectuur toe en installeer Wine (32‐bit, 64‐bit én meta‐package), dos2unix voor EOL‐conversie, en CA‐certs
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        wine32 \
        wine64 \
        wine \
        dos2unix \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Werkdirectory
WORKDIR /app

# Kopieer je exe en het start‐script
COPY my_nuitka_app.exe /app/
COPY start.sh         /app/

# Converteer start.sh naar Unix EOL en maak uitvoerbaar
RUN dos2unix /app/start.sh && \
    chmod +x /app/start.sh

# Documenteer welke poort de container gebruikt
EXPOSE 8080

# Start de applicatie via het script dat wine64 aanroept
CMD ["/app/start.sh"]
