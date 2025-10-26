#!/usr/bin/env python3
"""
Spotify Refresh Token Generator

This script helps you get a Spotify refresh token for your application.
Run this script and follow the instructions to authorize your app and get a refresh token.

Usage:
1. Set your SPOTIFY_CLIENT_ID in the .env file or environment variables
2. Run: python get_refresh_token.py
3. Visit the authorization URL in your browser
4. Authorize the application
5. Copy the refresh token from the callback response
6. Add the refresh token to your .env file
"""

import os
import json
import base64
import secrets
import webbrowser
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlencode, parse_qs, urlparse
import requests
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Configuration
CLIENT_ID = os.getenv('SPOTIFY_CLIENT_ID')
CLIENT_SECRET = os.getenv('SPOTIFY_CLIENT_SECRET')
REDIRECT_URI = 'http://127.0.0.1:8888/callback'
SCOPE = 'user-read-currently-playing user-read-recently-played'
STATE = secrets.token_urlsafe(16)

# Global variable to store the authorization code
auth_code = None

class CallbackHandler(BaseHTTPRequestHandler):
    """Handle the OAuth callback from Spotify"""

    def do_GET(self):
        global auth_code

        if '/callback' in self.path:
            # Parse the callback URL
            parsed_url = urlparse(self.path)
            query_params = parse_qs(parsed_url.query)

            if 'code' in query_params:
                auth_code = query_params['code'][0]
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()

                response_html = """
                <html>
                <head><title>Authorization Successful</title></head>
                <body style="font-family: Arial, sans-serif; text-align: center; padding: 50px;">
                    <h2>✅ Authorization Successful!</h2>
                    <p>Your refresh token will be displayed in the terminal.</p>
                    <p>You can close this window now.</p>
                </body>
                </html>
                """
                self.wfile.write(response_html.encode())
                return
            else:
                self.send_response(400)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(b"<h2>Error: No authorization code received</h2>")

    def log_message(self, format, *args):
        # Suppress default HTTP request logs
        pass

def get_authorization_url():
    """Generate the Spotify authorization URL"""
    params = {
        'client_id': CLIENT_ID,
        'response_type': 'code',
        'redirect_uri': REDIRECT_URI,
        'scope': SCOPE,
        'state': STATE
    }

    auth_url = f"https://accounts.spotify.com/authorize?{urlencode(params)}"
    return auth_url

def exchange_code_for_token(auth_code):
    """Exchange authorization code for refresh token"""
    token_url = 'https://accounts.spotify.com/api/token'

    # Encode client ID and secret for Basic auth
    credentials = base64.b64encode(f"{CLIENT_ID}:{CLIENT_SECRET}".encode()).decode()

    headers = {
        'Authorization': f'Basic {credentials}',
        'Content-Type': 'application/x-www-form-urlencoded'
    }

    data = {
        'grant_type': 'authorization_code',
        'code': auth_code,
        'redirect_uri': REDIRECT_URI
    }

    response = requests.post(token_url, headers=headers, data=data)

    if response.status_code == 200:
        token_data = response.json()
        return token_data.get('refresh_token')
    else:
        print(f"❌ Error exchanging code for token: {response.status_code}")
        print(f"Response: {response.text}")
        return None

def main():
    global auth_code

    if not CLIENT_ID:
        print("❌ Error: SPOTIFY_CLIENT_ID not found in environment variables")
        print("Please set your Spotify Client ID in the .env file")
        return

    if not CLIENT_SECRET:
        print("❌ Error: SPOTIFY_CLIENT_SECRET not found in environment variables")
        print("Please set your Spotify Client Secret in the .env file")
        return

    print("🎵 Spotify Refresh Token Generator")
    print("=" * 40)
    print()
    print("1. This script will open your browser for Spotify authorization")
    print("2. Authorize the application when prompted")
    print("3. The refresh token will be displayed here")
    print("4. Copy the refresh token to your .env file")
    print()

    # Generate and display authorization URL
    auth_url = get_authorization_url()
    print(f"🔗 Authorization URL: {auth_url}")
    print()
    print("Opening browser...")
    webbrowser.open(auth_url)

    # Start local server
    print("🌐 Starting local server on http://127.0.0.1:8888...")
    print("Waiting for authorization callback...")
    print()

    server = HTTPServer(('127.0.0.1', 8888), CallbackHandler)

    try:
        # Wait for the callback
        while auth_code is None:
            server.handle_request()

        print("✅ Authorization code received!")
        print("Exchanging for refresh token...")

        # Exchange code for refresh token
        refresh_token = exchange_code_for_token(auth_code)

        if refresh_token:
            print()
            print("🎉 Success! Your refresh token is:")
            print()
            print(f"SPOTIFY_REFRESH_TOKEN={refresh_token}")
            print()
            print("📝 Copy the above line to your .env file")
            print("Then run: python api/spotify.py to start the widget")
        else:
            print("❌ Failed to get refresh token")

    except KeyboardInterrupt:
        print("\n⏹️  Server stopped")
    finally:
        server.server_close()

if __name__ == "__main__":
    main()
