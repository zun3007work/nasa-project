FROM node:lts-alpine

WORKDIR /app

COPY . .

RUN npm run install-client --only=production

RUN npm run build --prefix client

RUN npm run install-server --only=production

USER node

CMD ["npm", "start", "--prefix", "server"]

EXPOSE 8000