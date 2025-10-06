# Build stage
FROM node:18.19.1-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm run build

# Production stage
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
