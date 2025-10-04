FROM node:18.19.1-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production && \
    npm cache clean --force
COPY . .
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*
EXPOSE 3000
CMD ["npm", "start"]