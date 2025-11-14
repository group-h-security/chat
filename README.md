# chat

encrypted chat application built with java and sockets

Installation Manual

---

*4 STEP INSTALLATION AND RUN WITH HOSTED SERVER (chat.ryansheridan.dev)*

```bash
git clone https://github.com/group-h-security/client/
cd client
export SERVER_IP=chat.ryansheridan.dev
./gradlew run --console=plain
```

---

Manual Install

1. Stop current Flask CA server with `./gradlew :certificateService:flaskStop`
2. `cd chat/certificateService`
3. `source venv/bin/activate`
4. `cd src`
5. Start Flask CA server with python CAServer.py
6. Clone project with `git clone --recurse-submodules https://github.com/group-h-security/chat.git`
7. `cd chat`
8. Run detached CA server with `./gradlew :certificateService:flaskRun`
9. Wait for initialization
10. Start main server with `./gradlew :server:run`
11. Wait for startup
12. Open new terminal tab and run client with `./gradlew run --console=plain`
13. For additional clients, repeat `./gradlew run --console=plain` in new tabs
14. Docker images (Server and CAServer):  
    `docker pull ghcr.io/group-h-security/server:latest`  
    `docker pull ghcr.io/group-h-security/caserver:latest`  
