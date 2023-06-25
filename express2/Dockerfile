# Dockerfile for the third container
FROM node:latest

WORKDIR /app

# Copy the Express application files to the container
COPY package.json .
COPY server.js .

# Install dependencies
RUN npm install

# Expose port 3000
EXPOSE 3000

CMD ["npm", "start"]
