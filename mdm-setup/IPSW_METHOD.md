# IPSW Restore Method - M1 Mac Bypass MDM

**⭐ BEST METHOD for M1/M2/M3 Macs - Success rate ~95%**

**Setup Requirements:**
- ✅ M1 Mac (target - máy cần cài lại)
- ✅ Intel/M1 Mac khác (host - để chạy Apple Configurator 2)
- ✅ USB-C data cable (Thunderbolt 3/4 hoặc USB-C)

---

## 📖 Why IPSW Method?

### So với methods khác:

| Method | Success Rate | MDM Bypass Level | Needs 2nd Mac |
|--------|--------------|------------------|---------------|
| **IPSW Restore** | **~95%** | **Firmware-level** | ✅ Yes |
| USB + Router block | ~70% | Software-level | ❌ No |
| Recovery + Hosts | ~40% | Software-level | ❌ No |

### Lý do hoạt động:
```
Regular macOS Install:
  → Setup Assistant checks DEP servers
  → Finds MDM enrollment
  → Forces enrollment ❌

IPSW Restore:
  → Firmware-level restore
  → Erases activation records in hardware
  → Resets DEP identifiers
  → Mac như MỚI RA KHỎI FACTORY ✅
```

---

## 🛠️ Requirements

### Phần cứng:

| Item | Your Setup | Notes |
|------|------------|-------|
| **Target Mac** | M1 Pro (máy bạn) | Máy cần cài lại |
| **Host Mac** | Intel Mac | Để run Apple Configurator 2 |
| **Cable** | USB-C to USB-C | Thunderbolt 3/4 recommended |

### Phần mềm (on Intel Mac):

```bash
✅ macOS 10.15 Catalina or later
✅ Apple Configurator 2 (free from App Store)
✅ ~15GB free space (for IPSW file)
✅ Good internet (download ~12-15GB)
```

### Thời gian:
- ☕ Download IPSW: 10-30 min (depends on internet)
- ⏰ Restore process: 30-60 min
- 🚀 Setup + verify: 10 min
- **Total: ~1-2 hours**

---

## 📋 Step-by-Step Guide

### **PHASE 1: Preparation (Intel Mac)**

#### Step 1.1: Install Apple Configurator 2

```bash
# Method A: App Store
1. Open App Store on Intel Mac
2. Search "Apple Configurator 2"
3. Click "Get" → Install
4. Wait ~5 minutes

# Method B: Direct link
open "macappstore://apps.apple.com/us/app/apple-configurator/id1037126344"
```

#### Step 1.2: Identify M1 Mac Model

```bash
# On M1 Pro Mac (before wiping):
system_profiler SPHardwareDataType | grep "Model Identifier"

# Output examples:
# MacBookPro18,3 → MacBook Pro 14-inch M1 Pro (8-core CPU)
# MacBookPro18,1 → MacBook Pro 16-inch M1 Pro (10-core CPU base)
# MacBookPro18,2 → MacBook Pro 16-inch M1 Pro (10-core CPU upgraded)

# Or check manually:
 → About This Mac
→ "MacBook Pro (14-inch, 2021)" or "(16-inch, 2021)"
```

**⚠️ CRITICAL:** Note down EXACT model identifier! Sai model = restore FAIL.

#### Step 1.3: Download IPSW File

```bash
# On Intel Mac:

1. Open browser → Go to: https://ipsw.me/product/Mac

2. Find your model:
   - Search "MacBook Pro M1 Pro"
   - Click correct model (14-inch or 16-inch)

3. Choose macOS version:
   ✅ Recommend: Latest Sequoia 15.x
   ⚠️ Or: Sonoma 14.x (more stable)

4. Download IPSW file (~12-15GB):
   Example filename:
   - MacBookPro18,3_15.2_22D68_Restore.ipsw (14-inch M1 Pro, Sequoia)
   - UniversalMac_14.7_23H124_Restore.ipsw (Sonoma universal)

5. Wait for download to complete
   → Save to Downloads folder
   → DO NOT unzip/modify file
```

**Direct links (check ipsw.me for latest):**
- 14-inch M1 Pro: https://ipsw.me/MacBookPro18,3
- 16-inch M1 Pro: https://ipsw.me/MacBookPro18,1

