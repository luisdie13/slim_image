# Multi-stage build for Node.js application optimization
# Stage 1: Builder stage
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install production dependencies only
RUN npm install --production

# Copy source code
COPY src/ ./src/

# Verify build
RUN ls -la

# Stage 2: Production stage using distroless image
# Distroless images have NO OS - just runtime + your app
# This eliminates ALL OS-level vulnerabilities
FROM gcr.io/distroless/nodejs18-debian12:nonroot

WORKDIR /app

# Copy dependencies from builder
COPY --from=builder /app/node_modules ./node_modules

# Copy application code
COPY --from=builder /app/src ./src

# Copy package.json for reference
COPY package.json ./

# Set user and permissions (distroless uses 'nonroot' by default)
# User runs as UID 65532 (nonroot user built into distroless)

# Health check endpoint
# Use /bin/sh is not available in distroless, so we use curl instead
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD ["/busybox", "wget", "--quiet", "--tries=1", "--spider", "http://localhost:3000/health"]

# Expose port
EXPOSE 3000

# Start application
# Node is the default entrypoint in distroless/nodejs
CMD ["src/index.js"]
