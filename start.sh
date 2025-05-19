# Verwijder oude versie als die er is
Remove-Item start.sh -ErrorAction Ignore

# Creëer nieuwe start.sh zonder BOM, in ASCII, met LF-eindes
@'
#!/bin/sh
exec wine64 /app/my_nuitka_app.exe --port "${PORT:-8080}"
'@ | Set-Content -Path start.sh -Encoding ASCII
