# 🎵 Spotify Now Playing Widget

A dynamic SVG widget that displays your currently playing Spotify track or recently played songs. Perfect for GitHub READMEs and personal websites.

![Spotify](https://img.shields.io/badge/Spotify-1DB954?style=for-the-badge&logo=spotify&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

## ✨ Features

- 🎶 **Real-time Updates**: Shows currently playing track or falls back to recently played
- 🎨 **Beautiful SVG Design**: Clean, modern widget with Spotify's signature green theme
- 📱 **Responsive**: Works perfectly in GitHub READMEs and web pages
- ⚡ **Animated Elements**: Progress bars and loading animations when playing
- 🔄 **Auto-refresh Tokens**: Handles Spotify API token refresh automatically
- 🚀 **Vercel Ready**: Optimized for deployment on Vercel
- 🖼️ **Album Art**: Displays track album artwork when available

## 🚀 Quick Start

### 1. Get Your Spotify Credentials

1. Go to [Spotify Developer Dashboard](https://developer.spotify.com/dashboard)
2. Create a new app or use an existing one
3. Note your **Client ID** and **Client Secret**
4. Add `http://127.0.0.1:8888/callback` to your app's redirect URIs

### 2. Setup and Run Locally

```bash
# Clone or download the project
cd now-playing-widget

# Install dependencies
pip install -r requirements.txt

# Set up your credentials
# Edit the .env file with your Spotify credentials
SPOTIFY_CLIENT_ID=your_client_id_here
SPOTIFY_CLIENT_SECRET=your_client_secret_here
SPOTIFY_REFRESH_TOKEN=your_refresh_token_here
```

### 3. Get Your Refresh Token

```bash
# Run the token generator
python get_refresh_token.py

# This will:
# 1. Open your browser for Spotify authorization
# 2. Show you an authorization URL
# 3. Start a local server to receive the callback
# 4. Display your refresh token in the terminal
```

Copy the refresh token and add it to your `.env` file.

### 4. Run the Widget

```bash
# Start the Flask development server
python api/spotify.py

# Visit http://localhost:5000 to see your widget
```

### 5. Use in Your README

Add this markdown to your GitHub README:

```markdown
<!-- Currently Playing -->
![Spotify Now Playing](http://localhost:5000)

<!-- Or for production deployment -->
![Spotify Now Playing](https://your-vercel-domain.vercel.app)
```

## 📁 Project Structure

```
now-playing-widget/
├── api/
│   └── spotify.py          # Main Flask application
├── templates/
│   └── spotify.html.j2     # SVG template
├── get_refresh_token.py    # Spotify OAuth helper
├── requirements.txt        # Python dependencies
├── vercel.json            # Vercel deployment config
├── .env                   # Environment variables (create this)
└── README.md             # This file
```

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
SPOTIFY_CLIENT_ID=your_spotify_client_id
SPOTIFY_CLIENT_SECRET=your_spotify_client_secret
SPOTIFY_REFRESH_TOKEN=your_spotify_refresh_token
```

**Required Scopes:**
- `user-read-currently-playing` - Access to currently playing track
- `user-read-recently-played` - Access to recently played tracks

## 🚀 Deployment

## 🚀 Deploy to Vercel (Recommended)

### **Option 1: Vercel Web Interface (Easiest)**

1. **Go to [vercel.com](https://vercel.com)** and sign in
2. **Click "Import Project"** and connect your GitHub account
3. **Select this repository** from the list
4. **Configure Environment Variables** in the Vercel dashboard:
   ```
   SPOTIFY_CLIENT_ID = your_spotify_client_id
   SPOTIFY_SECRET_ID = your_spotify_client_secret
   SPOTIFY_REFRESH_TOKEN = your_spotify_refresh_token
   ```
5. **Deploy** - Vercel will automatically detect the Python/Flask setup
6. **Copy your new URL** (e.g., `https://your-project-name.vercel.app`)

### **Option 2: Vercel CLI**

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy to production
vercel --prod

# Set environment variables when prompted
vercel env add SPOTIFY_CLIENT_ID
vercel env add SPOTIFY_SECRET_ID
vercel env add SPOTIFY_REFRESH_TOKEN
```

**Or use the included deployment scripts:**

- **Linux/Mac**: `./deploy.sh`
- **Windows**: `powershell -ExecutionPolicy Bypass -File deploy.ps1`

## 📦 **Push to GitHub (Required for Public Deployment)**

### **Option 1: Using Helper Scripts (Recommended)**

**Windows:**
```powershell
powershell -ExecutionPolicy Bypass -File setup-github.ps1
```

**Linux/Mac:**
```bash
./setup-github.sh
```

### **Option 2: Manual Git Commands**

```bash
# Add your GitHub repository as remote (replace with your actual URL)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# Rename branch to main and push
git branch -M main
git push -u origin main
```

### **Option 3: GitHub Desktop**

1. **Download GitHub Desktop** from [desktop.github.com](https://desktop.github.com)
2. **Clone or create** a new repository
3. **Drag your project folder** into GitHub Desktop
4. **Commit and push** to GitHub

## 🔄 **After GitHub Setup**

Once your code is on GitHub:

1. **Go to [vercel.com](https://vercel.com)** and sign in
2. **Click "Import Project"** and connect your GitHub
3. **Select your Spotify widget repository**
4. **Configure environment variables** in Vercel dashboard
5. **Deploy** - You're live! 🎉

**Your public URL will be:** `https://your-repo-name.vercel.app`

## 🌐 **After Deployment**

Once deployed, update your README with:

```markdown
<!-- For production deployment -->
![Spotify Now Playing](https://your-project-name.vercel.app)

<!-- With custom colors -->
![Spotify Now Playing](https://your-project-name.vercel.app?background_color=181414&border_color=1DB954)
```

### **Available URL Parameters:**
- `?background_color=181414` - Custom background color
- `?border_color=1DB954` - Custom border/accent color

### **Available Themes:**
- **Default**: Colorful gradient background
- **Dark**: Dark theme with subtle borders

## 🎯 **Quick Start Summary**

1. ✅ **Create Spotify App** at [developer.spotify.com](https://developer.spotify.com)
2. ✅ **Get Credentials** (Client ID, Secret, Refresh Token)
3. ✅ **Update `.env`** with your credentials
4. ✅ **Test Locally** - `python api/spotify.py`
5. ✅ **Deploy to Vercel** using one of the methods above
6. ✅ **Update README** with your new public URL

**Your widget is ready to go public!** 🚀

### Manual Deployment

The app is configured for Vercel's Python runtime. The `vercel.json` file ensures proper routing and environment variable handling.

## 🎨 Customization

### Widget Appearance

The widget uses Spotify's official colors and styling. You can customize the appearance by editing the `templates/spotify.html.j2` file:

- **Colors**: Modify the gradient stops and color values
- **Size**: Adjust the SVG width and height attributes
- **Layout**: Change text positions and sizing
- **Animations**: Modify the animated progress bars

### Error Handling

The widget gracefully handles various error states:
- **No credentials**: Shows configuration error message
- **No track playing**: Falls back to recently played tracks
- **API errors**: Displays user-friendly error messages
- **Network issues**: Shows appropriate error states

## 🔍 API Endpoints

### Main Widget Endpoint
- **GET /**: Returns the SVG widget
- **Content-Type**: `image/svg+xml`

The widget automatically:
- Refreshes Spotify access tokens when needed
- Fetches currently playing track
- Falls back to recently played tracks if nothing is playing
- Generates animated SVG with track information

## 🛠️ Development

### Running in Development Mode

```bash
# Install development dependencies
pip install -r requirements.txt

# Run with auto-reload
python api/spotify.py
```

### Testing the Widget

1. **Play music** in Spotify (desktop app, web player, or mobile)
2. **Visit** `http://localhost:5000`
3. **Verify** the widget shows your current track
4. **Stop playing** and refresh - should show recently played

### Debugging

The app includes comprehensive logging:
- Track information is logged to console
- API errors are displayed with details
- Token refresh status is shown

## 📋 Troubleshooting

### Common Issues

**"Client not initialized" error:**
- Check that all credentials are set in `.env`
- Verify the refresh token is valid
- Run `python get_refresh_token.py` to get a new token

**Widget shows "No recent tracks":**
- Make sure you've played music recently in Spotify
- Check that your Spotify account has listening activity

**"invalid_client" error:**
- Verify your Client ID and Secret are correct
- Ensure the redirect URI in your Spotify app matches exactly

**Vercel deployment issues:**
- Check environment variables are set in Vercel dashboard
- Verify the `vercel.json` configuration is correct
- Check Vercel function logs for detailed errors

### Getting Help

1. **Check the logs** - The Flask app provides detailed console output
2. **Verify credentials** - Double-check all values in `.env`
3. **Test API calls** - Use Spotify's Web API console to test endpoints
4. **Check permissions** - Ensure your Spotify app has the required scopes

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and enhancement requests.

## 🎵 About Spotify Integration

This widget uses the Spotify Web API to fetch your listening activity. It requires authorization to access your currently playing and recently played tracks. The integration follows Spotify's API guidelines and best practices.

**Privacy Note**: The widget only accesses your listening activity with your explicit permission and doesn't store any personal data.

---

Made with ❤️ and lots of coffee ☕
