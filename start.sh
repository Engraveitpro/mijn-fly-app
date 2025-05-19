#!/usr/bin/env sh
exec wine my_nuitka_app.exe --port "${PORT:-8080}"
