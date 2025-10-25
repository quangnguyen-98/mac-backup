#!/bin/bash

# ============================================================================
#  macOS MDM Bypass Script
# ============================================================================
#  Run in Recovery Mode Terminal
#  ⚠️  WARNING: Only use on personally-owned devices!
# ============================================================================

set -e  # Exit on error

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo -e "${BLUE}=============================================="
echo "  🔓 macOS MDM Bypass Script"
echo "  ⚠️  Personal devices only!"
echo "==============================================${NC}"
echo ""

# Confirm
echo -e "${YELLOW}⚠️  WARNING:${NC}"
echo "This script will:"
echo "  1. Block MDM enrollment servers in /etc/hosts"
echo "  2. Remove existing MDM profiles"
echo "  3. Remove Setup Assistant flag"
echo ""
read -p "Continue? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "Aborted."
    exit 1
fi

echo ""
echo -e "${BLUE}[1/5] Mounting system volume...${NC}"

# Detect macOS volume (usually Macintosh HD)
VOLUME=$(diskutil list | grep "Macintosh HD" | head -1 | awk '{print $NF}')
if [ -z "$VOLUME" ]; then
    VOLUME=$(diskutil list | grep "APFS" | grep "Container" | head -1 | awk '{print $NF}')
fi

# Mount as read-write
mount -uw / 2>/dev/null || true
diskutil mount "$VOLUME" 2>/dev/null || true

# Find mounted path
MOUNT_PATH="/Volumes/Macintosh HD"
if [ ! -d "$MOUNT_PATH" ]; then
    MOUNT_PATH="/Volumes/Data"
fi
if [ ! -d "$MOUNT_PATH" ]; then
    echo -e "${RED}❌ Cannot find system volume!${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Mounted: $MOUNT_PATH${NC}"

echo ""
echo -e "${BLUE}[2/5] Backing up hosts file...${NC}"

# Backup original hosts
if [ -f "$MOUNT_PATH/etc/hosts" ]; then
    cp "$MOUNT_PATH/etc/hosts" "$MOUNT_PATH/etc/hosts.backup.$(date +%Y%m%d)"
    echo -e "${GREEN}✅ Backup created${NC}"
else
    echo -e "${YELLOW}⚠️  No existing hosts file${NC}"
fi

echo ""
echo -e "${BLUE}[3/5] Blocking MDM servers...${NC}"

# Add MDM blocks to hosts file
cat >> "$MOUNT_PATH/etc/hosts" << 'EOF'

# ============================================
# Block Apple MDM Enrollment (added by mdm-bypass.sh)
# ============================================
0.0.0.0 deviceenrollment.apple.com
0.0.0.0 mdmenrollment.apple.com
0.0.0.0 iprofiles.apple.com
0.0.0.0 albert.apple.com
0.0.0.0 identity.apple.com
EOF

echo -e "${GREEN}✅ MDM servers blocked in /etc/hosts${NC}"

echo ""
echo -e "${BLUE}[4/5] Removing MDM profiles...${NC}"

# Remove configuration profiles
if [ -d "$MOUNT_PATH/private/var/db/ConfigurationProfiles" ]; then
    rm -rf "$MOUNT_PATH/private/var/db/ConfigurationProfiles"
    echo -e "${GREEN}✅ Removed ConfigurationProfiles${NC}"
fi

# Remove Remote Management
if [ -d "$MOUNT_PATH/Library/Application Support/Apple/RemoteManagement" ]; then
    rm -rf "$MOUNT_PATH/Library/Application Support/Apple/RemoteManagement"
    echo -e "${GREEN}✅ Removed RemoteManagement${NC}"
fi

echo ""
echo -e "${BLUE}[5/5] Removing Setup Assistant flag...${NC}"

# Remove setup done flag (forces Setup Assistant to run again)
if [ -f "$MOUNT_PATH/var/db/.AppleSetupDone" ]; then
    rm -f "$MOUNT_PATH/var/db/.AppleSetupDone"
    echo -e "${GREEN}✅ Removed .AppleSetupDone${NC}"
fi

echo ""
echo -e "${GREEN}=============================================="
echo "  ✅ MDM Bypass Complete!"
echo "==============================================${NC}"
echo ""
echo "What was done:"
echo "  ✅ Blocked MDM enrollment servers"
echo "  ✅ Removed existing MDM profiles"
echo "  ✅ Reset Setup Assistant"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Reboot: type 'reboot' and press Enter"
echo "  2. Complete Setup Assistant (skip Apple ID if possible)"
echo "  3. After first boot, verify:"
echo "     ping deviceenrollment.apple.com (should fail)"
echo ""
echo -e "${YELLOW}⚠️  Remember:${NC}"
echo "  • Only use on personally-owned devices"
echo "  • Do not use on company/school devices"
echo "  • You are responsible for legal compliance"
echo ""
