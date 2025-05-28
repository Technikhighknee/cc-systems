# cc-deploy classified as app

Originally `ccdeploy` was described as a tool living in `libraries/`. As the system matured it became clear that the installer is itself a runnable program.

We moved it to `apps/cc-deploy/` and treat it as an application. The modules providing install logic remain under `modules/ccdeploy/`.
