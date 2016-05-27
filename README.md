# **IBM WebSphere Portal Web Content Manager 8.5 on Docker**

## What is this?

   An example of how to run IBM WSP Enable (WCM) V8.5 on a Docker container. The container is launched
   from an image that's pre-built to run WebSphere Application Server 8.5.5 in standalone configuration with a built-in derby database. This can be used for demonstration purposes, testing and development. Final image size is super light (4GB) when regular non-docker installtion can take 30-40GB.

   Inspired by [WASdev GitHub](https://github.com/WASdev/ci.docker.websphere-traditional)

## How does it work?
You build the image in steps to reduce final image size. Make sure you put all source files somewhere that's accisible via http:

1. Build WebSphere Application Server ND image:

   `docker build -t part1 --build-arg=URL=http://www.sources.com -f Dockerfile.part1 .`
2. Export only what we need to run WAS and keep image size to a minimum:

   `docker run -v ${pwd}:/tmp -it part1`
3. Create a clean WAS image from TAR file: 

   `docker build -t part2 -f Dockerfile.part2 .`
4. Install WebSphere Portal into another image:

   `docker build -t part3 --build-arg=URL=http://www.sources.com --build-arg=HOST_NAME=portal1 -f Dockerfile.part3 .`
5. Export only what we need to run WPS and keep image size to a minimum: (Again..)

   `docker run -v ${pwd}:/tmp -it part3 .`
6. Build the final image:

   `docker build -t wps -f Dockerfile.part4 .`
7. Start the container:

   `docker run -dit wps`
8. Access your shiny new portal instance from `http://DOCKER_HOST:10039/wps/portal`


## Legal Stuff:

* All source files are protected under IBM Software License Agreement.

## Technical Details:

   + Current version level is:

     * Java 7.0.6.1
     * Websphere Application Server ND 8.5.5 Fix Pack 8
     * Portal Server WCM 8.5 Cumulative Fix 10
     * Installation Manager 1.8.4.0

   + The following IBM part numbers and source files were used to construct the image:

     * CIYW1ML WS_SDK_JAVA_TECH_7.0.6.1.zip
     * CIYW3ML WSP_Enable_8.5_Setup.zip
     * CIYV9ML WSP_Server_8.5_Install.zip
     * CIYW4ML WSP_Enable_8.5_Install.zip
     * CIK2HML WASND_v8.5.5_1of3.zip
     * CIK2IML WASND_v8.5.5_2of3.zip
     * CIK2JML WASND_v8.5.5_3of3.zip
     * 1.8.4.0-IBMIM-LINUX-X86_64-20151125_0201
     * 8.5-WP-WCM-Combined-CFPI55632-Server-CF10.zip
     * 8.5.5-WS-WAS-FP0000008-part1.zip
     * 8.5.5-WS-WAS-FP0000008-part2.zip
