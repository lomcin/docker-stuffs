FROM osrf/ros:noetic-desktop-full

# Avoiding interactive problems when updating
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Recife

RUN apt update && apt upgrade -y
RUN apt install -qqy lsb-release gnupg2 curl git python3-colcon-common-extensions
RUN echo "deb [arch=amd64] http://robotpkg.openrobots.org/packages/debian/pub $(lsb_release -cs) robotpkg" | sudo tee /etc/apt/sources.list.d/robotpkg.list
RUN curl http://robotpkg.openrobots.org/packages/debian/robotpkg.key | sudo apt-key add -
RUN apt update && apt install -qqy robotpkg-py3*-pinocchio
RUN apt install python3-pip -y

RUN pip3 install pybullet treep pinocchio

CMD echo "\
mkdir -p ~/solo_colcon_ws/src \n\
cd ~/solo_colcon_ws/src \n\
git clone --recursive https://github.com/open-dynamic-robot-initiative/robot_properties_solo.git \n\
git clone --recursive https://github.com/machines-in-motion/mpi_cmake_modules.git \n\
git clone --recursive https://github.com/machines-in-motion/bullet_utils.git \n\
git clone --recursive https://github.com/stack-of-tasks/pinocchio.git \n\
source /opt/ros/noetic/setup.bash \n\
cd ~/solo_colcon_ws \n\
colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release \n\
source install/setup.bash \n\
" > ~/build_script.sh && \
/bin/bash