plugins {
    base

}



tasks.register("buildAllProjects") {
    dependsOn(
        gradle.includedBuild("client").task(":build"),
        gradle.includedBuild("server").task(":build")
    )
}

tasks.register("testAll") {
    dependsOn(
        gradle.includedBuild("client").task("test"),
        gradle.includedBuild("certificateService").task("test"),
        gradle.includedBuild("service").task("test")
    )
}

tasks.register("runServer") {
    dependsOn(gradle.includedBuild("server").task(":run"))
}

tasks.register("runClient") {
    dependsOn(gradle.includedBuild("client").task(":run"))
}
    tasks.register("runAll") {
        dependsOn(
            gradle.includedBuild("certificateService").task(":flaskRun"),
            gradle.includedBuild("server").task(":run"),
            gradle.includedBuild("client").task(":run")
        )
    }
