#!/bin/bash

RK_DIR="$HOME/.simrootkit"
STATE_FILE="$RK_DIR/state"
PID_FILE="$RK_DIR/fake_pid"

if [[ -d "$RK_DIR" ]]; then
    echo "[!] El programa ya ha sido instalado"
    exit 1
fi

echo "[*] Instalando programa..."

# Crear estructura "oculta"
mkdir -p "$RK_DIR"

# Proceso falso (no hace nada)
sleep 999 &
FAKE_PID=$!

echo "$FAKE_PID" > "$PID_FILE"

# Guardar estado
cat <<EOF > "$STATE_FILE"
infected=true
fake_process_pid=$FAKE_PID
installed_at=$(date)
EOF

echo "[+] Instalado Correctamente"
echo "[+] Proceso creado con PID $FAKE_PID"
echo "[+] Programa activada"
