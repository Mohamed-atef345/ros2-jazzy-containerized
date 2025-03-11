# ROS 2 Jazzy Containerized  

## Overview  
This repository provides a **containerized environment** for **ROS 2 Jazzy** using Docker, enabling easy development, testing, and deployment without the need for local installations.  

## Features  
- Runs **ROS 2 Jazzy** inside a Docker container  
- Uses **host networking** for seamless communication  
- Supports **X11 forwarding** for GUI applications  
- Enables **SSH service** inside the container  
- Runs with **privileged mode** for hardware access  

## Prerequisites  
Ensure you have the following installed:  
- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)  
- **Docker Compose**: [Install Docker Compose](https://docs.docker.com/compose/install/)  

## Installation & Setup  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/Mohamed-atef345/ros2-jazzy-containerized.git
cd ros2-jazzy-containerized
```

### 2️⃣ Build & Run the Container  
```bash
docker-compose up -d
```

### 3️⃣ Access the Container  
```bash
docker exec -it ros_jazzy_container bash
```

### 4️⃣ Verify ROS 2 Jazzy Installation  
```bash
source /opt/ros/jazzy/setup.bash
ros2 doctor
```

## X11 GUI Support  
To enable GUI applications inside the container, run the following on the **host machine** before starting:  
```bash
xhost +local:docker
```

## Stopping & Removing the Container  
To stop the container:  
```bash
docker-compose down
```

To remove all related images and containers:  
```bash
docker system prune -a
```
