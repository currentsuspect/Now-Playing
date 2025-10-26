#!/bin/bash
# Complete GitHub Setup Script
# Run this after creating your GitHub repository

echo "🎵 Spotify Widget - Complete GitHub Setup"
echo "=" * 45

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "❌ Not a Git repository. Please run this from your project directory."
    exit 1
fi

echo ""
echo "📋 Step 1: Create GitHub Repository"
echo "1. Go to https://github.com/new"
echo "2. Repository name: 'spotify-now-playing' (or your choice)"
echo "3. Make sure 'Add a README file' is UNCHECKED"
echo "4. Click 'Create repository'"
echo ""

echo "📋 Step 2: Copy the repository URL"
echo "After creating the repo, GitHub will show you the URL."
echo "It will look like: https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git"
echo ""

echo "Enter your GitHub repository URL:"
read -p "Repository URL: " repo_url

if [ -z "$repo_url" ]; then
    echo "❌ No repository URL provided."
    exit 1
fi

echo ""
echo "🔗 Step 3: Adding remote and pushing..."
git remote add origin "$repo_url"
git branch -M main
git push -u origin main

echo ""
echo "✅ SUCCESS! Your widget is now on GitHub!"
echo ""
echo "🎉 Step 4: Deploy to Vercel"
echo "1. Go to https://vercel.com"
echo "2. Click 'Import Project'"
echo "3. Connect your GitHub account"
echo "4. Select your spotify widget repository"
echo "5. Add environment variables:"
echo "   SPOTIFY_CLIENT_ID = your_spotify_client_id"
echo "   SPOTIFY_SECRET_ID = your_spotify_client_secret"
echo "   SPOTIFY_REFRESH_TOKEN = your_spotify_refresh_token"
echo "6. Click 'Deploy'"
echo ""
echo "🌐 Your public widget will be at: https://your-repo-name.vercel.app"
echo ""
echo "📝 Finally, update your README.md with your new URL!"
echo "Replace: https://your-project-name.vercel.app"
echo "With your actual Vercel URL"
