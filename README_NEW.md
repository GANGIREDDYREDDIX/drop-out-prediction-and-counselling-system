# 🎓 Student Dropout Prediction & Counselling System

A comprehensive system to predict student dropouts and provide timely notifications to mentors and guardians.

---

## 📊 Quick Stats

- **Students Monitored:** 11+
- **Risk Factors:** 3 (Attendance, Marks, Attempts)
- **Notification System:** Email-based (Gmail)
- **Interface:** Modern React Dashboard
- **Backend:** FastAPI Python Server

---

## 🚀 Quick Start (Recommended for Beginners)

### 1️⃣ **Download and Install Prerequisites**

**For Mac/Linux:**
```bash
# Install Python (3.9+)
brew install python@3.9

# Install Node.js
brew install node
```

**For Windows:**
- Download Python: https://www.python.org/downloads/
- Download Node.js: https://nodejs.org/

✅ **Important:** During Python installation, CHECK "Add Python to PATH"

### 2️⃣ **Automated Setup (One Command)**

**Mac/Linux:**
```bash
bash setup.sh
```

**Windows:**
```bash
setup.bat
```

This will automatically:
- ✅ Create Python virtual environment
- ✅ Install all dependencies
- ✅ Configure environment files
- ✅ Prepare the application

### 3️⃣ **Start the Application**

**Terminal 1 - Backend Server:**
```bash
source venv/bin/activate           # Mac/Linux
# OR
venv\Scripts\activate              # Windows

cd backend
python -m uvicorn app:app --host 127.0.0.1 --port 8000
```

**Terminal 2 - Frontend Server:**
```bash
cd frontend-react
npm start
```

### 4️⃣ **Open in Browser**
```
http://localhost:3000
```

---

## 📖 Detailed Setup Guide

For complete setup instructions with troubleshooting, see:
- 📋 [SETUP_GUIDE.md](SETUP_GUIDE.md) - Comprehensive guide with images
- ⚡ [QUICK_START.md](QUICK_START.md) - Simple checklist for beginners

---

## 🎯 Features

### 📊 Dashboard
- View all students and their metrics
- Real-time risk status (🟢 Low / 🟠 Medium / 🔴 High)
- Attendance, Marks, and Attempts tracking
- Dark/Light theme toggle

### 🔐 Risk Prediction
- Automatic risk assessment based on:
  - **Attendance:** < 60% = Higher risk
  - **Marks:** < 40 = Higher risk
  - **Attempts:** ≥ 3 = Higher risk

### 📧 Notifications
- Email alerts to mentors and guardians
- Detailed risk analysis
- Action items and recommendations
- 48-hour response timeline

### 🎨 Modern UI
- Clean, minimalist design
- Fast and responsive
- No flickering or lag
- Works on mobile and desktop

---

## 🔧 Configuration

### Gmail Setup (For Email Notifications)

#### Option 1: Using Default Credentials
The system comes pre-configured with test credentials. No action needed!

#### Option 2: Use Your Own Gmail

1. **Enable 2-Factor Authentication:**
   - Go to https://myaccount.google.com/
   - Click **Security**
   - Find **2-Step Verification**
   - Click **Enable 2-Step Verification**

2. **Generate App Password:**
   - Go back to **Security**
   - Find **App passwords**
   - Select: **Mail** + **Windows/Mac/Linux**
   - Copy the 16-character password

3. **Update Configuration:**
   - Open: `backend/notifier.py`
   - Find lines 10-14
   - Replace:
     ```python
     EMAIL = "your-email@gmail.com"
     PASSWORD = "your-16-char-password"  # No spaces!
     ```

---

## 📁 Project Structure

```
drop-out-prediction-and-counselling-system/
├── 📁 backend/                      # FastAPI Server
│   ├── app.py                      # Main API endpoints
│   ├── notifier.py                 # Email notification service
│   └── requirements.txt            # Python dependencies
│
├── 📁 frontend-react/               # React Dashboard
│   ├── src/
│   │   ├── App.js                  # Main component
│   │   ├── App.css                 # Styling
│   │   └── ...
│   ├── package.json               # Node dependencies
│   └── .env                        # Configuration
│
├── 📁 frontend/                     # Old version (archived)
│   └── data/
│       └── student_data.csv        # Student information
│
├── 📁 ml/                           # ML models
│   ├── code/                       # Python scripts
│   └── data/                       # Training data
│
├── SETUP_GUIDE.md                  # Detailed setup
├── QUICK_START.md                  # Quick reference
├── setup.sh                        # Mac/Linux automation
├── setup.bat                       # Windows automation
└── README.md                       # This file

```

---

