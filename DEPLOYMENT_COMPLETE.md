# 🚀 Complete Deployment Guide - Frontend + Backend

Your Netlify frontend is live! Now let's deploy the backend and connect them.

**Your Sites:**
- ✅ Frontend: https://riskmangement.netlify.app/
- 🔄 Backend: Will be deployed to Render

---

## Step 1: Deploy Backend to Render

### 1.1 Go to Render
1. Visit https://render.com
2. Sign up with your GitHub account
3. Click **"New +"** → **"Web Service"**

### 1.2 Connect Repository
1. Select **"Build and deploy from a Git repository"**
2. Find your repo: `drop-out-prediction-and-counselling-system`
3. Click **"Connect"**

### 1.3 Configure Service
Render should auto-detect settings from `render.yaml`, but verify:

- **Name:** `dropout-backend` (or any name)
- **Branch:** `main`
- **Build Command:** `pip install -r requirements.txt`
- **Start Command:** `uvicorn backend.app:app --host 0.0.0.0 --port $PORT`
- **Plan:** Free (sufficient for testing)

Click **"Create Web Service"**

### 1.4 Wait for First Deploy
- Build takes ~2-3 minutes
- You'll get a URL like: `https://dropout-backend-xyz.onrender.com`
- **Copy this URL** - you'll need it next!

---

## Step 2: Set Backend Environment Variables

After your backend deploys, configure it in Render dashboard:

### 2.1 Go to Environment Tab
1. In your Render service → **Environment** tab
2. Add these variables:

### 2.2 Required Variables
```
SMTP_EMAIL = likhithakadavakolla@gmail.com
SMTP_PASSWORD = pnmjaxrnxouwckmj
CORS_ORIGINS = https://riskmangement.netlify.app
```

### 2.3 Save and Redeploy
1. Click **"Save Changes"**
2. Render will automatically redeploy with new env vars
3. Wait ~1 minute for redeploy to complete

---

## Step 3: Connect Frontend to Backend

### 3.1 Update Netlify Environment
1. Go to https://app.netlify.com
2. Find your site: `riskmangement`
3. Go to **Site settings** → **Build & deploy** → **Environment variables**
4. Add this variable:

```
Key: REACT_APP_API_URL
Value: https://your-backend-url.onrender.com
```

**Replace `your-backend-url.onrender.com` with your actual Render URL!**

### 3.2 Trigger Netlify Redeploy
1. Go to **Deploys** tab
2. Click **"Trigger deploy"** → **"Deploy site"**
3. Wait ~2 minutes for build

---

## Step 4: Test the Connection

### 4.1 Open Your Site
Visit: https://riskmangement.netlify.app/

### 4.2 Verify Everything Works
1. ✅ Student list loads (API working)
2. ✅ Click "Predict Risk" (predictions work)
3. ✅ Click "Notify" on a red student (emails sent)
4. ✅ No console errors (F12 → Console)

---

## 🔧 Exact Values You Need

When you get your Render URL, use these exact values:

### In Render Environment Variables:
```
SMTP_EMAIL = likhithakadavakolla@gmail.com
SMTP_PASSWORD = pnmjaxrnxouwckmj
CORS_ORIGINS = https://riskmangement.netlify.app
```

### In Netlify Environment Variables:
```
REACT_APP_API_URL = [YOUR RENDER URL HERE]
```

Example:
```
REACT_APP_API_URL = https://dropout-backend-abc123.onrender.com
```

---

## 🚨 Common Issues & Solutions

### Issue: "Network Error" in frontend
**Cause:** CORS not configured
**Solution:** Make sure `CORS_ORIGINS = https://riskmangement.netlify.app` is set in Render

### Issue: "Email failed" messages
**Cause:** SMTP credentials missing
**Solution:** Verify `SMTP_EMAIL` and `SMTP_PASSWORD` are set in Render

### Issue: Backend shows "Application failed to respond"
**Cause:** Build failed
**Solution:** Check Render logs → Events tab for error details

### Issue: Frontend shows old localhost API
**Cause:** Netlify cache
**Solution:** Clear cache: Deploys → Trigger deploy → Clear cache and deploy

---

## ✅ Success Checklist

After completing all steps:

- [ ] Backend deployed on Render with green status
- [ ] Backend environment variables set (SMTP + CORS)
- [ ] Frontend environment variable set (REACT_APP_API_URL)
- [ ] Frontend redeployed on Netlify
- [ ] Site loads at https://riskmangement.netlify.app/
- [ ] Student data loads from API
- [ ] Risk predictions work
- [ ] Email notifications send successfully
- [ ] No console errors

---

## 📞 Next Steps

1. **Deploy backend** using steps above
2. **Share your Render URL** with me
3. I'll give you the **exact environment variable values** to copy-paste
4. **Test everything works**

The whole process takes ~10 minutes once you start!

---

**Ready? Start with Step 1: Go to render.com and deploy your backend!**