const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptime: process.uptime()
  });
});

// Main endpoint
app.get('/', (req, res) => {
  res.status(200).json({
    message: 'Welcome to the Slim Image Optimization Demo',
    version: '1.0.0',
    description: 'This application demonstrates Docker image optimization with multi-stage builds and Alpine Linux',
    endpoints: {
      health: 'GET /health',
      info: 'GET /'
    }
  });
});

// Info endpoint
app.get('/info', (req, res) => {
  res.status(200).json({
    application: 'slim-image-app',
    nodeVersion: process.version,
    environment: process.env.NODE_ENV || 'development',
    platform: process.platform,
    architecture: process.arch
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`✓ Server running on port ${PORT}`);
  console.log(`✓ Visit http://localhost:${PORT}/ for more information`);
  console.log(`✓ Health check: http://localhost:${PORT}/health`);
});

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('SIGTERM signal received: closing HTTP server');
  process.exit(0);
});
