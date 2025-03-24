# Use the official Node.js 20.12 Alpine image as the base image
FROM node:20.12-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./

# Install the required npm dependencies
RUN npm install

# Copy the rest of the application files into the container, excluding certain files/directories
# This will copy everything except the files and directories in the .dockerignore file
COPY . ./

# Remove unnecessary directories and files to keep the image lean and secure
# We remove these directories to exclude non-production resources such as source control, tests, and node_modules
RUN rm -rf .git .github node_modules tests

# Set the command to run the user-facing application (instead of running tests)
CMD [ "npm", "start" ]


