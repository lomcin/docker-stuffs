FROM ros:melodic-ros-base-bionic

# Avoiding interactive problems when updating
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Recife

RUN apt update && apt upgrade -y

RUN apt install -y ros-melodic-rviz
RUN apt install -y gazebo11