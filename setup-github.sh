#!/bin/bash
# ──────────────────────────────────────────────
# Saree Story — GitHub Setup Script
# Run this AFTER installing Git and creating your GitHub account.
# Usage: bash setup-github.sh
# ──────────────────────────────────────────────

set -e

echo ""
echo "🪡  Saree Story — GitHub Setup"
echo "────────────────────────────────────────"

# ── Step 1: Collect info ──────────────────────
echo ""
read -p "Enter your GitHub username: " GITHUB_USER
read -p "Enter your email (same as GitHub): " GITHUB_EMAIL
read -p "Enter a name for the GitHub repo (e.g. saree-story): " REPO_NAME

echo ""
echo "  GitHub user : $GITHUB_USER"
echo "  Email       : $GITHUB_EMAIL"
echo "  Repo name   : $REPO_NAME"
echo ""
read -p "Looks good? Press Enter to continue (Ctrl+C to cancel)..."

# ── Step 2: Configure Git ─────────────────────
echo ""
echo "▶ Configuring Git..."
git config --global user.name "$GITHUB_USER"
git config --global user.email "$GITHUB_EMAIL"
git config --global init.defaultBranch main
echo "  ✓ Git configured"

# ── Step 3: Init repo ─────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo ""
echo "▶ Initializing Git repository in:"
echo "  $SCRIPT_DIR"
git init
echo "  ✓ Git initialized"

# ── Step 4: Create .gitignore ─────────────────
cat > .gitignore << 'EOF'
.DS_Store
Thumbs.db
*.log
node_modules/
EOF
echo "  ✓ .gitignore created"

# ── Step 5: Stage and commit ──────────────────
echo ""
echo "▶ Staging all files..."
git add .
git commit -m "Initial commit: Saree Story website — homepage, collection, and detail pages"
echo "  ✓ Initial commit created"

# ── Step 6: Add remote ────────────────────────
echo ""
echo "▶ Connecting to GitHub..."
echo ""
echo "  ⚠  ACTION REQUIRED:"
echo "  Go to https://github.com/new and create a NEW repository named:"
echo "  → $REPO_NAME"
echo ""
echo "  Settings to use:"
echo "    • Repository name : $REPO_NAME"
echo "    • Visibility      : Public (so the site can be hosted free)"
echo "    • Do NOT tick     : Add README, .gitignore, or license"
echo "    (We already have these files — adding them will cause a conflict)"
echo ""
read -p "  Press Enter once you've created the empty repo on GitHub..."

git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
echo "  ✓ Remote added"

# ── Step 7: Push ──────────────────────────────
echo ""
echo "▶ Pushing code to GitHub..."
echo "  (Your browser or terminal may ask for GitHub password/token)"
git push -u origin main
echo ""
echo "  ✓ Code pushed!"
echo ""
echo "────────────────────────────────────────"
echo "✅  Done! Your code is now on GitHub at:"
echo "   https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""
echo "Next step — Enable GitHub Pages to get a live URL:"
echo "  1. Go to https://github.com/$GITHUB_USER/$REPO_NAME/settings/pages"
echo "  2. Under 'Source' → select 'Deploy from a branch'"
echo "  3. Branch: main  /  Folder: / (root)"
echo "  4. Click Save"
echo ""
echo "Your website will be live at:"
echo "  https://$GITHUB_USER.github.io/$REPO_NAME"
echo "────────────────────────────────────────"
