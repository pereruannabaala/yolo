# Base image
FROM node:18.19.1-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first (for better caching)
COPY package*.json ./

# Use a faster mirror and retry settings to prevent timeout issues
RUN npm config set registry https://registry.npmmirror.com \
    && npm config set fetch-retries 5 \
    && npm config set fetch-timeout 60000 \
    && npm install

# Copy the rest of the application code
COPY . .

# Set environment variable for production
ENV NODE_ENV=production

# Expose the app port
EXPOSE 5000

# Start the server
CMD ["node", "server.js"]
