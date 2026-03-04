# 📖 Quick Reference for Likhitha

## 🎯 For Non-Technical Users

This is a **super simple** guide to get the project running without any technical knowledge.

---

## ⚡ The 3-Step Process

### Step 1️⃣: Download Prerequisites
| What | Where | Link |
|------|-------|------|
| **Python** | Computer | https://www.python.org/downloads/ |
| **Node.js** | Computer | https://nodejs.org/ |
| **Project Code** | From GitHub | Click "Code" → "Download ZIP" |

✅ **Important:** During Python installation, CHECK "Add Python to PATH"

### Step 2️⃣: Run Setup Script
- **Mac/Linux:** Open Terminal → Type: `bash setup.sh`
- **Windows:** Double-click `setup.bat`

This automatically installs everything!

### Step 3️⃣: Start the Application
Open Terminal and run these commands:

**Terminal 1 (Backend):**
```bash
cd backend
python -m uvicorn app:app --host 127.0.0.1 --port 8000
```

**Terminal 2 (Frontend):**
```bash
cd frontend-react
npm start
```

**Open Browser:** http://localhost:3000

---

## 🔐 Setup Gmail Notifications (One-time setup)

### Option A: Quick Setup (Already Configured)
- Email credentials are already set in the code
- Just make sure Gmail 2-factor authentication is enabled

### Option B: Use Your Own Gmail
1. Go to https://myaccount.google.com/
2. Click **Security** → **2-Step Verification** → Enable it
3. Go back to **Security** → **App passwords**
4. Select **Mail** and **Windows Computer**
5. Copy the 16-character password
6. Open `backend/notifier.py` and replace:
   - `EMAIL` = your-gmail@gmail.com
   - `PASSWORD` = your-16-character-app-password

---

## ✅ How to Test It Works

### Test 1: Backend is Running
Open browser: http://localhost:8000/students
Should see: JSON data with student list

### Test 2: Frontend is Running
Open browser: http://localhost:3000
Should see: Dashboard with students and buttons

### Test 3: Notifications Work
1. Click **"Predict Risk"**
2. Find a student with 🔴 RED badge
3. Click **"Notify"** button
4. Check your email in 30 seconds

---

## 🆘 If Something Goes Wrong

| Problem | Solution |
|---------|----------|
| "Python not found" | Reinstall Python, check "Add to PATH" |
| "npm not found" | Reinstall Node.js |
| "Port already in use" | Close other apps using that port |
| "Module not found" | Run `pip install -r requirements.txt` |
| "Email not sending" | Check app password, enable 2FA on Gmail |

---

## 📱 Common Commands

```bash
# Activate Python environment
source venv/bin/activate              # Mac/Linux
venv\Scripts\activate                 # Windows

# Deactivate environment
deactivate

# Start backend
python -m uvicorn app:app --host 127.0.0.1 --port 8000

# Start frontend
npm start

# Stop servers
Ctrl + C (both terminals)

# View running processes
ps aux | grep python                  # Mac/Linux
tasklist | findstr python             # Windows

# Kill process on port
lsof -ti:8000 | xargs kill -9        # Mac/Linux
netstat -ano | findstr :8000          # Windows
```

---

## 🎓 Folder Structure Explained

```
project/
├── backend/                    # Server code (Python)
│   ├── app.py                 # Main API
│   └── notifier.py            # Email sending
├── frontend-react/             # Website code (JavaScript/React)
│   └── src/
│       ├── App.js             # Main page
│       └── App.css            # Styling
├── frontend/                   # Old version (not used)
│   └── data/
│       └── student_data.csv   # Student information
└── ml/                         # Machine learning models
```

---

## 💾 File Locations

- **Student Data:** `frontend/data/student_data.csv`
- **Backend Config:** `backend/notifier.py` (lines 10-14)
- **Frontend Config:** `frontend-react/.env`
- **Server Logs:** Terminal where you started the server

---

## 🚀 You're Ready!

You now have everything you need. If you get stuck, just follow these steps again or read `SETUP_GUIDE.md` for more details.

**Good luck! 🎉**
