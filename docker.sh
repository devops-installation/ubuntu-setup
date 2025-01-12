sudo apt update
# remove older version docker
sudo apt remove docker docker-engine docker.io containerd runc

# instLL dependancy
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo apt  install docker-compose 
sudo usermod -aG docker $USER


# install by script
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
Executing docker install script, commit: 7cae5f8b0decc17d6571f9f52eb840fbc13b2737
<...>

# docker command 
sudo service docker start
sudo apt install docker.io
#sudo snap install docker
docker -v
sudo systemctl enable docker.service
sudo systemctl restart docker.service
sudo systemctl start docker.service
sudo systemctl status docker.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service

# Docker Compose
sudo apt update
sudo apt install -y docker-compose-plugin
sudo apt  install docker-compose

docker-compose build
docker-compose pull
docker-compose down
docker-compose up  -d
docker system prune -af


# uninstall engine 
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

#Remove source list and keyrings
sudo rm /etc/apt/sources.list.d/docker.list
sudo rm /etc/apt/keyrings/docker.asc


#Dockerfile.yaml
FROM node:20-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 3000
ENV NODE_OPTIONS="--max-old-space-size=4096"
CMD ["npm", "run", "start:development"] # to run on nodmone demone
#CMD ["NODE_ENV=development", "node", "server.js"] # TO RUN ON directly DOCKER NODE:16 IMAGE

----------------------------
#docker-compose.yaml
version: '3.8'
services:
  node-api:
    image: rh-node-api

    container_name: rh-node-api
    build:
      context: .
      dockerfile: "Dockerfile"
    volumes:
      - /nodeapi_data/uploads:/app/uploads
    restart: unless-stopped
    ports:
      - 3000:3000
    deploy:
      resources:
        limits:
          memory: 4096M
        reservations:
          memory: 512M
--------------------------------


#multistage build Dockerfile nodejs

# Stage 1: Build
FROM node:18 AS builder

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the source code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Final Image
FROM node:18-slim

# Set the working directory
WORKDIR /app

# Copy only the built application from the builder stage
COPY --from=builder /app/dist ./dist

# Install production dependencies
COPY package*.json ./
RUN npm install --only=production

# Expose application port
EXPOSE 3000

# Start the application
CMD ["node", "dist/index.js"]


----------------------------------------

#  Java Application
# Stage 1: Build
FROM maven:3.8.8-openjdk-17 AS builder

# Set the working directory
WORKDIR /app

# Copy the source code
COPY pom.xml ./
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Stage 2: Final Image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy only the JAR file from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Start the application
CMD ["java", "-jar", "app.jar"]

