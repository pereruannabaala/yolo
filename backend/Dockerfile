# Use a smaller base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first for caching
COPY package*.json ./

# Install dependencies
RUN npm install --production \
    && npm cache clean --force

# Copy application code
COPY . .

# Set environment variables
ENV NODE_ENV=production

# Expose application port
EXPOSE 5000

# Start server
CMD ["node", "server.js"]
