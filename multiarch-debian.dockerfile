FROM debian:latest
RUN dpkg --add-architecture arm64
RUN apt-get update
RUN apt-get install -y libx11-dev:arm64 libx11-xcb-dev:arm64 x11proto-dev:arm64 libjack-dev:arm64 libasound2-dev:arm64 libxcb-icccm4-dev:arm64 libxcursor-dev:arm64 mesa-utils:arm64 libxcb-dri2-0-dev:arm64
RUN ln -s libGL.so.1 /usr/lib/aarch64-linux-gnu/libGL.so
RUN ln -s libGLX.so.0 /usr/lib/aarch64-linux-gnu/libGLX.so
RUN ln -s libGLdispatch.so.0 /usr/lib/aarch64-linux-gnu/libGLdispatch.so
