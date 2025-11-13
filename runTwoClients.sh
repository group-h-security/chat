#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Pick a terminal emulator
if command -v gnome-terminal >/dev/null 2>&1; then
  TERM_CMD="gnome-terminal"
  # GNOME Terminal syntax
  echo "Using gnome-terminal"
  "$TERM_CMD" -- bash -c "cd \"$ROOT_DIR\" && ./run_client.sh; exec bash"
  "$TERM_CMD" -- bash -c "cd \"$ROOT_DIR\" && ./run_client.sh; exec bash"

elif command -v kgx >/dev/null 2>&1; then
  TERM_CMD="kgx"
  # GNOME Console (kgx) syntax
  echo "Using GNOME Console (kgx)"
  "$TERM_CMD" -- bash -lc "cd \"$ROOT_DIR\" && ./run_client.sh; exec bash"
  "$TERM_CMD" -- bash -lc "cd \"$ROOT_DIR\" && ./run_client.sh; exec bash"

elif command -v xterm >/dev/null 2>&1; then
  TERM_CMD="xterm"
  echo "Using xterm"
  "$TERM_CMD" -hold -e "cd \"$ROOT_DIR\" && ./run_client.sh" &
  "$TERM_CMD" -hold -e "cd \"$ROOT_DIR\" && ./run_client.sh" &

else
  echo " Invalid CertificateVerify signature
javax.net.ssl.SSLHandshakeException: Invalid CertificateVerify signature
    at java.base/sun.security.ssl.Alert.createSSLException(Alert.java:131)No supported terminal found (gnome-terminal, kgx, or xterm)."
  exit 1
fi

echo "Launched two clients in separate terminals."