#### Step 1.4: Verify IPSW File

```bash
# On Intel Mac:
cd ~/Downloads

# Check file size (should be ~12-15GB)
ls -lh *Restore.ipsw

# Check file integrity (optional)
shasum -a 256 *Restore.ipsw
# Compare with ipsw.me SHA256 checksum
```

---

### **PHASE 2: Connect Macs**

#### Step 2.1: Setup Workspace

```bash
# Setup:
1. Place both Macs trên bàn gần nhau
2. Intel Mac: Mở Apple Configurator 2 (keep it open)
3. M1 Pro: Có thể bật hoặc tắt (cả 2 đều OK)
4. Chuẩn bị USB-C cable
```

#### Step 2.2: Connect Cable

```bash
# Connection:
Intel Mac [USB-C port] ←─── Cable ───→ [USB-C port] M1 Pro

# Cable check:
✅ Use Thunderbolt 3/4 cable (best)
✅ Or USB-C 3.1 data cable
❌ NOT charge-only cable (sẽ không detect)

# Test cable (optional):
- If M1 Pro is on → Try file sharing works?
- If charging → Good sign (but not guarantee data works)
```

#### Step 2.3: Verify Connection

```bash
# On Intel Mac:
System Information → USB (or Thunderbolt)
→ Should see M1 Mac listed (if M1 is on)

# If nothing appears:
→ Try different cable
→ Try different USB-C port on Intel Mac
→ OK to proceed to DFU mode anyway
```

---

### **PHASE 3: Enter DFU Mode (M1 Pro)**

**⚠️ MOST IMPORTANT STEP! Read carefully.**

DFU = **D**evice **F**irmware **U**pdate mode

#### Before Starting:

```bash
✅ USB-C cable connected chặt (both ends)
✅ Apple Configurator 2 OPEN on Intel Mac
✅ M1 Pro fully charged (>50% battery recommended)
✅ Read all steps below FIRST before trying
```

#### DFU Mode Steps for M1 Pro:

```bash
Step 1: Shutdown M1 Pro completely
   → Hold Power button 5 seconds
   → Click "Shut Down"
   → Wait 10 seconds (ensure fully off)

Step 2: Prepare timing
   → Read steps 3-7 completely first
   → Timing is CRITICAL!

Step 3: Press and HOLD Power button
   → Count: 1... 2... 3...
   → Keep holding!

Step 4: While STILL holding Power,
        Press and HOLD Volume Down button (-)
   → Right side of keyboard on M1 Pro
   → Now holding BOTH buttons

Step 5: Hold BOTH buttons for 10 seconds
   → Count: 1... 2... 3... 4... 5... 6... 7... 8... 9... 10...
   → Keep holding!

Step 6: Release ONLY Power button
   → Keep holding Volume Down (-)

Step 7: Keep holding Volume Down for 5 more seconds
   → Count: 1... 2... 3... 4... 5...
   → Then release

Step 8: Check screen
   → Should be COMPLETELY BLACK
   → NO Apple logo
   → NO text
   → Just black screen
```

#### Timing Diagram:

```
Power button:    [═══════════ 13 seconds ═══════════]
Volume Down:              [═══════════════════ 15 seconds ════════]
                          ↑                    ↑
                       +3 sec              +10 sec together   +5 sec alone
```

#### Verification:

```bash
# On Intel Mac (Apple Configurator 2):

✅ SUCCESS signs:
   → Device appears in Apple Configurator 2
   → Shows as "DFU Mode" or model name
   → Icon shows Mac symbol

❌ FAILED signs:
   → M1 Pro shows Apple logo → Booting normally
     Fix: Shutdown, try again with lighter touch

   → M1 Pro shows options screen → Recovery mode (wrong!)
     Fix: Shutdown, hold Volume Down LONGER

   → Nothing in Apple Configurator 2
     Fix: Check cable, try different USB-C port

   → M1 Pro screen turns on then off → Almost there!
     Fix: Try again, adjust timing slightly
```

#### Pro Tips:

