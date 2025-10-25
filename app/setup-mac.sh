#!/bin/bash

# =============================================================================
#  Mac Setup Script - One Command to Rule Them All
# =============================================================================
#  After factory reset, just run: ./setup-mac.sh
#  This script will:
#    1. Install Homebrew
#    2. Install all packages/apps from Brewfile
#    3. Set Fish as default shell
#    4. Configure Fish with auto-PATH setup
#    5. Install Fisher & Tide
#    6. Show manual apps list
# =============================================================================

set -e  # Exit on error

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo -e "${BOLD}=============================================="
echo "  🚀 Mac Setup Script"
echo "  One-command installation for fresh Mac"
echo "==============================================${NC}"
echo ""
sleep 1

# =============================================================================
# Step 1: Install Homebrew
# =============================================================================
echo -e "${BLUE}${BOLD}[1/6] Checking Homebrew...${NC}"
echo ""

if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}⚠️  Homebrew not found. Installing...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi

    echo -e "${GREEN}✅ Homebrew installed${NC}"
else
    echo -e "${GREEN}✅ Homebrew already installed${NC}"
fi

echo ""
sleep 1

# =============================================================================
# Step 2: Install packages from Brewfile
# =============================================================================
echo -e "${BLUE}${BOLD}[2/6] Installing packages from Brewfile...${NC}"
echo -e "${YELLOW}⏳ This may take 10-30 minutes depending on your network${NC}"
echo ""

if [ -f "$SCRIPT_DIR/Brewfile" ]; then
    cd "$SCRIPT_DIR"
    brew bundle install --file="$SCRIPT_DIR/Brewfile" --verbose
    echo ""
    echo -e "${GREEN}✅ All Homebrew packages installed${NC}"
else
    echo -e "${RED}❌ Brewfile not found in $SCRIPT_DIR${NC}"
    exit 1
fi

echo ""
sleep 1

# =============================================================================
# Step 3: Set Fish as default shell
# =============================================================================
echo -e "${BLUE}${BOLD}[3/6] Setting up Fish shell...${NC}"
echo ""

FISH_PATH=$(which fish)

# Add Fish to allowed shells if not already there
if ! grep -q "$FISH_PATH" /etc/shells; then
    echo "Adding Fish to /etc/shells (requires sudo)..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells > /dev/null
    echo -e "${GREEN}✅ Fish added to /etc/shells${NC}"
fi

# Set Fish as default shell
if [ "$SHELL" != "$FISH_PATH" ]; then
    echo "Setting Fish as default shell..."
    chsh -s "$FISH_PATH"
    echo -e "${GREEN}✅ Fish set as default shell${NC}"
else
    echo -e "${GREEN}✅ Fish already default shell${NC}"
fi

echo ""
sleep 1

# =============================================================================
# Step 4: Configure Fish
# =============================================================================
echo -e "${BLUE}${BOLD}[4/6] Configuring Fish shell...${NC}"
echo ""

if [ -f "$SCRIPT_DIR/fish-config.fish" ]; then
    # Run Fish config script
    fish "$SCRIPT_DIR/fish-config.fish"
    echo -e "${GREEN}✅ Fish configured${NC}"
else
    echo -e "${YELLOW}⚠️  fish-config.fish not found, skipping Fish setup${NC}"
fi

echo ""
sleep 1

# =============================================================================
# Step 5: Install Python & Node.js versions
# =============================================================================
echo -e "${BLUE}${BOLD}[5/6] Setting up development environments...${NC}"
echo ""

# Set up pyenv
if command -v pyenv &> /dev/null; then
    echo "🐍 Setting up Python via pyenv..."
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # Install latest Python 3.12 if no versions installed
    if [ -z "$(pyenv versions --bare)" ]; then
        echo "Installing Python 3.12..."
        pyenv install 3.12
        pyenv global 3.12
        echo -e "${GREEN}✅ Python 3.12 installed${NC}"
    else
        echo -e "${GREEN}✅ Python already configured${NC}"
    fi
fi

# Set up fnm (Node.js)
if command -v fnm &> /dev/null; then
    echo ""
    echo "📦 Setting up Node.js via fnm..."
    eval "$(fnm env --shell bash)"

    # Install latest LTS Node if no versions installed
    if [ -z "$(fnm list)" ]; then
        echo "Installing Node.js LTS..."
        fnm install --lts
        fnm default lts-latest
        echo -e "${GREEN}✅ Node.js LTS installed${NC}"
    else
        echo -e "${GREEN}✅ Node.js already configured${NC}"
    fi
fi

echo ""
sleep 1

# =============================================================================
# Step 6: Manual apps reminder
# =============================================================================
echo -e "${BLUE}${BOLD}[6/6] Manual installation required${NC}"
echo ""

if [ -f "$SCRIPT_DIR/manual-apps.txt" ]; then
    echo -e "${YELLOW}⚠️  The following apps need manual installation:${NC}"
    echo ""
    head -20 "$SCRIPT_DIR/manual-apps.txt"
    echo ""
    echo -e "${YELLOW}📝 Full list: $SCRIPT_DIR/manual-apps.txt${NC}"
else
    echo "No manual apps list found"
fi

echo ""

# =============================================================================
# Done!
# =============================================================================
echo -e "${GREEN}${BOLD}=============================================="
echo "  ✅ Setup Complete!"
echo "==============================================${NC}"
echo ""
echo "What was installed:"
echo "  ✅ Homebrew + all CLI tools & apps"
echo "  ✅ Fish shell (configured with PATH)"
echo "  ✅ Fisher plugin manager + Tide prompt"
echo "  ✅ Python (via pyenv)"
echo "  ✅ Node.js (via fnm)"
echo ""
echo "Next steps:"
echo "  1. ${BOLD}Restart your terminal${NC} or run: exec fish"
echo "  2. Configure Tide prompt: ${BOLD}tide configure${NC}"
echo "  3. Install manual apps from: ${YELLOW}manual-apps.txt${NC}"
echo "  4. Additional setup:"
echo "     • Git: git config --global user.name 'Your Name'"
echo "     • Git: git config --global user.email 'your@email.com'"
echo "     • SSH: ssh-keygen -t ed25519 -C 'your@email.com'"
echo "     • Sign in to IDEs and apps"
echo ""
echo -e "${GREEN}🎉 Enjoy your fresh Mac!${NC}"
echo ""
