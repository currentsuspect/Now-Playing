#!/bin/bash

# GitHub Push Helper Script
# Run this after creating your GitHub repository

echo "🚀 Spotify Widget - GitHub Push Helper"
echo "=" * 40

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "❌ Not a Git repository. Run 'git init' first."
    exit 1
fi

echo ""
echo "📋 Instructions:"
echo "1. Create a new repository on GitHub (don't initialize with README)"
echo "2. Copy the repository URL (e.g., https://github.com/username/spotify-widget.git)"
echo "3. Replace YOUR_REPO_URL below with your actual GitHub repository URL"
echo ""

# Prompt for repository URL
echo "Enter your GitHub repository URL:"
read -p "Repository URL: " repo_url

if [ -z "$repo_url" ]; then
    echo "❌ No repository URL provided."
    exit 1
fi

echo ""
echo "🔗 Adding remote origin..."
git remote add origin "$repo_url"

echo "📤 Pushing to GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ Successfully pushed to GitHub!"
echo ""
echo "🎉 Next steps:"
echo "1. Go to Vercel.com and import this repository"
echo "2. Set environment variables in Vercel dashboard"
echo "3. Deploy your widget!"
echo ""
echo "🌐 Your widget will be available at: https://your-repo-name.vercel.app"