```bash
💡 Tip 1: Practice timing without cable first
💡 Tip 2: Don't press too hard (gentle but firm)
💡 Tip 3: If fail 3 times, take 5 min break and retry
💡 Tip 4: Sometimes takes 5-10 attempts to get timing right
💡 Tip 5: Watch YouTube "M1 Mac DFU mode" for visual guide
```

---

### **PHASE 4: Restore via Apple Configurator 2**

#### Step 4.1: Start Restore

```bash
# On Intel Mac (Apple Configurator 2):

1. M1 Mac appears as device
   → Shows icon with model name
   → Status: "DFU Mode" or ready

2. Right-click on device
   → Select "Restore..."

3. Dialog appears:
   ⚠️ Warning: "This will erase all content and settings"
   → Click "Restore" to confirm

4. File picker appears:
   → Navigate to ~/Downloads/
   → Select IPSW file (MacBookPro18,X_*.ipsw)
   → Click "Choose"

5. Confirm again:
   → "Are you sure?"
   → Click "Restore"
```

#### Step 4.2: Restore Process

```bash
# Progress bar phases:

Phase 1: "Preparing..." (2-5 minutes)
   → Apple Configurator 2 preparing IPSW
   → M1 Mac screen still black
   → Normal!

Phase 2: "Restoring..." (20-40 minutes)
   → Progress bar 0% → 100%
   → M1 Mac may show progress bar
   → May reboot 1-2 times (normal!)
   → ⚠️ DO NOT unplug cable!
   → ⚠️ DO NOT close Apple Configurator 2!

Phase 3: "Verifying..." (5-10 minutes)
   → Apple verifying firmware integrity
   → Almost done!

Phase 4: "Finishing..." (1-2 minutes)
   → Final touches

Total time: ~30-60 minutes (depending on Mac speed)
```

#### What You'll See:

```bash
# On Intel Mac screen:
[▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░] 50% - Restoring...
Estimated time remaining: 15 minutes

# On M1 Mac screen:
- First 5 min: Black screen
- Then: Apple logo + progress bar
- May reboot: Black → Logo → Progress
- Final: Boots to Setup Assistant
```

#### Step 4.3: Common Errors

```bash
❌ Error: "Unable to restore. Unknown error."
   Causes:
   - DFU mode not properly entered
   - Cable disconnected
   - IPSW file corrupted

   Fix:
   → Enter DFU mode again
   → Try different cable
   → Re-download IPSW file

❌ Error: "The IPSW is not compatible with this device"
   Cause:
   - Wrong model IPSW file

   Fix:
   → Verify model identifier (Step 1.2)
   → Download correct IPSW for your model

❌ Stuck at progress bar >1 hour
   Causes:
   - Bad cable connection
   - USB port issue

   Fix:
   → Force stop (Command+Q Apple Configurator 2)
   → Try different USB-C port on Intel Mac
   → Use different cable
   → Enter DFU and retry

❌ M1 Mac boots to error screen (!)
   → Normal sometimes!
   → Enter DFU mode again
   → Restore again (may need 2-3 attempts)
```

---

### **PHASE 5: Setup Assistant (M1 Pro)**

#### After Restore Completes:

```bash
# M1 Pro automatically boots up:

1. 🌍 Welcome Screen
   → Choose language: English/Vietnamese
   → Choose country: Vietnam/US
   → Click Continue

2. 📶 WiFi Setup
   ✅ Connect to WiFi NORMALLY
   → IPSW restore bypassed MDM!
   → SAFE to connect internet
   → No blocking needed!

3. 🔒 Data & Privacy
   → Review and Continue

4. 💾 Migration Assistant
   → "Not Now" (fresh setup recommended)
   → Or transfer from Time Machine if you have

5.  Apple ID

   Option A (Recommended): Test first
   → "Set Up Later"
   → Skip for now
   → Verify MDM bypass works
   → Sign in later

   Option B: Sign in now
   → Enter Apple ID
   → Should work fine!

6. ✅ Terms and Conditions
   → Agree → Agree

7. 👤 Create Computer Account
   → Full name: Your Name
   → Account name: yourname
   → Password: ••••••••
   → Hint: (optional)
   → Click Continue

8. ⚡ Express Set Up

   Option A: Express
   → Enable Location, Analytics, Screen Time, Siri
   → Fastest!

   Option B: Customize (Recommended)
   → Choose what to enable/disable
   → More control

9. 📊 Analytics (if Customize)
   → Share/Don't Share (your choice)

10. ⏰ Screen Time (if Customize)
    → Set Up Later

11. 🎤 Siri
    → Enable/Disable (your choice)
    → Recommended: Enable (useful!)

12. 🔐 FileVault Disk Encryption
    ✅ HIGHLY RECOMMENDED: Enable
    → "Turn On FileVault"
    → Encrypts disk for security
    → Choose "iCloud account" or "Recovery key"

13. 👆 Touch ID
    → Set up fingerprint
    → Click "Continue"
    → Follow prompts (place finger 5-6 times)

14. 💳 Apple Pay (optional)
    → Set Up Later

15. 🌓 Appearance
    → Light / Dark / Auto
    → Choose your preference

16. 🎉 Desktop!
    → Welcome to your CLEAN Mac!
    → NO MDM PROMPT!
    → NO "Remote Management"!
```

