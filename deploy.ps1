# Spotify Widget Deployment Script for Windows
# Run this in PowerShell as Administrator

Write-Host "🎵 Spotify Now Playing Widget - Deployment Helper" -ForegroundColor Green
Write-Host ("=" * 50) -ForegroundColor Yellow

# Check if Node.js is installed
$nodeVersion = & node --version 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Node.js is not installed. Please install Node.js first." -ForegroundColor Red
    Write-Host "   Download from: https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

Write-Host "📦 Installing Vercel CLI..." -ForegroundColor Cyan
npm install -g vercel

Write-Host ""
Write-Host "🚀 Starting deployment..." -ForegroundColor Green
Write-Host ""

# Deploy to Vercel
vercel --prod

Write-Host ""
Write-Host "✅ Deployment complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Next steps:" -ForegroundColor Yellow
Write-Host "1. Go to your Vercel dashboard" -ForegroundColor White
Write-Host "2. Set environment variables:" -ForegroundColor White
Write-Host "   - SPOTIFY_CLIENT_ID" -ForegroundColor White
Write-Host "   - SPOTIFY_SECRET_ID" -ForegroundColor White
Write-Host "   - SPOTIFY_REFRESH_TOKEN" -ForegroundColor White
Write-Host "3. Copy your new URL and update your README" -ForegroundColor White
Write-Host ""
Write-Host "🎉 Your widget is now public!" -ForegroundColor Green
