# cpp_ci
This is a tool for CI  for C++ projects with googletest and googlemock.

### cpp_ci Dockerfile
This repository is meant to build the image for a cpp_ci container.

```sh
$ docker build --no-cache -t dosue77/cpp_ci:0.1 -f Dockerfile .
```
### usage
The image is ready-to-go, you just need to mount your workspace as data volume 
and indicate the project to be build and the target path. 

```sh
$ docker run --rm -v /home/osboxes/cpp_ci/workspace:/workspace -e PROJ=Test_Ejer7b_Chat \
-e TARGET=Debug dosue77/cpp_ci:latest
```

Project must follows Eclipse approach as shown in the following example:

```
workspace/
└── Test_Ejer7b_Chat
    ├── Chat.cpp
    ├── Chat.h
    ├── ChatTest.cpp
    ├── Debug
    │   ├── makefile
    │   ├── objects.mk
    │   ├── sources.mk
    │   └── subdir.mk
    ├── MediaServer.h
    ├── MockMediaServer.h
    ├── MockUser.h
    └── User.h
```
