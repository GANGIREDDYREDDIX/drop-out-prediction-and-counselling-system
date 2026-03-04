# 🔧 Quick Fix - Netlify Environment Variable

## Problem
Frontend is still calling `http://127.0.0.1:8000` instead of your deployed backend.

## Solution: Set Netlify Environment Variable

### Step 1: Open Netlify Dashboard
Go to: https://app.netlify.com

### Step 2: Find Your Site
Click on: **riskmangement**

### Step 3: Go to Build & Deploy Settings
Click: **Site settings** → **Build & deploy** → **Environment**

### Step 4: Add Environment Variable
Click **Edit variables** and add:

```
Key: REACT_APP_API_URL
Value: https://drop-out-prediction-and-counselling.onrender.com
```

**IMPORTANT:** Make sure you copy the value EXACTLY:
```
https://drop-out-prediction-and-counselling.onrender.com
```

### Step 5: Save
Click **Save** button

### Step 6: Redeploy Frontend
1. Go to **Deploys** tab
2. Click **Trigger deploy** 
3. Select **Deploy site** (or "Clear cache and deploy site")
4. Wait ~2 minutes for build

### Step 7: Test
Open https://riskmangement.netlify.app/ and verify:
- ✅ Student list loads
- ✅ No error popup
- ✅ Can click buttons

---

## If Still Failing

1. Open browser DevTools (F12)
2. Go to **Console** tab
3. Look for the actual error message
4. Check **Network** tab for API calls
5. Share the error details

---

## ✅ Verification

Your backend is running:
```
https://drop-out-prediction-and-counselling.onrender.com/
```

Response:
```json
{"message":"Dropout Prediction API","status":"running"}
```

Just need to connect it to Netlify via the environment variable!
