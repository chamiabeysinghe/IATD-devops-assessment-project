#FROM fake_repo_to_make_linter_happy_DELETE_THIS

FROM node:20.12-alpine


WORKDIR /app


COPY package.json package-lock.json ./


RUN npm install


COPY . ./


CMD ["npm", "start"]

