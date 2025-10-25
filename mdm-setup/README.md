# macOS MDM Bypass Guide

**⚠️ DISCLAIMER:**
This guide is for **PERSONAL DEVICES ONLY** (devices you own).
**DO NOT** use on company/school devices. Unauthorized bypass is illegal.

---

## 📋 Table of Contents

1. [What is MDM?](#what-is-mdm)
2. [When to Use This Guide](#when-to-use-this-guide)
3. [Prerequisites](#prerequisites)
4. [Method 1: Hosts File (Preventive)](#method-1-hosts-file-preventive)
5. [Method 2: Recovery Mode (Remove Existing)](#method-2-recovery-mode-remove-existing)
6. [Method 3: Fresh Install](#method-3-fresh-install)
7. [Troubleshooting](#troubleshooting)
8. [References](#references)

---

## What is MDM?

**MDM (Mobile Device Management)** là hệ thống quản lý thiết bị từ xa.

**Apple's DEP/ABM:**
- Device Enrollment Program (DEP)
- Apple Business Manager (ABM)
- Automatic MDM enrollment khi setup macOS

**What it does:**
- Tự động enroll device vào organization's MDM
- Cài policies, restrictions, apps
- Track device location, screen activity
- Remote lock/wipe

---

## When to Use This Guide

**✅ Legitimate use cases:**
- Máy Mac cá nhân bị orphaned MDM (công ty đã đóng cửa)
- Mua máy second-hand còn MDM profile
- Testing/educational purposes
- Máy của bạn nhưng bị add vào DEP nhầm

**❌ DO NOT use if:**
- Máy của công ty/trường học
- Máy bị stolen
- Bypass corporate security (illegal!)

---

## Prerequisites

- Mac cá nhân (you own it!)
- macOS Ventura/Sonoma/Sequoia
- Access to Recovery Mode
- USB drive (for backup)
- Internet connection
- **Legal right to modify the device**

---

## Method 1: Hosts File (Preventive)

**Mục đích:** Chặn MDM enrollment servers TRƯỚC KHI cài macOS.

### Step 1: Boot vào Recovery Mode

**Intel Mac:**
1. Restart Mac
2. Giữ **Cmd + R** ngay khi khởi động
3. Đợi Apple logo + progress bar
4. Vào Recovery Mode

**Apple Silicon (M1/M2/M3):**
1. Shutdown Mac
2. Giữ **Power button** ~10 giây
3. Thấy "Loading startup options"
4. Chọn **Options** → Continue
5. Vào Recovery Mode

### Step 2: Mở Terminal

```
Utilities (menu bar) → Terminal
```

### Step 3: Disable SIP (System Integrity Protection)

```bash
csrutil disable
```

Restart vào Recovery Mode lại.

### Step 4: Mount System Volume

```bash
# Check volumes
diskutil list

# Mount system (usually disk1s1 or disk3s1)
diskutil mount disk1s1

# Or auto-mount
mount -uw /
```

### Step 5: Edit Hosts File

```bash
# Backup original
cp /Volumes/Macintosh\ HD/etc/hosts /Volumes/Macintosh\ HD/etc/hosts.backup

# Edit hosts
nano /Volumes/Macintosh\ HD/etc/hosts
```

**Add these lines:**
```
# Block MDM Enrollment
0.0.0.0 deviceenrollment.apple.com
0.0.0.0 mdmenrollment.apple.com
0.0.0.0 iprofiles.apple.com
```

Save: **Ctrl + O**, **Enter**, **Ctrl + X**

### Step 6: Enable SIP (Optional, for security)

```bash
csrutil enable
```

### Step 7: Restart

```bash
reboot
```

**Kết quả:** Mac sẽ không thể connect tới MDM servers khi setup.

---

## Method 2: Recovery Mode (Remove Existing)

**Mục đích:** Xóa MDM profile đã tồn tại.

### Step 1: Boot Recovery Mode (như Method 1)

### Step 2: Open Terminal

### Step 3: Remove MDM Profiles

```bash
# Remove all configuration profiles
rm -rf /Volumes/Macintosh\ HD/private/var/db/ConfigurationProfiles

# Remove enrollment data
rm -rf /Volumes/Macintosh\ HD/Library/Application\ Support/Apple/RemoteManagement

# Remove setup assistant flag
rm -rf /Volumes/Macintosh\ HD/var/db/.AppleSetupDone
```

### Step 4: Restart

```bash
reboot
```

**Note:** Sau khi restart, Mac sẽ chạy lại Setup Assistant.

---

## Method 3: Fresh Install

**Mục đích:** Cài lại macOS hoàn toàn mới + bypass MDM.

### Step 1: Backup Data

- Time Machine
- Hoặc copy files quan trọng ra USB

### Step 2: Download macOS Installer

**Option A: Từ Recovery Mode**
```
macOS Utilities → Reinstall macOS
```

**Option B: Tạo USB installer** (khuyên dùng)
```bash
# Download macOS Sonoma
softwareupdate --fetch-full-installer --full-installer-version 14.0

# Tạo bootable USB (16GB+)
sudo /Applications/Install\ macOS\ Sonoma.app/Contents/Resources/createinstallmedia --volume /Volumes/USB --nointeraction
```

### Step 3: Erase Disk

**In Recovery Mode:**
```
Disk Utility → Select main disk → Erase
  - Name: Macintosh HD
  - Format: APFS
  - Scheme: GUID Partition Map
```

### Step 4: Block MDM BEFORE Installing

**Quan trọng:** Phải block MDM servers TRƯỚC khi cài macOS!

**Option A: Router level (khuyên dùng)**
- Login vào router
- Block domains:
  - deviceenrollment.apple.com
  - mdmenrollment.apple.com
  - iprofiles.apple.com

**Option B: Disconnect internet**
- Cài macOS offline
- Skip Apple ID setup
- Sau khi vào desktop, sửa hosts file
- Sau đó mới connect internet

### Step 5: Install macOS

```
macOS Utilities → Reinstall macOS → Continue
```

### Step 6: Setup Assistant

**QUAN TRỌNG:**
- **Skip Apple ID** nếu có thể
- **Skip iCloud**
- **Skip Location Services**
- Complete setup nhanh nhất có thể

### Step 7: After First Boot

Ngay sau khi vào desktop:

```bash
# 1. Edit hosts file
sudo nano /etc/hosts

# Add:
0.0.0.0 deviceenrollment.apple.com
0.0.0.0 mdmenrollment.apple.com
0.0.0.0 iprofiles.apple.com

# 2. Verify
ping deviceenrollment.apple.com
# Should show 0.0.0.0 (blocked)

# 3. Now safe to connect internet & sign in Apple ID
```

---

## Method 4: Automated Script (Advanced)

**Based on GitHub projects:**

### Create bypass script:

```bash
#!/bin/bash
# mdm-bypass.sh
# Run in Recovery Mode Terminal

echo "🚀 Starting MDM Bypass..."

# Mount system
mount -uw /

# Backup
cp /Volumes/Macintosh\ HD/etc/hosts /Volumes/Macintosh\ HD/etc/hosts.backup

# Block MDM servers
cat >> /Volumes/Macintosh\ HD/etc/hosts << 'EOF'

# Block Apple MDM Enrollment
0.0.0.0 deviceenrollment.apple.com
0.0.0.0 mdmenrollment.apple.com
0.0.0.0 iprofiles.apple.com
0.0.0.0 albert.apple.com
0.0.0.0 identity.apple.com
EOF

# Remove existing profiles
rm -rf /Volumes/Macintosh\ HD/private/var/db/ConfigurationProfiles
rm -rf /Volumes/Macintosh\ HD/Library/Application\ Support/Apple/RemoteManagement

echo "✅ MDM Bypass Complete!"
echo "⚠️  Reboot to apply changes"
```

**Usage:**
```bash
# In Recovery Mode Terminal:
curl -o /tmp/mdm-bypass.sh https://your-url/mdm-bypass.sh
bash /tmp/mdm-bypass.sh
reboot
```

---

## Troubleshooting

### ❌ "Remote Management" still appears

**Solution:**
```bash
# Remove setup done flag
sudo rm /var/db/.AppleSetupDone

# Restart - will run Setup Assistant again
sudo reboot
```

### ❌ Cannot edit /etc/hosts (Read-only)

**Solution:**
```bash
# Must disable SIP first in Recovery Mode
csrutil disable

# Then mount as read-write
mount -uw /
```

### ❌ MDM re-enrolls after connecting internet

**Solution:**
- Hosts file chưa đúng
- Check:
```bash
cat /etc/hosts | grep mdm
ping deviceenrollment.apple.com  # Should fail
```

### ❌ "This Mac is managed by..."

**Solution:**
```bash
# Remove all MDM profiles
sudo rm -rf /Library/Application\ Support/Apple/RemoteManagement
sudo rm -rf /private/var/db/ConfigurationProfiles

# Restart
sudo reboot
```

### ❌ SIP re-enables after update

**Solution:**
- macOS updates có thể re-enable SIP
- After update, check:
```bash
csrutil status
```
- Nếu enabled, repeat Recovery Mode steps

---

## macOS Version Compatibility

| macOS Version | Method 1 (Hosts) | Method 2 (Remove) | Method 3 (Fresh) |
|---------------|------------------|-------------------|------------------|
| **Monterey 12.x** | ✅ Works | ✅ Works | ✅ Works |
| **Ventura 13.x** | ✅ Works | ⚠️ Harder | ✅ Works |
| **Sonoma 14.x** | ✅ Works | ⚠️ Harder | ✅ Works |
| **Sequoia 15.x** | ⚠️ Partial | ❌ Very Hard | ⚠️ Partial |

**Note:** Apple ngày càng khó bypass hơn với mỗi version.

---

## ⚠️ macOS Sequoia (15.x) - IMPORTANT!

**Sequoia đã tăng cường security đáng kể. Một số methods không work.**

### What Works on Sequoia:

✅ **Method 1: Hosts File (Preventive)**
- **Status:** Still works (mostly)
- **Limitation:** Apple có thể dùng IP trực tiếp thay vì domain
- **Best practice:** Kết hợp với router blocking

✅ **Method 3: Fresh Install + Hosts**
- **Status:** Works nếu block TRƯỚC khi cài
- **Requirement:** PHẢI disconnect internet hoặc router blocking
- **Important:** Không connect internet cho đến khi đã block hosts

⚠️ **Router Blocking**
- **Status:** Still effective
- **Recommended:** Use as primary method cho Sequoia

### What Doesn't Work on Sequoia:

❌ **Method 2: Remove Existing MDM**
- **Status:** Very difficult/impossible
- **Reason:** Sequoia enforces strict ABM/ASM check-ins
- **Alternative:** Fresh install only option

❌ **Simple Profile Removal**
- Removing `/var/db/ConfigurationProfiles` không đủ
- MDM re-enrolls ngay khi connect internet

### Sequoia-Specific Challenges:

**1. ABM/ASM Enforcement:**
```
Apple forces Sequoia devices to check with:
- Apple Business Manager (ABM)
- Apple School Manager (ASM)
```
→ Nếu device trong ABM/ASM, rất khó bypass

**2. Firmware-Level Checking:**
```
T2/Apple Silicon chips check MDM status at firmware level
```
→ Không thể bypass bằng software

**3. Internet-Required Activation:**
```
Sequoia requires internet for activation
```
→ Khó skip MDM enrollment

### Best Practice for Sequoia:

**Recommended Approach:**

1. **Router-Level Blocking FIRST**
   ```
   Block trên router TRƯỚC khi boot Mac:
   - deviceenrollment.apple.com
   - mdmenrollment.apple.com
   - iprofiles.apple.com
   - albert.apple.com
   - identity.apple.com
   ```

2. **Fresh Install Offline**
   ```
   - Erase disk completely
   - Install macOS WITHOUT internet
   - Or with router blocking active
   ```

3. **Hosts File After Install**
   ```
   - Immediately add blocks to /etc/hosts
   - Before connecting internet
   - Before signing into Apple ID
   ```

4. **Never Factory Reset**
   ```
   ⚠️ Factory reset on Sequoia will re-trigger MDM!
   - Do NOT erase disk after bypass
   - Updates OK (usually)
   - Avoid "Erase All Content and Settings"
   ```

### Sequoia 15.5+ Updates:

**Latest reports (2025):**
- Some users success with hosts + router blocking
- Fresh install (offline) + hosts = Best success rate
- Existing MDM almost impossible to remove
- Need to maintain blocks permanently

### If You're on Sequoia and Stuck:

**Option 1: Downgrade** (if possible)
```bash
# Boot Recovery → Reinstall older macOS
# Sonoma 14.x easier to bypass than Sequoia
```

**Option 2: Contact Original Owner**
```
If second-hand Mac:
- Contact previous owner
- Request MDM removal
- Get proof of purchase
```

**Option 3: Apple Support**
```
With proof of ownership:
- Apple Store Genius Bar
- Request DEP/ABM removal
- Bring purchase receipt
```

### Testing on Sequoia:

**After bypass, verify:**
```bash
# 1. Check hosts
cat /etc/hosts | grep mdm

# 2. Test blocking
ping deviceenrollment.apple.com
# Should fail or 0.0.0.0

# 3. Check profiles
sudo profiles list
# Should be empty or no MDM

# 4. Check DEP status
sudo profiles status -type enrollment
# Should say "Not enrolled"
```

### Sequoia Success Rate:

Based on community reports (2024-2025):

| Scenario | Success Rate | Method |
|----------|--------------|--------|
| **Fresh install + router block** | ~70% | Router + Hosts |
| **Fresh install + hosts only** | ~40% | Hosts file |
| **Remove existing MDM** | ~5% | Almost impossible |
| **Second-hand with DEP** | ~20% | Very difficult |
| **Personal Mac (no DEP)** | ~90% | Usually works |

**Bottom line:** Sequoia is MUCH harder. Router blocking + fresh install = best chance.

---

## Legal Notice

**⚠️ IMPORTANT:**

**Legal use:**
- Máy Mac CÁ NHÂN của bạn
- Bought second-hand với orphaned MDM
- Testing/education với máy của bạn

**Illegal use:**
- Máy công ty/trường học
- Stolen devices
- Circumvent corporate security
- Violate user agreements

**Consequences of illegal bypass:**
- Violation of Computer Fraud and Abuse Act (US)
- Breach of contract (employee agreement)
- Termination from employment
- Legal action from organization

**Use at your own risk. You are responsible for compliance with local laws.**

---

## Prevention (For Organizations)

Nếu bạn là IT admin, protect against bypass:

1. **Firmware Password**
   - Prevents booting to Recovery Mode

2. **T2/Apple Silicon Security**
   - Enable all security features

3. **FileVault**
   - Disk encryption

4. **DEP Enforcement**
   - Require authentication before MDM removal

5. **Network Level Blocking**
   - Monitor for hosts file modifications
   - Alert on MDM server blocking attempts

---

## Alternative: Contact Organization

**Before bypassing, try:**

1. **Contact IT Department**
   - Explain situation (bought second-hand, company closed, etc.)
   - Request MDM removal

2. **Apple Support**
   - Bring proof of ownership
   - Request DEP removal

3. **Legal Channels**
   - If legitimate owner, pursue legal route

---

## References

### GitHub Projects
- https://github.com/assafdori/bypass-mdm
- https://github.com/alsyundawy/skipmdm-bypass
- https://gist.github.com/tatdatpham/f25b95b55232d27fff2b6f1c33c9b6aa

### Apple Documentation
- https://support.apple.com/guide/deployment/intro-to-mdm-depc0aadd3fe/web
- https://support.apple.com/guide/deployment/dep-overview-depbb90e0a5/web

### Community
- https://www.reddit.com/r/MacOS/
- https://discussions.apple.com/

---

## Updates

**Last updated:** 2025-10-26

**Change log:**
- 2025-10-26: Initial guide for Ventura/Sonoma/Sequoia
- Based on community research and GitHub projects

---

**⚠️ Remember: Only use on devices you legally own!**

**Questions?** Check [Troubleshooting](#troubleshooting) section first.
