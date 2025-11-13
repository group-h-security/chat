plugins {
    base
}

// 1) Proxy: wait for Flask CA in the certificateService included build
val caReady by tasks.registering {
    group = "infra"
    description = "Ensure Flask CA service is up before anything else"

    // Runs the real waitForFlask task in certificateService
    dependsOn(gradle.includedBuild("certificateService").task(":waitForFlask"))

    doLast {
        println("[root] CA is ready (Flask responding on 127.0.0.1:5000)")
    }
}

// 2) Run the server AFTER caReady (no Exec, just included build task)
val serverRun by tasks.registering {
    group = "infra"
    description = "Run the Java server after CA is ready"

    dependsOn(caReady)
    // Triggers :server:run in the included server build
    dependsOn(gradle.includedBuild("server").task(":run"))
}

// 3) Run the client AFTER serverRun (and also after CA)
val clientRun by tasks.registering {
    group = "infra"
    description = "Run the Java client after server is running"

    dependsOn(caReady)
    dependsOn(gradle.includedBuild("client").task(":run"))

    // Just to make intent explicit:
    mustRunAfter(serverRun)
}

// 4) Top-level orchestration
tasks.register("runAll") {
    group = "infra"
    description = "Start CA, then server, then client"

    dependsOn(serverRun, clientRun)

    doLast {
        println("[root] All components launched: CA + server + client")
    }
}
