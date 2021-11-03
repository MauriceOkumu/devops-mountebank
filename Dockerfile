FROM node:alpine

WORKDIR /devops

COPY package*.json ./

RUN npm install

RUN apk add --update curl -q

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
