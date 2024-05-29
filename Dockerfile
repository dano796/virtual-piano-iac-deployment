FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install express

COPY index.html .
COPY script.js .
COPY server.js .
COPY style.css .
COPY tunes ./tunes

EXPOSE 3000

CMD ["node", "server.js"]
