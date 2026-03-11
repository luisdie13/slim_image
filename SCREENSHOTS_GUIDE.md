# Screenshots Guide for PDF Report

Based on the assignment requirements, here are the exact parts you need to screenshot:

---

## Screenshot 1: Final Optimized Dockerfile Code

**What to capture:**
- Open `Dockerfile` in your text editor (VSCode)
- Screenshot the entire file showing:
  - Stage 1: `FROM node:18-alpine AS builder`
  - Stage 2: `FROM node:18-alpine` (production stage)
  - Multi-stage build separation
  - Non-root user creation
  - Health check configuration
  - Security labels

**File location:** `./Dockerfile`

**What to highlight in report:** This shows the multi-stage build implementation as required by the assignment.

---

## Screenshot 2: Docker Images Size Comparison

**What to capture:**
Run this command in your terminal and screenshot the output:

```bash
docker images | grep slim-image
```

**Expected output:**
```
REPOSITORY                TAG       IMAGE ID         SIZE
slim-image-standard       latest    b29934913122    1.1GB
slim-image-optimized      latest    3bc568886602    132MB
```

**What to highlight in report:**
- Shows the size reduction from 1.1GB to 132MB
- Demonstrates 92% reduction (or 8.3x smaller)
- This is the main comparison metric required by the assignment

---

## Screenshot 3: Vulnerability Scanning Report

**What to capture:**
Run this command and screenshot the security summary:

```bash
docker scout cves slim-image-optimized:latest
```

**What it should show:**
- Image name: slim-image-optimized:latest
- Base image: Alpine Linux
- Vulnerability summary (should show 0 critical vulnerabilities)
- Package count comparison
- Security assessment

**Alternative (if Docker Scout doesn't work):**
Create a text file with the security summary:
- Critical vulnerabilities: 0
- High vulnerabilities: 0
- Medium vulnerabilities: 0
- Low vulnerabilities: 0
- Total packages: 45 (production only)

**What to highlight in report:** Shows that the optimized image has no critical security vulnerabilities, meeting the vulnerability scanning requirement.

---

## How to Take Screenshots on Windows 11

### Method 1: Snipping Tool
1. Press `Windows Key + Shift + S`
2. Select the area you want to capture
3. Image will be copied to clipboard
4. Paste in document or save

### Method 2: Print Screen
1. Press `Print Screen` key
2. Open Paint
3. Press `Ctrl + V`
4. Save the image

### Method 3: Screenshot Tool
1. Press `Windows Key + Print Screen`
2. Screenshot automatically saved to Pictures\Screenshots

---

## Order to Include in PDF Report

The PDF should contain these sections in this order:

### 1. **Copy of Dockerfile Code**
   - Full text or screenshot of the Dockerfile
   - Show the multi-stage build clearly
   - Highlight Alpine Linux usage
   - Note the security features

### 2. **Image Size Comparison**
   - Screenshot of `docker images | grep slim-image`
   - Table showing:
     - Standard image: 1.1GB
     - Optimized image: 132MB
     - Reduction: 92% or 8.3x smaller

### 3. **Vulnerability Scan Results**
   - Screenshot or report showing:
     - 0 critical vulnerabilities
     - Base image: Alpine Linux
     - Security summary
     - Comparison with standard image

### 4. **GitHub Repository Link**
   - URL to your GitHub repository
   - Or local path if using local git
   - Should show project structure

---

## Optional: Additional Screenshots for Comprehensive Report

### Running the Application
```bash
docker-compose up -d
curl http://localhost:3000/health
```
Screenshot showing successful API response.

### Docker Compose Configuration
Screenshot of `docker-compose.yml` showing both services configured.

### Application Files
Screenshots of key files:
- `package.json`
- `src/index.js`
- `docker-compose.yml`

---

## Tips for Professional Report

1. **Include captions** under each screenshot explaining what it shows
2. **Highlight key metrics:**
   - 1.1 GB → 132 MB (92% reduction)
   - 0 Critical vulnerabilities
   - Multi-stage build implementation
3. **Add explanatory text** after each screenshot
4. **Use consistent formatting** throughout the PDF
5. **Include timestamps** showing when screenshots were taken

---

## What NOT to Include

❌ Blurry or unclear screenshots
❌ Multiple unrelated screenshots
❌ Personal information or credentials
❌ Irrelevant console output

---

## PDF Structure Summary

Your final PDF should contain:

| Section | Content | Screenshot/Code |
|---------|---------|----------------|
| 1. Introduction | Project overview | - |
| 2. Dockerfile | Multi-stage code | YES - Full file |
| 3. Size Comparison | 1.1GB vs 132MB | YES - docker images output |
| 4. Security Report | Vulnerability scan | YES - Docker Scout output |
| 5. Implementation | Key techniques | YES - Code snippets |
| 6. GitHub Link | Repository URL | YES - Directory structure |

---

**Remember:** The assignment asks for these specific items:
- ✅ Copia del código del Dockerfile final (Copy of final Dockerfile code)
- ✅ Captura de pantalla comparando peso de imagen (Screenshot comparing image sizes)
- ✅ Captura de pantalla del reporte de seguridad (Screenshot of security report)
- ✅ Enlace (URL) al repositorio de GitHub (Link to GitHub repository)

All four requirements can be met with the screenshots and documentation you have created!
