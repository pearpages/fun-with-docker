# Dockerfile for the first container
FROM node:latest

ENV NODE_ENV=production

WORKDIR /app

# Copy the JavaScript script to the container
COPY package.json .
COPY script.js .

EXPOSE 3002

RUN npm install
CMD ["npm", "start"]
