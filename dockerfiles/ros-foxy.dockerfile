FROM osrf/ros:foxy-desktop

# Avoiding interactive problems when updating
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Recife

RUN apt update && apt upgrade -y
