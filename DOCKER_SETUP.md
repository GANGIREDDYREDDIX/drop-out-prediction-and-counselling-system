# 🐳 Docker Setup Guide (Easiest Method!)

## What is Docker?

Docker is like a **"box that contains everything"** - Python, Node.js, all dependencies, and your application. Once set up, it works the same on everyone's computer!

**Why use Docker?**
- ✅ No need to install Python or Node.js
- ✅ Works on Mac, Windows, and Linux
- ✅ Zero configuration needed
- ✅ One command to run everything

---

## 🚀 Docker Setup (Recommended for Beginners!)

### Step 1: Install Docker

**For Mac:**
1. Download: https://www.docker.com/products/docker-desktop
2. Install and open Docker Desktop
3. Wait for it to start (Docker icon in menu bar)

**For Windows:**
1. Download: https://www.docker.com/products/docker-desktop
2. Install and restart your computer
3. Open Docker Desktop and wait for startup

**For Linux:**
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

### Step 2: Verify Installation

Open Terminal/Command Prompt and run:
```bash
docker --version
docker run hello-world
```

Should see: `Hello from Docker!`

### Step 3: Start Everything with One Command

Navigate to project folder:
```bash
cd /path/to/drop-out-prediction-and-counselling-system
```

Start the complete system:
```bash
docker-compose up
```

That's it! 🎉

### Step 4: Open in Browser

```
http://localhost:3000    # Frontend
http://localhost:8000    # Backend API
```

---

## 🛑 Stopping Docker

Press `Ctrl + C` in terminal

Or run:
```bash
docker-compose down
```

---

## 🐛 Docker Troubleshooting

### Docker not starting?
- Make sure Docker Desktop is open
- Restart Docker Desktop
- Check if ports 3000 and 8000 are available

### Port already in use?
```bash
# Stop all Docker containers
docker-compose down

# Kill process on port 3000
# Mac/Linux:
lsof -ti:3000 | xargs kill -9

# Windows:
netstat -ano | findstr :3000
taskkill /PID <PID> /F
```

### Need to rebuild?
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up
```

### View logs?
```bash
docker-compose logs -f backend
docker-compose logs -f frontend
```

---

## 📊 Docker Comparison

| Feature | Regular Setup | Docker Setup |
|---------|--------------|--------------|
| Install Python | ✅ Required | ❌ Not needed |
| Install Node.js | ✅ Required | ❌ Not needed |
| Install Dependencies | ✅ Manual | ✅ Automatic |
| Time to Setup | 10-15 min | 2-3 min |
| Works on All OS | ⚠️ Complex | ✅ Same on all |
| File Size | ~2GB | ~500MB |

---

## 🎯 Docker Cheat Sheet

```bash
# See running containers
docker ps

# See all containers (including stopped)
docker ps -a

# View container logs
docker logs container_name

# Execute command in container
docker exec -it container_name bash

# Stop specific container
docker stop container_name

# Remove container
docker rm container_name

# View Docker images
docker images

# Remove image
docker rmi image_name

# Clean up everything
docker system prune
```

---

## ✨ Docker Features Used

```yaml
# Frontend Container
- Node.js 18
- React
- Automatic npm install

# Backend Container
- Python 3.9
- FastAPI
- All dependencies pre-installed
```

---

## 🚀 Advanced: Build Custom Image

If you want to modify the Docker setup:

```bash
# Build image
docker build -t dropout-system .

# Run image
docker run -p 8000:8000 dropout-system
```

---

## 📚 Learn More

- Docker Docs: https://docs.docker.com/
- Docker Compose: https://docs.docker.com/compose/
- Docker Hub: https://hub.docker.com/

---

## 🎉 You're All Set!

Your complete application is now running in Docker with zero configuration!

**Enjoy! 🚀**
