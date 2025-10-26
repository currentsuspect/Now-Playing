#!/bin/bash

# Spotify Widget Deployment Script
# This script helps deploy your widget to Vercel

echo "🎵 Spotify Now Playing Widget - Deployment Helper"
echo "=" * 50

# Check if vercel is installed
if ! command -v vercel &> /dev/null; then
    echo "📦 Installing Vercel CLI..."
    npm install -g vercel
fi

echo ""
echo "🚀 Starting deployment..."
echo ""

# Deploy to Vercel
vercel --prod

echo ""
echo "✅ Deployment complete!"
echo ""
echo "📝 Next steps:"
echo "1. Go to your Vercel dashboard"
echo "2. Set environment variables:"
echo "   - SPOTIFY_CLIENT_ID"
echo "   - SPOTIFY_SECRET_ID"
echo "   - SPOTIFY_REFRESH_TOKEN"
echo "3. Copy your new URL and update your README"
echo ""
echo "🎉 Your widget is now public!"
