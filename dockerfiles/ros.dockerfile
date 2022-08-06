FROM ros:noetic-ros-base-focal

# Avoiding interactive problems when updating
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Recife

RUN apt update && apt upgrade -y

RUN apt install -y ros-noetic-rviz