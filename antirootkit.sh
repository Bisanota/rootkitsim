#!/bin/bash

RK_DIR="$HOME/.simrootkit"
STATE_FILE="$RK_DIR/state"
PID_FILE="$RK_DIR/fake_pid"

echo "[*] Escaneando sistema en busca de rootkits..."

if [[ ! -d "$RK_DIR" ]]; then
    echo "[OK] No se detectaron rootkits"
    exit 0
fi

echo "[!] Rootkit SIMULADO detectado"
echo "[*] Analizando estado..."

if [[ -f "$PID_FILE" ]]; then
    FAKE_PID=$(cat "$PID_FILE")
    if ps -p "$FAKE_PID" > /dev/null 2>&1; then
        echo "[*] Terminando proceso oculto simulado (PID $FAKE_PID)"
        kill "$FAKE_PID"
    fi
fi

echo "[*] Eliminando componentes simulados..."
rm -rf "$RK_DIR"

echo "[OK] Sistema restaurado a estado limpio (SIMULACIÓN)"
