FROM node:20.12-alpine

# Set the working directory inside the container
WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

#COPY ./ ./
#copy only nesassary files
COPY . ./
COPY ./Dockerfiles/test.Dockerfile ./

CMD [ "npm", "test" ]