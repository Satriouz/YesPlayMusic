FROM node:lts

WORKDIR /app
RUN apt-get update && apt-get install nginx -y
COPY package.json .
RUN yarn
COPY . .
RUN yarn build
RUN mv dist/* /var/www/html
RUN git clone https://github.com/Binaryify/NeteaseCloudMusicApi.git netease_api --depth=1
RUN yarn netease_api:install
COPY default /etc/nginx/sites-enabled/default
COPY start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]
