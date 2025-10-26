# GitHub Push Helper Script for Windows
# Run this in PowerShell after creating your GitHub repository

Write-Host "🚀 Spotify Widget - GitHub Push Helper" -ForegroundColor Green
Write-Host ("=" * 40) -ForegroundColor Yellow

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Host "❌ Not a Git repository. Run 'git init' first." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "📋 Instructions:" -ForegroundColor Cyan
Write-Host "1. Create a new repository on GitHub (don't initialize with README)" -ForegroundColor White
Write-Host "2. Copy the repository URL (e.g., https://github.com/username/spotify-widget.git)" -ForegroundColor White
Write-Host "3. Replace YOUR_REPO_URL below with your actual GitHub repository URL" -ForegroundColor White
Write-Host ""

$repoUrl = Read-Host "Enter your GitHub repository URL"

if ([string]::IsNullOrEmpty($repoUrl)) {
    Write-Host "❌ No repository URL provided." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🔗 Adding remote origin..." -ForegroundColor Green
git remote add origin $repoUrl

Write-Host "📤 Pushing to GitHub..." -ForegroundColor Green
git branch -M main
git push -u origin main

Write-Host ""
Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
Write-Host ""
Write-Host "🎉 Next steps:" -ForegroundColor Yellow
Write-Host "1. Go to Vercel.com and import this repository" -ForegroundColor White
Write-Host "2. Set environment variables in Vercel dashboard" -ForegroundColor White
Write-Host "3. Deploy your widget!" -ForegroundColor White
Write-Host ""
Write-Host "🌐 Your widget will be available at: https://your-repo-name.vercel.app" -ForegroundColor Green
