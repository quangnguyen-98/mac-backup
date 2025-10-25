# MDM Bypass - Quick Start

**⚠️ Personal devices only! Do not use on company/school devices.**

---

## 🚀 Fastest Method (2 minutes)

### Intel Mac:

```bash
# 1. Restart + hold Cmd+R
# 2. Utilities → Terminal
# 3. Run:

csrutil disable
reboot

# 4. Boot Recovery again (Cmd+R)
# 5. Utilities → Terminal → Run:

mount -uw /
cat >> /Volumes/Macintosh\ HD/etc/hosts << 'EOF'
0.0.0.0 deviceenrollment.apple.com
0.0.0.0 mdmenrollment.apple.com
0.0.0.0 iprofiles.apple.com
EOF

rm -rf /Volumes/Macintosh\ HD/private/var/db/ConfigurationProfiles
reboot

# 6. Done! Complete Setup Assistant normally
```

---

### Apple Silicon (M1/M2/M3):

```bash
# 1. Shutdown → Hold Power button 10s
# 2. Options → Continue
# 3. Utilities → Terminal
# 4. Run:

csrutil disable
reboot

# 5. Boot Recovery again (Power button)
# 6. Utilities → Terminal → Run:

mount -uw /
cat >> /Volumes/Macintosh\ HD/etc/hosts << 'EOF'
0.0.0.0 deviceenrollment.apple.com
0.0.0.0 mdmenrollment.apple.com
0.0.0.0 iprofiles.apple.com
EOF

rm -rf /Volumes/Macintosh\ HD/private/var/db/ConfigurationProfiles
reboot

# 7. Done! Complete Setup Assistant normally
```

---

## 📝 What This Does

1. **Disable SIP** - Allow system modifications
2. **Block MDM servers** - Prevent enrollment
3. **Remove profiles** - Clean existing MDM
4. **Reboot** - Apply changes

---

## ✅ Verify After Setup

```bash
# Check hosts file
cat /etc/hosts | grep mdm

# Test blocking (should fail)
ping deviceenrollment.apple.com

# Check for MDM profiles (should be empty)
sudo profiles list
```

---

## 🆘 If It Doesn't Work

1. **Read full guide:** `README.md`
2. **Use automated script:** `mdm-bypass.sh`
3. **Try fresh install:** Method 3 in README

---

## ⚠️ Legal Reminder

**Only use on:**
- ✅ Máy Mac CÁ NHÂN của bạn
- ✅ Second-hand Mac với orphaned MDM
- ✅ Testing/education (your own device)

**DO NOT use on:**
- ❌ Company/school devices
- ❌ Stolen devices
- ❌ Any device you don't legally own

**You are responsible for legal compliance!**
