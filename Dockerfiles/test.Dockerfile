FROM node:20.12-alpine

# Set the working directory inside the container
WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

#COPY ./ ./
#copy only nesassary files
# Copy the rest of the files to the container
COPY . .

CMD [ "npm", "test" ]