# Dockerfile for the second container
FROM node:latest

WORKDIR /app

# Copy the Express application files to the container
COPY package.json .
COPY server.js .

# Install dependencies
RUN npm install

CMD ["node", "server.js"]
