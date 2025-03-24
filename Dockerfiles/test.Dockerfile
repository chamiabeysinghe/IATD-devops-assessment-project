# Use the official Node.js 20.12 Alpine image
FROM node:20.12-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to install dependencies
COPY package.json package-lock.json ./

# Install the required npm dependencies
RUN npm install

# Copy the rest of the application files into the container
# This will exclude files specified in .dockerignore
COPY . ./

# Remove unwanted directories to reduce the size of the image
RUN rm -rf .git .github node_modules

# Set the command to run the tests
CMD [ "npm", "test" ]
