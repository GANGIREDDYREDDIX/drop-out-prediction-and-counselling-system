# 🚀 Netlify Deployment Guide

## Fix for Deployment Failures

The deployment was failing due to missing Netlify configuration. This guide will fix it!

---

## 🔧 What I Fixed

1. ✅ Created `netlify.toml` - Tells Netlify how to build your app
2. ✅ Created `.env.production` - Environment variables for production
3. ✅ Configured build directory - Points to React build folder
4. ✅ Set up redirects - For React Router support
5. ✅ Added security headers - For protection

---

## 📋 Step-by-Step Deployment

### Step 1: Connect GitHub to Netlify

1. Go to https://app.netlify.com
2. Click **"Add new site"**
3. Select **"Connect to Git"**
4. Choose **"GitHub"**
5. Select repository: `drop-out-prediction-and-counselling-system`
6. Click **"Connect"**

### Step 2: Configure Build Settings

Netlify should auto-detect settings, but verify:

**Build Command:** 
```
cd frontend-react && npm run build
```

**Publish Directory:**
```
frontend-react/build
```

**Node Version:** 18 (or higher)

### Step 3: Add Environment Variables

In Netlify Dashboard:
1. Go to **"Site settings"**
2. Click **"Build & deploy"**
3. Click **"Environment"**
4. Add variable:
   - **Key:** `REACT_APP_API_URL`
   - **Value:** `http://localhost:8000` (for testing) or `https://your-api.com` (for production)

### Step 4: Deploy

1. Push your code to GitHub main branch
2. Netlify automatically builds and deploys
3. Your site will be live in 2-3 minutes!

---

## ⚙️ Understanding the Configuration

### netlify.toml Explained

```toml
[build]
command = "cd frontend-react && npm run build"
publish = "frontend-react/build"
```

- **command:** Tells Netlify how to build the React app
- **publish:** Tells Netlify where the built files are

### Environment Variables

**REACT_APP_API_URL:** URL of your backend API
- For development: `http://localhost:8000`
- For production: `https://your-api-domain.com`

**NODE_VERSION:** Specifies Node.js version to use
- Current: 18.17.0 (recommended)

---

## 📊 Deployment URL Structure

Once deployed, your site will be available at:

```
https://your-site-name.netlify.app
```

Example:
```
https://dropout-prediction-system.netlify.app
```

---

## 🔗 Connecting Frontend to Backend

### For Local Testing (localhost:3000)
```
REACT_APP_API_URL=http://localhost:8000
```

### For Deployed Frontend + Local Backend
```
REACT_APP_API_URL=http://localhost:8000
```

### For Deployed Frontend + Deployed Backend
```
REACT_APP_API_URL=https://your-backend-api.com
```

### To Set in Netlify:
1. Site settings → Build & deploy → Environment
2. Add environment variable with above URL

---

## 🧪 Troubleshooting Deployment

### Error: "npm: command not found"
**Solution:** Netlify needs Node.js
- Check `netlify.toml` has `NODE_VERSION = "18.17.0"`
- Clear cache: Site settings → Deploys → Trigger deploy (with cache cleared)

### Error: "build failed"
**Solution:** Check build log
1. Go to Deploys
2. Click failed deploy
3. Read the error message
4. Common fixes:
   - Missing dependencies: Run `npm install` locally and commit package-lock.json
   - Wrong build path: Verify `publish = "frontend-react/build"`
   - Missing .env file: Create `.env.production` in frontend-react folder

### Error: "Cannot find module"
**Solution:** Install missing packages
```bash
cd frontend-react
npm install
git add package-lock.json
git commit -m "Update dependencies"
git push
```

### API calls not working
**Solution:** Check `REACT_APP_API_URL` environment variable
1. Site settings → Build & deploy → Environment
2. Verify `REACT_APP_API_URL` is set to correct API endpoint
3. Redeploy (Force a deploy to pick up new env vars)

### Page shows blank or 404
**Solution:** React Router needs redirect configuration
- Netlify.toml already has this configured
- Try clearing Netlify cache and redeploying

---

## 🔐 Production Checklist

Before sharing your deployed site:

- [ ] Frontend builds successfully
- [ ] No console errors in browser
- [ ] API endpoint is correct
- [ ] Notifications can be sent
- [ ] Dark/Light mode toggle works
- [ ] Student data loads
- [ ] Predictions work
- [ ] All links work
- [ ] Page doesn't show 404 on refresh
- [ ] Site is fast (< 3 seconds load time)

---

## 📱 Production Environment Variables

### Required Variables:

```
REACT_APP_API_URL=https://your-api-domain.com
```

### Optional Variables:

```
REACT_APP_LOG_LEVEL=info
```

---

## 🚀 Advanced Deployment

### Custom Domain

1. In Netlify: Site settings → Domain management
2. Add your domain (e.g., dropout-system.com)
3. Follow DNS setup instructions
4. SSL certificate auto-generated

### Performance Optimization

Netlify automatically:
- ✅ Minifies CSS/JS
- ✅ Compresses images
- ✅ Uses CDN globally
- ✅ Sets cache headers

### Monitoring

In Netlify Dashboard:
- View deploy logs
- Monitor build time
- Check bandwidth usage
- See analytics

---

## 📞 Common Issues & Solutions

| Issue | Cause | Solution |
|-------|-------|----------|
| Build fails | Missing dependencies | Run `npm install` locally |
| Blank page | Wrong build directory | Verify `publish` in netlify.toml |
| 404 on refresh | Missing React Router redirect | netlify.toml has fix |
| API not working | Wrong API URL | Set `REACT_APP_API_URL` env var |
| Slow load | Large assets | Images should be < 500KB |

---

## 🎯 Next Steps

1. **Verify Files:**
   ```bash
   # Check netlify.toml exists
   ls -la netlify.toml
   
   # Check .env.production exists
   ls -la frontend-react/.env.production
   ```

2. **Push to GitHub:**
   ```bash
   git add netlify.toml frontend-react/.env.production
   git commit -m "Add Netlify deployment configuration"
   git push
   ```

3. **Connect to Netlify:**
   - Go to https://app.netlify.com
   - Click "Add new site"
   - Select your GitHub repository

4. **Configure Environment:**
   - Add `REACT_APP_API_URL` variable in Netlify dashboard
   - Set to your API endpoint

5. **Deploy:**
   - Netlify auto-deploys on push to main branch
   - Check Deploys tab to monitor build progress

---

## 📚 Additional Resources

- Netlify Docs: https://docs.netlify.com/
- Netlify Deploy: https://docs.netlify.com/site-deploys/overview/
- Environment Variables: https://docs.netlify.com/configure-builds/environment-variables/
- React Deployment: https://create-react-app.dev/deployment/netlify/

---

## ✅ Verification

After deployment, verify:

1. **Frontend URL works:** `https://your-site.netlify.app`
2. **Student list loads:** API calls succeed
3. **Notifications work:** Can send emails
4. **No console errors:** Browser dev tools show no errors
5. **All pages work:** No 404 errors

---

## 🎉 You're Ready to Deploy!

All necessary files are in place:
- ✅ netlify.toml
- ✅ .env.production
- ✅ Build script in package.json

Just push to GitHub and Netlify will auto-deploy!

---

**Last Updated:** March 4, 2026  
**Status:** Deployment Fixed ✅
