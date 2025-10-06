# Build stage
FROM node:18.19.1-alpine AS builder
WORKDIR /app

# Copy only dependency files first (for better caching)
COPY package*.json ./

# Use a reliable registry and longer timeout to prevent network timeouts
RUN npm config set registry https://registry.npmmirror.com \
    && npm config set fetch-retries 5 \
    && npm config set fetch-timeout 60000 \
    && npm install

# Copy the rest of the code and build
COPY . .
RUN npm run build

# Production stage
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
