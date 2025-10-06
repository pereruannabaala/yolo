# Build stage
FROM node:18-alpine AS builder
WORKDIR /app

# Only copy package.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install --production=false

# Copy app source
COPY . .

# Handle legacy OpenSSL option
ENV NODE_OPTIONS=--openssl-legacy-provider

# Build the React app
RUN npm run build

# Production stage
FROM nginx:alpine

# Copy build output
COPY --from=builder /app/build /usr/share/nginx/html

# Expose default nginx port (80)
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