## 🔌 API Endpoints

### Backend Server (http://localhost:8000)

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/students` | GET | Get all students |
| `/predict` | POST | Predict risk for a student |
| `/docs` | GET | Interactive API documentation |

**Example Usage:**
```bash
# Get all students
curl http://localhost:8000/students

# Predict risk for student
curl -X POST http://localhost:8000/predict \
  -H "Content-Type: application/json" \
  -d '{"student_id": 11, "attendance": 45, "marks": 32, "attempts": 4}'
```

---

## 🧪 Testing

### Test 1: Backend API
```bash
# Should return 200 OK with student list
curl http://localhost:8000/students
```

### Test 2: Frontend UI
```bash
# Open browser and navigate to
http://localhost:3000
```

### Test 3: Email Notifications
1. Click **"Predict Risk"** button
2. Find a 🔴 **RED RISK** student
3. Click **"Notify"** button
4. Check email in 30 seconds

---

## ⚙️ Requirements

### System Requirements
- **OS:** macOS, Windows, or Linux
- **RAM:** 2GB minimum
- **Storage:** 500MB free space
- **Internet:** Required for email

### Software Requirements
- **Python:** 3.9 or higher
- **Node.js:** 14 or higher
- **npm:** 6 or higher

### Browser Support
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

---

## 🐛 Troubleshooting

### "Python not found"
```bash
# Reinstall Python and ensure "Add to PATH" is checked
# Verify installation:
python --version
```

### "npm not found"
```bash
# Reinstall Node.js from nodejs.org
# Restart terminal and verify:
npm --version
```

### "Port 8000 already in use"
```bash
# Kill process on port 8000
# Mac/Linux:
lsof -ti:8000 | xargs kill -9

# Windows:
netstat -ano | findstr :8000
taskkill /PID <PID> /F
```

### "ModuleNotFoundError"
```bash
# Make sure virtual environment is activated
source venv/bin/activate           # Mac/Linux
# OR
venv\Scripts\activate              # Windows

# Install requirements
pip install -r requirements.txt
```

### "Email not sending"
1. Check Gmail app password (no spaces!)
2. Verify 2-factor authentication is enabled
3. Check internet connection
4. Wait 30 seconds before retrying

For more troubleshooting, see [SETUP_GUIDE.md](SETUP_GUIDE.md).

---

## 📧 Email Credentials

### Default Credentials (Pre-configured)
- **Email:** likhithakadavakolla@gmail.com
- **Purpose:** Testing and demonstration

### To Use Your Own
Follow the "Gmail Setup" section above.

---

## 📚 Documentation

- **[SETUP_GUIDE.md](SETUP_GUIDE.md)** - Complete setup with images and troubleshooting
- **[QUICK_START.md](QUICK_START.md)** - Quick reference for beginners
- **API Docs:** http://localhost:8000/docs (when server is running)

---

## 👥 Team

Developed by the Educational Technology Team

- **Project Lead:** Likhitha Kadavakolla
- **Backend Developer:** Vishnu Vardhan Reddy
- **Frontend Developer:** Vishnu Vardhan Reddy
- **ML Engineer:** Vishnu Vardhan Reddy

---

## 📜 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📞 Support

If you encounter any issues:

1. Check [SETUP_GUIDE.md](SETUP_GUIDE.md) for troubleshooting
2. Check [QUICK_START.md](QUICK_START.md) for quick reference
3. Open an issue on GitHub
4. Contact the development team

---

## 🎓 Learning Resources

- **Python:** https://www.python.org/about/gettingstarted/
- **FastAPI:** https://fastapi.tiangolo.com/
- **React:** https://react.dev/
- **Node.js:** https://nodejs.org/en/docs/guides/

---

## ✨ Future Enhancements

- [ ] Mobile app
- [ ] SMS notifications
- [ ] Advanced ML models
- [ ] Database integration
- [ ] Multi-institution support
- [ ] Admin dashboard
- [ ] Audit logs

---

## 🚀 Performance

- **Backend Response Time:** < 500ms
- **Frontend Load Time:** < 2s
- **Email Delivery:** < 30s
- **UI Rendering:** < 100ms

---

**Last Updated:** March 4, 2026  
**Version:** 1.0.0  
**Status:** Production Ready ✅

---

## 🎉 Getting Started Now?

1. Read [QUICK_START.md](QUICK_START.md) (5 minutes)
2. Run the setup script (`setup.sh` or `setup.bat`)
3. Start both servers
4. Open http://localhost:3000
5. Enjoy! 🎊

**Questions?** Check [SETUP_GUIDE.md](SETUP_GUIDE.md) for detailed instructions!
