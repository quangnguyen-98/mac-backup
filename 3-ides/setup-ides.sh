#!/bin/bash

# =============================================================================
#  IDEs Setup Script - Step 3 of 3
# =============================================================================
#  Run this AFTER 2-fish-shell/setup-fish.sh
#  This script will:
#    1. Check Fish is set as default shell
#    2. Install JetBrains IDEs (PyCharm, WebStorm, GoLand, DataGrip)
#    3. Install Android Studio
#
#  WHY RUN THIS LAST?
#  IDEs detect system default shell on first launch.
#  By installing IDEs AFTER Fish is set as default,
#  all IDEs will automatically use Fish shell - no manual configuration needed!
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
echo "  💻 IDEs Setup - Step 3: Install IDEs"
echo "  Auto-configure Fish shell in all IDEs"
echo "==============================================${NC}"
echo ""
sleep 1

# =============================================================================
# Step 1: Check Fish is default shell
# =============================================================================
echo -e "${BLUE}${BOLD}[1/3] Checking Fish is set as default shell...${NC}"
echo ""

if [ "$SHELL" != "$(which fish)" ]; then
    echo -e "${RED}❌ ERROR: Fish is not set as default shell!${NC}"
    echo ""
    echo "Current shell: $SHELL"
    echo "Expected: $(which fish)"
    echo ""
    echo -e "${YELLOW}Please run 2-fish-shell/setup-fish.sh first!${NC}"
    echo ""
    echo "Steps:"
    echo "  1. cd ../2-fish-shell"
    echo "  2. ./setup-fish.sh"
    echo "  3. Restart Terminal"
    echo "  4. Come back and run this script again"
    echo ""
    exit 1
fi

echo -e "${GREEN}✅ Fish is set as default shell: $SHELL${NC}"
echo ""
sleep 1

# =============================================================================
# Step 2: Install Homebrew packages
# =============================================================================
echo -e "${BLUE}${BOLD}[2/3] Installing IDEs from Brewfile-IDEs...${NC}"
echo -e "${YELLOW}⏳ This may take 10-20 minutes depending on your network${NC}"
echo ""

if [ -f "$SCRIPT_DIR/Brewfile-IDEs" ]; then
    cd "$SCRIPT_DIR"
    brew bundle install --file="$SCRIPT_DIR/Brewfile-IDEs" --verbose
    echo ""
    echo -e "${GREEN}✅ All IDEs installed${NC}"
else
    echo -e "${RED}❌ Brewfile-IDEs not found in $SCRIPT_DIR${NC}"
    exit 1
fi

echo ""
sleep 1

# =============================================================================
# Step 3: Verify & Next steps
# =============================================================================
echo -e "${BLUE}${BOLD}[3/3] Verification${NC}"
echo ""

echo "Checking installed IDEs..."
echo ""

# Check each IDE
IDES=(
    "PyCharm:PyCharm"
    "WebStorm:WebStorm"
    "GoLand:GoLand"
    "DataGrip:DataGrip"
    "Android Studio:Android Studio"
)

for ide in "${IDES[@]}"; do
    IFS=: read -r name app <<< "$ide"
    if [ -d "/Applications/$app.app" ]; then
        echo -e "  ✅ $name"
    else
        echo -e "  ⚠️  $name (not found, may need manual installation)"
    fi
done

echo ""
sleep 1

# =============================================================================
# Done!
# =============================================================================
echo -e "${GREEN}${BOLD}=============================================="
echo "  ✅ IDEs Setup Complete!"
echo "==============================================${NC}"
echo ""
echo "What was installed:"
echo "  ✅ PyCharm - Python IDE"
echo "  ✅ WebStorm - JavaScript/TypeScript IDE"
echo "  ✅ GoLand - Go IDE"
echo "  ✅ DataGrip - Database IDE"
echo "  ✅ Android Studio - Android IDE"
echo ""
echo -e "${GREEN}${BOLD}🎉 All IDEs should automatically use Fish shell!${NC}"
echo ""
echo "Why it works:"
echo "  • IDEs were installed AFTER Fish was set as default shell"
echo "  • On first launch, IDEs detect system default shell (\$SHELL)"
echo "  • Fish is default → IDEs use Fish automatically"
echo ""
echo "Next steps:"
echo "  1. ${BOLD}Launch any IDE${NC} (PyCharm, WebStorm, etc.)"
echo "  2. Open Terminal panel in IDE"
echo "  3. ${BOLD}You should see Tide prompt!${NC} 🌈"
echo ""
echo "  Verify with:"
echo "    echo \$SHELL       # Should show: $(which fish)"
echo "    tide configure    # Customize Tide if needed"
echo ""
echo "  ${BOLD}Set Terminal font in IDE:${NC}"
echo "    Settings → Editor → Color Scheme → Console Font"
echo "    ✅ Use console font instead of default"
echo "    Font: MesloLGS Nerd Font Mono, Size: 13"
echo "    (To see Tide icons properly)"
echo ""
echo -e "${YELLOW}NOTE:${NC} VSCode was already configured in step 1 (auto-configured via settings.json)"
echo ""
echo -e "${GREEN}🚀 Happy coding!${NC}"
echo ""
