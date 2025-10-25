# Mac Backup & Restore

**One-command setup for fresh Mac M1**

---

## 🚀 Quick Start

```bash
cd /Volumes/DATA/mac-backup/app
./setup-mac.sh
```

**That's it!** Uống cafe ☕ đợi 20-40 phút.

---

## 📁 Structure

```
/Volumes/DATA/mac-backup/
├── README.md              📖 File này (hướng dẫn ngắn gọn)
├── app/                   📦 App & Tool Setup
│   ├── setup-mac.sh       ⭐ CHẠY FILE NÀY
│   ├── Brewfile           📦 39 packages (11 CLI + 28 GUI apps)
│   ├── fish-config.fish   🐟 Fish shell auto-config
│   ├── manual-apps.txt    📝 25 apps cài thủ công
│   ├── README.md          📖 Hướng dẫn đầy đủ
│   └── FISH_PLUGINS.md    📖 Guide chi tiết Fish plugins
└── mdm-setup/             🔓 MDM Bypass Guide (Personal devices only!)
    ├── README.md          📖 Full MDM bypass guide (5 methods)
    ├── IPSW_METHOD.md     ⭐ BEST method for M1/M2/M3 (~95% success)
    ├── QUICK_START.md     ⚡ 2-minute quick start
    ├── ROUTER_BLOCKING.md 🌐 Network-level blocking
    ├── hosts              📝 Template hosts file
    └── mdm-bypass.sh      🤖 Automated bypass script
```

---

## ⚡ What the script does

**Tự động cài:**
- ✅ Homebrew
- ✅ 11 CLI tools (git, fish, fzf, zoxide, pyenv, fnm, aws-cli...)
- ✅ 28 GUI apps (VS Code, Chrome, JetBrains, Docker, Slack...)
- ✅ Fish shell (default) + 4 plugins (Tide, fzf, zoxide, done)
- ✅ Python 3.12 + Node.js LTS
- ✅ Auto-config PATH cho tất cả tools

**Kết quả:**
- Fish shell làm default với Tide prompt đẹp
- Tất cả PATH tự động (pyenv, fnm, aws, psql...)
- Keyboard shortcuts works ngay (Ctrl+R, z command...)
- Không cần config gì thêm!

---

## 📚 Documentation

- **app/README.md** - Hướng dẫn đầy đủ (31KB)
- **app/FISH_PLUGINS.md** - Fish plugins guide (17KB)

---

## 🎯 After Reset Mac

### 1. Copy folder này sang Mac mới
- USB drive
- Cloud (Google Drive, Dropbox...)
- AirDrop

### 2. Run script
```bash
cd /Volumes/DATA/mac-backup/app
./setup-mac.sh
```

### 3. Wait 20-40 minutes
- Script tự động làm tất cả
- Có thể làm việc khác trong lúc chờ

### 4. Restart terminal
```bash
exec fish
```

### 5. Configure Tide (optional)
```bash
tide configure
```

### 6. Install manual apps
Check `app/manual-apps.txt` (25 apps):
- Microsoft Office
- Games (League of Legends)
- Music tools (Cubase, Steinberg...)
- Vietnamese apps (EVKey, Zalo)
- Others...

### 7. Additional setup
```bash
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

### 8. Done! 🎉

---

## 💡 Features

### Fish Shell
- ✅ Default shell (tự động set)
- ✅ Tide prompt (đẹp, hiển thị Git/Python/Node versions)
- ✅ fzf integration (Ctrl+R search history, Ctrl+Alt+F search files)
- ✅ zoxide (smart cd: `z project` thay vì `cd ~/long/path`)
- ✅ done (notifications cho long commands)

### Auto-configured PATH
- ✅ pyenv (Python version manager)
- ✅ fnm (Node.js version manager)
- ✅ libpq (PostgreSQL client: psql, pg_dump)
- ✅ AWS CLI, Azure CLI
- ✅ All Homebrew packages

### Keyboard Shortcuts (works ngay)
- **Ctrl+R** - Search command history (fzf)
- **Ctrl+Alt+F** - Search files (fzf)
- **z <keyword>** - Smart jump to directory (zoxide)
- **zi** - Interactive directory jump

---

## 📊 Stats

| Item | Count | Time |
|------|-------|------|
| **CLI Tools** | 11 | ~5 min |
| **GUI Apps** | 28 | ~20-30 min |
| **Fish Plugins** | 4 | ~1 min |
| **Manual Apps** | 25 | ~30-60 min (manual) |
| **Total** | **68 packages** | ~1-2 hours |

---

## 🔧 Maintenance

### Update Brewfile
```bash
cd /Volumes/DATA/mac-backup/app
brew bundle dump --force
```

### Backup to cloud
```bash
# Sync to Google Drive/Dropbox
cp -r /Volumes/DATA/mac-backup ~/Google\ Drive/

# Or commit to Git
cd /Volumes/DATA/mac-backup
git add .
git commit -m "Update packages"
git push
```

---

## ❓ Quick FAQ

**Q: Mất bao lâu?**
A: ~20-40 phút auto-install + 30-60 phút manual apps

**Q: Fish có tự động nhận PATH không?**
A: CÓ! Script đã config sẵn tất cả.

**Q: Cần config gì thêm không?**
A: KHÔNG! Chỉ cần Git/SSH/AWS config.

**Q: Work trên M1 Mac không?**
A: CÓ! Đã optimize cho ARM64.

---

## 📖 Full Documentation

→ Xem **app/README.md** (31KB) cho:
- Chi tiết từng bước
- Troubleshooting
- Python/Node.js usage
- Tips & tricks
- Checklist đầy đủ

→ Xem **app/FISH_PLUGINS.md** (17KB) cho:
- Tide configuration
- fzf keyboard shortcuts
- zoxide usage examples
- done customization

---

**Enjoy your fresh Mac! 🚀**