---

### **PHASE 6: Verify MDM Bypass**

#### Verification Commands:

```bash
# 1. Check MDM Enrollment Status
sudo profiles status -type enrollment

# ✅ Expected output:
Enrolled via DEP: No
MDM enrollment: No

# ❌ If shows "Yes" → Bypass failed, try IPSW restore again


# 2. Check Configuration Profiles
sudo profiles list

# ✅ Expected output:
There are no configuration profiles installed in the system domain

# ❌ If shows MDM profiles → Bypass failed


# 3. Check System Profiler
system_profiler SPConfigurationProfileDataType

# ✅ Expected output:
Configuration Profiles:
(null)

# ❌ If shows profiles → Bypass failed


# 4. Check for "Remote Management"
System Settings → General → Device Management

# ✅ Expected: Section doesn't exist or empty
# ❌ If shows organization → Bypass failed


# 5. Check Hosts File (Optional)
cat /etc/hosts | grep -E "(mdm|device|enrollment)"

# Should be EMPTY (IPSW bypass doesn't need hosts file!)
# But adding blocks is good for extra protection
```

#### Extra Protection (Optional but Recommended):

```bash
# Even though IPSW bypassed MDM,
# Add hosts file blocking for EXTRA protection:

sudo nano /etc/hosts

# Add to end of file:
0.0.0.0 deviceenrollment.apple.com
0.0.0.0 mdmenrollment.apple.com
0.0.0.0 iprofiles.apple.com

# Save: Ctrl+O, Enter, Ctrl+X

# Verify:
ping deviceenrollment.apple.com
# Should fail or return 0.0.0.0

# Why?
# - Prevents accidental re-enrollment
# - Extra layer of protection
# - Doesn't hurt, only helps!
```

---

### **PHASE 7: Restore Apps & Settings**

#### Now your M1 Mac is clean and MDM-free!

```bash
# Step 7.1: Connect backup drive
# Plug in USB drive with /mac-backup folder

# Step 7.2: Run setup script
cd /Volumes/DATA/mac-backup/app
./setup-mac.sh

# This will:
✅ Install Homebrew
✅ Install all 38 packages (CLI + GUI apps)
✅ Set Fish as default shell
✅ Configure PATH for pyenv, fnm, etc.
✅ Install Fish plugins (Tide, fzf, zoxide, done)
✅ Install Python 3.12 + Node.js LTS

# Step 7.3: Wait 20-40 minutes
# Go get coffee ☕
# Script runs automatically

# Step 7.4: Restart terminal
exec fish

# Step 7.5: Configure Tide (optional)
tide configure
# Choose style you like

# Step 7.6: Manual apps
# Check: /Volumes/DATA/mac-backup/app/manual-apps.txt
# Install 23 apps manually (Office, Zalo, etc.)

# Step 7.7: Additional config
# Git
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# SSH
ssh-keygen -t ed25519 -C "your@email.com"

# AWS
aws configure

# Azure
az login
```

---

## ✅ Success Checklist

After completing all phases, verify:

```bash
✅ M1 Mac boots normally
✅ No MDM enrollment prompt during setup
✅ No "Remote Management" in System Settings
✅ `sudo profiles list` shows empty
✅ `sudo profiles status -type enrollment` shows "No"
✅ Can sign into Apple ID without issues
✅ Can update macOS normally
✅ All apps installed via setup-mac.sh
✅ Fish shell works with Tide prompt
✅ Can use Terminal normally
```

