# 🚀 Complete Setup Guide for Beginners

## For Likhitha (Non-Technical Users)

This guide will help you set up the entire project in 5 minutes with no technical knowledge required.

---

## ⚡ EASIEST WAY: Automated Setup (Recommended)

### Step 1: Download the Code
1. Click the green **"Code"** button on GitHub
2. Click **"Download ZIP"**
3. Extract the ZIP file to your desired location

### Step 2: Open Terminal
- **Mac:** Press `Cmd + Space`, type "Terminal", press Enter
- **Windows:** Press `Win + R`, type "cmd", press Enter
- **Linux:** Press `Ctrl + Alt + T`

### Step 3: Navigate to Project
```bash
cd /path/to/drop-out-prediction-and-counselling-system
```

### Step 4: Run Setup Script (Mac/Linux)
```bash
bash setup.sh
```

### Step 5: Run Setup Script (Windows)
```bash
setup.bat
```

**That's it! The script will:**
- ✅ Create Python virtual environment
- ✅ Install all dependencies
- ✅ Create .env files with default values
- ✅ Set up database
- ✅ Start both servers automatically

---

## 📋 MANUAL SETUP (If Script Doesn't Work)

### Prerequisites
1. **Download Python** from https://www.python.org/downloads/ (version 3.9+)
   - During installation, CHECK "Add Python to PATH"

2. **Download Node.js** from https://nodejs.org/
   - Choose LTS version
   - During installation, accept all defaults

3. **Verify Installation:**
   ```bash
   python --version
   node --version
   npm --version
   ```

### Step-by-Step Setup

#### Backend Setup
```bash
# 1. Create virtual environment
python -m venv venv

# 2. Activate virtual environment
# On Mac/Linux:
source venv/bin/activate
# On Windows:
venv\Scripts\activate

# 3. Install Python packages
pip install -r requirements.txt

# 4. Create .env file with email settings
# Create a file named .env in the backend folder with:
EMAIL=your-email@gmail.com
PASSWORD=your-app-password
```

#### Frontend Setup
```bash
# 1. Navigate to frontend directory
cd frontend-react

# 2. Install npm packages
npm install

# 3. Create .env file
# Create a file named .env with:
REACT_APP_API_URL=http://127.0.0.1:8000
BROWSER=none
```

#### Running the Application
```bash
# Terminal 1 - Backend (from root directory, venv activated)
cd backend
python -m uvicorn app:app --host 127.0.0.1 --port 8000

# Terminal 2 - Frontend
cd frontend-react
npm start
```

---

## 🔐 Setting Up Gmail App Password

### Step 1: Enable 2-Factor Authentication
1. Go to https://myaccount.google.com/
2. Click **Security** (left sidebar)
3. Scroll to "2-Step Verification"
4. Click **Enable 2-Step Verification**
5. Follow the prompts

### Step 2: Create App Password
1. Go back to **Security**
2. Look for **"App passwords"** (appears after enabling 2FA)
3. Select **Mail** and **Windows/Mac/Linux**
4. Google generates a 16-character password
5. Copy this password

### Step 3: Add to .env File
```
EMAIL=your-gmail@gmail.com
PASSWORD=your-16-character-app-password
```

---

## 📊 Environment Variables Explained

### Backend (.env or hardcoded in notifier.py)
```
EMAIL=your-gmail@gmail.com           # Your Gmail address
PASSWORD=your-app-password           # 16-char Gmail app password
SMTP_SERVER=smtp.gmail.gmail         # Don't change this
SMTP_PORT=465                        # Don't change this
```

### Frontend (.env)
```
REACT_APP_API_URL=http://127.0.0.1:8000   # Backend server address
BROWSER=none                               # Prevents auto-opening browser
```

### Default CSV Locations
```
Student Data: /frontend/data/student_data.csv
```

---

## ✅ Testing the Setup

### Backend is Working:
1. Open browser
2. Go to: http://localhost:8000/students
3. Should see JSON data with student list

### Frontend is Working:
1. Open browser
2. Go to: http://localhost:3000
3. Should see the Student Dashboard

### Email is Working:
1. Click "Predict Risk for All Students"
2. Click "Notify" on a HIGH RISK student
3. Email should be received within 30 seconds

---

## 🐛 Common Issues & Solutions

### Issue: "Python not found"
**Solution:**
- Reinstall Python
- Make sure to CHECK "Add Python to PATH" during installation
- Restart Terminal after installation

### Issue: "npm not found"
**Solution:**
- Download Node.js from nodejs.org
- Restart Terminal after installation

### Issue: "ModuleNotFoundError: No module named 'fastapi'"
**Solution:**
```bash
# Make sure virtual environment is activated
source venv/bin/activate  # Mac/Linux
# OR
venv\Scripts\activate     # Windows

# Then install requirements
pip install -r requirements.txt
```

### Issue: "Port 3000 or 8000 already in use"
**Solution:**
```bash
# Kill process on port 8000
lsof -ti:8000 | xargs kill -9

# Kill process on port 3000
lsof -ti:3000 | xargs kill -9
```

### Issue: "Email not sending"
**Solution:**
1. Check Gmail app password is correct (no spaces!)
2. Enable "Less secure app access" in Gmail settings
3. Make sure 2-factor authentication is enabled
4. Try sending a test email manually

---

## 🎯 Quick Start Checklist

- [ ] Downloaded project ZIP
- [ ] Extracted to a folder
- [ ] Opened Terminal
- [ ] Installed Python (3.9+)
- [ ] Installed Node.js (LTS)
- [ ] Ran setup script OR completed manual setup
- [ ] Created .env files with credentials
- [ ] Started backend server
- [ ] Started frontend server
- [ ] Tested at http://localhost:3000
- [ ] Configured Gmail app password
- [ ] Tested email notification

---

## 📞 Need Help?

If something doesn't work:
1. Copy the exact error message
2. Check the "Common Issues" section above
3. Search the error on Google
4. Ask in project issues on GitHub

---

## 🎓 Learning Resources

- **Python Tutorial:** https://www.python.org/about/gettingstarted/
- **Node.js Tutorial:** https://nodejs.org/en/docs/guides/
- **Terminal Basics:** https://www.codecademy.com/articles/command-line-setup
- **React Basics:** https://react.dev/learn

Congratulations! You're now ready to use the Dropout Prediction System! 🎉
