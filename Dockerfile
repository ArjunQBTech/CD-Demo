FROM node:latest

# Set the working directory in the Docker container
WORKDIR /app
# Copy your project files into the working directory
COPY . /app
COPY package*.json /app
# Install project dependencies including Node.js packages
RUN npm install

# Expose any ports your app needs (adjust as necessary)
EXPOSE 4943
EXPOSE 3000