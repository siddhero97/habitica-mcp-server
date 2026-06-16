# Use a lightweight Node.js LTS image
FROM node:20-slim

# Set working directory
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

# Copy package management files
COPY package.json pnpm-lock.yaml* ./

# Install only production dependencies
RUN pnpm install --prod

# Copy application code
COPY index.js i18n.js ./

# Expose default port
EXPOSE 8080

# Environment variables default
ENV PORT=8080
ENV MCP_TRANSPORT=sse

# Start the application
CMD ["node", "index.js"]