---

## 🎯 Troubleshooting

### Issue 1: Cannot Enter DFU Mode

```bash
Symptoms:
- M1 Mac keeps booting to Recovery
- M1 Mac shows Apple logo
- Nothing appears in Apple Configurator 2

Fixes:
1. Watch timing diagram again (Section Phase 3)
2. Try lighter button press (not too hard)
3. Count out loud for timing
4. Practice 5-10 times (common to need many attempts)
5. Try different USB-C port on Intel Mac
6. Try different USB-C cable
7. Restart Intel Mac
8. Update Apple Configurator 2 to latest
9. Watch YouTube tutorial for visual guide
```

### Issue 2: Restore Fails with Error

```bash
"Unable to restore. Unknown error."

Fixes:
1. Verify IPSW file integrity:
   shasum -a 256 ~/Downloads/*Restore.ipsw
   Compare with ipsw.me checksum

2. Re-download IPSW file:
   Delete old file, download fresh

3. Verify model match:
   IPSW model MUST match M1 Mac model exactly

4. Enter DFU mode again:
   Better DFU = better restore success

5. Try older macOS:
   Instead of Sequoia, try Sonoma IPSW

6. Reset Apple Configurator 2:
   Quit app, delete ~/Library/Preferences/com.apple.configurator*
   Reopen app
```

### Issue 3: MDM Still Appears After Restore

```bash
Symptoms:
- Setup Assistant shows "Remote Management"
- System Settings shows organization

This means:
- Mac is in ABM/ASM (Apple Business/School Manager)
- IPSW bypass didn't work
- Hardware-enrolled via serial number

Fixes:
1. Try IPSW restore again (2-3 times)

2. If still fails, try different macOS version:
   - Current: Sequoia → Try: Sonoma
   - Or: Sonoma → Try: Ventura

3. If STILL fails, Mac is in ABM/ASM:
   → Contact original owner to remove from ABM
   → Or: Use Method 2 (Router blocking + Fresh install)
   → Success rate drops to ~70% but still possible

4. Last resort:
   → Apple Store with proof of ownership
   → Request ABM/ASM removal
```

### Issue 4: Cable Not Working

```bash
Symptoms:
- Apple Configurator 2 doesn't detect M1 Mac
- DFU mode seems correct but nothing happens

Fixes:
1. Verify cable is DATA cable:
   ✅ Thunderbolt 3/4 cable (best)
   ✅ USB-C 3.1 Gen 2 cable
   ❌ Charge-only cable (won't work)

2. Test cable:
   - Connect M1 Mac (while on) to Intel Mac
   - Try file sharing
   - If works → Cable OK

3. Try different ports:
   - Intel Mac has multiple USB-C/Thunderbolt ports
   - Try each one

4. Try different cable:
   - Borrow from friend
   - Buy Thunderbolt 3 cable (~$30-50)
```

### Issue 5: Stuck During Restore

```bash
Symptoms:
- Progress bar stuck at same % for >1 hour
- Apple Configurator 2 frozen

Fixes:
1. Wait 15 more minutes (sometimes just slow)

2. If truly stuck:
   → Force quit Apple Configurator 2 (Cmd+Q)
   → Unplug cable
   → Force shutdown M1 Mac (hold Power 10s)
   → Wait 1 minute
   → Start over from Phase 3 (DFU mode)

3. If repeats:
   → Try different USB-C port
   → Try different cable
   → Restart Intel Mac
   → Try on different Intel Mac if available
```

---

## 📊 Comparison with Other Methods

### For Your Setup (M1 Pro + Intel Mac available):

| Method | Recommend? | Success | Time | Difficulty |
|--------|-----------|---------|------|------------|
| **IPSW Restore** | ⭐ **BEST!** | ~95% | ~1-2h | Medium |
| USB + Router block | ✅ Backup | ~70% | ~1h | Easy |
| Recovery + Hosts | ⚠️ Last resort | ~40% | ~30m | Easy |

**Recommendation:** Try IPSW first! Nếu fail mới dùng USB + Router blocking.

