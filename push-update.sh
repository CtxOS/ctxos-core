#!/bin/bash
# CTX OS Build & Deploy Automation

# --- Configuration ---
REPO_SERVER="user@repo.ctxos.local"
REPO_PATH="/var/www/repos/debian"
CODENAME="bookworm"

set -e

echo "📦 Step 1: Cleaning up old builds..."
rm -f ../ctxos-core*.deb ../ctxos-core*.changes ../ctxos-core*.buildinfo ../ctxos-core*.dsc 2>/dev/null || true

echo "🛠️ Step 2: Building the Debian package..."
debuild -us -uc

DEB_FILE=$(ls -t ../ctxos-core*_all.deb | head -n 1)
FILENAME=$(basename "$DEB_FILE")

echo "📤 Step 3: Uploading $FILENAME to Repository Server..."
scp "$DEB_FILE" "$REPO_SERVER:/tmp/"

echo "✍️ Step 4: Including package in Reprepro and signing..."
ssh -t "$REPO_SERVER" "reprepro -b $REPO_PATH includedeb $CODENAME /tmp/$FILENAME && rm /tmp/$FILENAME"

echo "✅ Success! Version $(dpkg-parsechangelog -S Version) is now live."
echo "Run 'sudo apt update && sudo apt upgrade' on client machines."
