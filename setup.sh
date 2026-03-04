#!/bin/bash

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print header
echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}🚀 Dropout Prediction System Setup${NC}"
echo -e "${BLUE}======================================${NC}\n"

# Check if Python is installed
echo -e "${YELLOW}[1/6] Checking Python installation...${NC}"
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ Python 3 is not installed${NC}"
    echo -e "${RED}Please install Python 3.9+ from https://www.python.org/downloads/${NC}"
    exit 1
fi
PYTHON_VERSION=$(python3 --version)
echo -e "${GREEN}✅ Found: $PYTHON_VERSION${NC}\n"

# Check if Node.js is installed
echo -e "${YELLOW}[2/6] Checking Node.js installation...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed${NC}"
    echo -e "${RED}Please install Node.js from https://nodejs.org/${NC}"
    exit 1
fi
NODE_VERSION=$(node --version)
echo -e "${GREEN}✅ Found Node.js: $NODE_VERSION${NC}\n"

# Create Python virtual environment
echo -e "${YELLOW}[3/6] Creating Python virtual environment...${NC}"
if [ -d "venv" ]; then
    echo -e "${YELLOW}Virtual environment already exists. Skipping creation.${NC}"
else
    python3 -m venv venv
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Virtual environment created${NC}\n"
    else
        echo -e "${RED}❌ Failed to create virtual environment${NC}"
        exit 1
    fi
fi

# Activate virtual environment
source venv/bin/activate

# Install backend dependencies
echo -e "${YELLOW}[4/6] Installing Python dependencies...${NC}"
if pip install -q fastapi uvicorn pydantic email-validator 2>/dev/null; then
    echo -e "${GREEN}✅ Backend dependencies installed${NC}\n"
else
    echo -e "${RED}❌ Failed to install backend dependencies${NC}"
    exit 1
fi

# Install frontend dependencies
echo -e "${YELLOW}[5/6] Installing Node.js dependencies...${NC}"
cd frontend-react
if npm install -q 2>/dev/null; then
    echo -e "${GREEN}✅ Frontend dependencies installed${NC}\n"
else
    echo -e "${RED}❌ Failed to install frontend dependencies${NC}"
    exit 1
fi
cd ..

# Create environment files
echo -e "${YELLOW}[6/6] Creating environment files...${NC}"

# Backend .env (using hardcoded values in notifier.py)
cat > backend/.env.example << 'EOF'
# Gmail Configuration (Optional - already configured in notifier.py)
# EMAIL=your-gmail@gmail.com
# PASSWORD=your-app-password
# SMTP_SERVER=smtp.gmail.com
# SMTP_PORT=465
EOF

# Frontend .env
cat > frontend-react/.env << 'EOF'
REACT_APP_API_URL=http://127.0.0.1:8000
BROWSER=none
EOF

echo -e "${GREEN}✅ Environment files created${NC}\n"

# Final message
echo -e "${BLUE}======================================${NC}"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo -e "${BLUE}======================================${NC}\n"

echo -e "${YELLOW}Next steps:${NC}\n"
echo -e "1. ${BLUE}Start Backend Server${NC} (in a new terminal):"
echo -e "   ${GREEN}cd /path/to/project${NC}"
echo -e "   ${GREEN}source venv/bin/activate${NC}"
echo -e "   ${GREEN}cd backend${NC}"
echo -e "   ${GREEN}python -m uvicorn app:app --host 127.0.0.1 --port 8000${NC}\n"

echo -e "2. ${BLUE}Start Frontend Server${NC} (in another new terminal):"
echo -e "   ${GREEN}cd /path/to/project${NC}"
echo -e "   ${GREEN}cd frontend-react${NC}"
echo -e "   ${GREEN}npm start${NC}\n"

echo -e "3. ${BLUE}Open in Browser${NC}:"
echo -e "   ${GREEN}http://localhost:3000${NC}\n"

echo -e "${YELLOW}Need help? Read SETUP_GUIDE.md for detailed instructions${NC}\n"

# Option to start servers
read -p "Would you like to start the servers now? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Starting servers...${NC}\n"
    
    # Start backend in background
    echo -e "${YELLOW}Starting backend server on port 8000...${NC}"
    cd backend
    python -m uvicorn app:app --host 127.0.0.1 --port 8000 &
    BACKEND_PID=$!
    cd ..
    sleep 2
    echo -e "${GREEN}✅ Backend started (PID: $BACKEND_PID)${NC}\n"
    
    # Start frontend
    echo -e "${YELLOW}Starting frontend server on port 3000...${NC}"
    cd frontend-react
    npm start
fi
