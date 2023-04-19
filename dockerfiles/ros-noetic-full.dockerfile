FROM osrf/ros:noetic-desktop-full

# Avoiding interactive problems when updating
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Recife

RUN apt update && apt upgrade -y
RUN apt install ros-noetic-move-base -y
