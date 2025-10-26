# Complete GitHub Setup Script for Windows
# Run this in PowerShell after creating your GitHub repository

Write-Host "🎵 Spotify Widget - Complete GitHub Setup" -ForegroundColor Green
Write-Host ("=" * 45) -ForegroundColor Yellow

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Host "❌ Not a Git repository. Please run this from your project directory." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "📋 Step 1: Create GitHub Repository" -ForegroundColor Cyan
Write-Host "1. Go to https://github.com/new" -ForegroundColor White
Write-Host "2. Repository name: 'spotify-now-playing' (or your choice)" -ForegroundColor White
Write-Host "3. Make sure 'Add a README file' is UNCHECKED" -ForegroundColor White
Write-Host "4. Click 'Create repository'" -ForegroundColor White
Write-Host ""

Write-Host "📋 Step 2: Copy the repository URL" -ForegroundColor Cyan
Write-Host "After creating the repo, GitHub will show you the URL." -ForegroundColor White
Write-Host "It will look like: https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git" -ForegroundColor White
Write-Host ""

$repoUrl = Read-Host "Enter your GitHub repository URL"

if ([string]::IsNullOrEmpty($repoUrl)) {
    Write-Host "❌ No repository URL provided." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🔗 Step 3: Adding remote and pushing..." -ForegroundColor Green
git remote add origin $repoUrl
git branch -M main
git push -u origin main

Write-Host ""
Write-Host "✅ SUCCESS! Your widget is now on GitHub!" -ForegroundColor Green
Write-Host ""
Write-Host "🎉 Step 4: Deploy to Vercel" -ForegroundColor Yellow
Write-Host "1. Go to https://vercel.com" -ForegroundColor White
Write-Host "2. Click 'Import Project'" -ForegroundColor White
Write-Host "3. Connect your GitHub account" -ForegroundColor White
Write-Host "4. Select your spotify widget repository" -ForegroundColor White
Write-Host "5. Add environment variables:" -ForegroundColor White
Write-Host "   SPOTIFY_CLIENT_ID = your_spotify_client_id" -ForegroundColor White
Write-Host "   SPOTIFY_SECRET_ID = your_spotify_client_secret" -ForegroundColor White
Write-Host "   SPOTIFY_REFRESH_TOKEN = your_spotify_refresh_token" -ForegroundColor White
Write-Host "6. Click 'Deploy'" -ForegroundColor White
Write-Host ""
Write-Host "🌐 Your public widget will be at: https://your-repo-name.vercel.app" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Finally, update your README.md with your new URL!" -ForegroundColor Yellow
Write-Host "Replace: https://your-project-name.vercel.app" -ForegroundColor White
Write-Host "With your actual Vercel URL" -ForegroundColor White
