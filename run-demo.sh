#!/usr/bin/env bash
set -e

# Simple one-button demo launcher
# 1. Start Flask CA in the background
# 2. Wait for it to be ready
# 3. Run server + client via Gradle

echo "[demo] Starting Flask CA service..."
(
  cd certificateService
  ./gradlew flaskRun &
)

# Give it a moment to actually start booting
sleep 2

echo "[demo] Waiting for Flask to be ready..."
./gradlew :certificateService:waitForFlask

echo "[demo] Starting server + client..."
./gradlew runAll

