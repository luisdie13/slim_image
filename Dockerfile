# Multi-stage optimized Dockerfile using Alpine Linux
# Stage 1: Builder stage
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (production only)
RUN npm install --production

# Copy application source code
COPY src/ ./src/

# Verify the application structure
RUN ls -la

# Stage 2: Production stage
FROM node:18-alpine

# Add security labels
LABEL maintainer="student@universidad.edu"
LABEL description="Optimized Node.js application with multi-stage builds and Alpine Linux"
LABEL version="1.0.0"

# Create app directory
WORKDIR /app

# Copy only production node_modules from builder
COPY --from=builder /app/node_modules ./node_modules

# Copy application code from builder
COPY --from=builder /app/src ./src

# Copy package.json for reference
COPY package.json ./

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Change ownership to nodejs user
RUN chown -R nodejs:nodejs /app

# Switch to nodejs user
USER nodejs

# Expose port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "require('http').get('http://localhost:3000/health', (r) => {if (r.statusCode !== 200) throw new Error(r.statusCode)})"

# Start application
CMD ["node", "src/index.js"]
