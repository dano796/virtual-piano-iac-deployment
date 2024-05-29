FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./
COPY index.html .
COPY script.js .
COPY server.js .
COPY style.css .

RUN npm install express

EXPOSE 3000

CMD ["node", "server.js"]