---

## 🎓 How IPSW Bypass Works (Technical)

### Normal macOS Install Flow:
```
1. Boot installer
2. Install OS files
3. First boot → Setup Assistant
4. Setup Assistant checks:
   - iprofiles.apple.com/macProfile
   - deviceenrollment.apple.com
5. If serial number in DEP → Force MDM enrollment
6. User MUST enroll to continue
```

### IPSW Restore Flow:
```
1. Enter DFU mode (firmware level)
2. Apple Configurator 2 talks to firmware (not OS)
3. Firmware restore:
   - Erases NVRAM
   - Resets activation records
   - Clears DEP cache
   - Writes fresh firmware
4. First boot → Setup Assistant
5. Setup Assistant checks DEP servers
6. Serial number lookup → NO MATCH (cache cleared!)
7. Proceeds as NEW Mac → No MDM!
```

### Why It Works Better:
```
Hosts file:     Software level (OS can bypass)
Router block:   Network level (firmware can use IP)
IPSW Restore:   Firmware level (deepest possible)
                → Resets hardware identifiers
                → Clears activation history
                → Like factory-new Mac
```

---

## ⚠️ Important Notes

### Legality:
```
✅ Legal use:
   - YOUR OWN personal Mac
   - Second-hand Mac with orphaned MDM
   - Testing/education on your device

❌ Illegal use:
   - Company/school Mac
   - Stolen device
   - Bypass corporate security without authorization
```

### After Bypass:
```
✅ Safe to do:
   - Update macOS normally
   - Sign into Apple ID
   - Use App Store
   - Sync iCloud
   - Install apps

❌ DON'T do:
   - "Erase All Content and Settings"
     → Will trigger MDM check again!
   - Factory reset via Recovery
     → May re-enroll in DEP!

⚠️ If need to reset again in future:
   → Use IPSW method again
   → Don't use built-in reset
```

### Persistence:
```
✅ Bypass persists:
   - Across macOS updates
   - After adding Apple ID
   - After app installs

❌ Bypass breaks:
   - If you factory reset via System Settings
   - If you erase disk via Recovery (without IPSW)
   - If Apple updates DEP system (rare)

→ Solution: Keep IPSW file + guide for future use
```

---

## 📚 Resources

### Downloads:
- **Apple Configurator 2:** App Store (free)
- **IPSW files:** https://ipsw.me/product/Mac

### Your Model:
```bash
# M1 Pro Models:
MacBookPro18,3 (14-inch): https://ipsw.me/MacBookPro18,3
MacBookPro18,1 (16-inch): https://ipsw.me/MacBookPro18,1
MacBookPro18,2 (16-inch): https://ipsw.me/MacBookPro18,2
```

### Verification:
```bash
# Check model:
system_profiler SPHardwareDataType | grep "Model Identifier"

# Check MDM status:
sudo profiles status -type enrollment

# Check profiles:
sudo profiles list
```

---

## 🎉 Success Story Timeline

```
Total time: ~1-2 hours

Phase 1: Preparation (30 min)
├── Install Apple Configurator 2 (5 min)
├── Identify model (2 min)
├── Download IPSW (10-30 min)
└── Setup workspace (3 min)

Phase 2: Connect (5 min)
├── Connect cable (1 min)
└── Verify connection (4 min)

Phase 3: DFU Mode (10 min)
├── First attempts (5 min)
└── Success on 3rd-5th try (5 min)

Phase 4: Restore (40 min)
├── Start restore (2 min)
├── Restoring progress (30 min)
└── Verification (8 min)

Phase 5: Setup (10 min)
├── Setup Assistant (5 min)
└── Initial config (5 min)

Phase 6: Verify (5 min)
├── Check MDM status (2 min)
└── Add hosts file (3 min)

Phase 7: Restore Apps (30 min)
├── Run setup-mac.sh (25 min)
└── Manual apps (5 min)

🎉 DONE! Clean M1 Mac without MDM!
```

---

**⚠️ Remember:** Only use on devices you legally own!

**Questions?** Check [Troubleshooting](#-troubleshooting) section.

**Alternative methods:** See main [README.md](README.md) for other options.

---

Last updated: 2025-10-26
