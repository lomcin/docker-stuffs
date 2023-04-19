# Docker stuffs

What is *contained* in this repository?
* Dockerfiles.
* Scripts that makes docker a little bit easier.


# Easy Run

## MySQL server
To easily start a MySQL server with the configurations provided on ``compose/mysql.yml`` file.
```bash
./run_mysql.sh
```

## ROS 
Available images:
 - *melodic* (base)
 - *noetic-full* (full + move base package)
 - *noetic-full-buster* (the very complete version of ros and most common packages)

To easily **build** a ROS container:
```bash
./build_ros [ros-version]
```
To easily **start** a ROS container:
```bash
./run_ros [ros-version]
```