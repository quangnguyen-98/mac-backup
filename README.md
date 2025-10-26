# 🍎 Mac Setup Automation

**Automated 3-step Mac setup** - Apps, Fish Shell, and IDEs installed automatically!

---

## 🚀 Quick Start - After Mac Reset

```bash
cd /path/to/mac-backup-main

# Step 1: Install apps & tools (NO IDEs)
cd 1-app
./setup.sh

# Step 2: Setup Fish shell & Tide prompt
cd ../2-fish-shell
./setup-fish.sh
# → Restart Terminal

# Step 3: Install IDEs (IMPORTANT: Run last!)
cd ../3-ides
./setup-ides.sh
```

**Total time:** ~30-45 minutes

---

## 📂 Project Structure

```
mac-backup-main/
├── 1-app/                    # Step 1: Apps & CLI tools
│   ├── setup.sh              # Apps installation script
│   ├── Brewfile              # Package list (NO IDEs)
│   ├── manual-apps.txt       # Manual install apps
│   └── README.md
│
├── 2-fish-shell/             # Step 2: Fish Shell
│   ├── setup-fish.sh         # Fish + Tide setup
│   ├── CONFIGURE-IDES.md     # Manual IDE config (if needed)
│   └── README.md
│
├── 3-ides/                   # Step 3: IDEs (last!)
│   ├── setup-ides.sh         # JetBrains IDEs installer
│   └── Brewfile-IDEs         # IDE packages list
│
├── SETUP-GUIDE.md            # Full setup guide (DETAILED)
└── README.md                 # This file (SUMMARY)
```

---

## ⚡ Why 3 Steps?

### **Step 1: Apps & Tools**
- Install Homebrew, CLI tools, GUI apps
- **NO IDEs** (PyCharm, WebStorm, etc.)
- VSCode is OK (will be auto-configured)

### **Step 2: Fish Shell**
- Set Fish as **default shell**
- IDEs installed later will auto-detect Fish!

### **Step 3: IDEs**
- Install JetBrains IDEs & Android Studio
- **Automatically use Fish** (because Fish is default)
- **No manual configuration needed!**

---

## 📦 Packages to be Installed

### **CLI Tools** (Step 1)
- git, fish, fnm, pyenv, direnv
- fzf, zoxide, bat, eza, ripgrep
- awscli, azure-cli, libpq

### **GUI Apps** (Step 1)
- **Dev:** VSCode, Docker, Postman, TablePlus, Fork
- **Browser:** Chrome, Arc
- **Productivity:** Slack, Notion, Rectangle, Clipy
- **Media:** VLC, IINA
- **Utilities:** Keka, AppCleaner, Stats

### **IDEs** (Step 3)
- PyCharm, WebStorm, GoLand, DataGrip
- Android Studio

### **Fish Plugins** (Step 2)
- Tide (beautiful prompt)
- fzf.fish (fuzzy search)
- done (notifications)

---

## ✨ Features

### **Fish Shell with Tide Prompt**
```fish
╭─  ~/projects/app  main ⇡1  🐍 3.12.0  ⬢ 20.0.0  5s ─╮
╰─ ❯
```
- Git branch & status
- Python/Node versions
- Command duration
- Beautiful icons (Nerd Font)

### **Auto-configured PATH**
- pyenv, fnm, AWS CLI, Azure CLI, PostgreSQL client
- All tools work immediately, no configuration needed!

### **Keyboard Shortcuts**
- **Ctrl+R** - Search command history (fzf)
- **Ctrl+Alt+F** - Search files
- **z <keyword>** - Smart directory jump (zoxide)

### **Nerd Font & Terminal Icons**
- Auto-install MesloLGS Nerd Font
- VSCode terminal: Auto-configured
- JetBrains IDEs: Configuration guide

---

## 📚 Documentation

### **Full Guide:**
→ **[SETUP-GUIDE.md](SETUP-GUIDE.md)** - Detailed step-by-step guide, troubleshooting, FAQ

### **Per-folder Guides:**
- **[1-app/README.md](1-app/README.md)** - Apps & tools setup
- **[2-fish-shell/README.md](2-fish-shell/README.md)** - Fish shell setup
- **[2-fish-shell/CONFIGURE-IDES.md](2-fish-shell/CONFIGURE-IDES.md)** - Manual IDE config (if needed)

---

## 🎯 After Setup

### **1. Configure Terminal Font** (For icons to display)

**iTerm2 / Terminal.app:**
```
Preferences → Profiles → Font → MesloLGS Nerd Font Mono (size 13)
```

**JetBrains IDEs:**
```
Settings → Editor → Color Scheme → Console Font
✅ Use console font instead of default
Font: MesloLGS Nerd Font Mono, Size: 13
```

**VSCode:** ✅ Already auto-configured!

### **2. Configure Tide Prompt**

```fish
tide configure
```
Choose style: **Rainbow** (recommended)

### **3. Git Config**

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

### **4. SSH Keys**

```bash
ssh-keygen -t ed25519 -C "your@email.com"
```

---

## ❓ Quick FAQ

**Q: Why must IDEs be installed last?**
→ IDEs detect default shell on first launch. Install after Fish is default → IDEs auto-use Fish!

**Q: What about VSCode?**
→ VSCode is auto-configured via settings.json, so it's OK to install in step 1.

**Q: Does Fish shell auto-detect PATH?**
→ YES! Script pre-configures everything (pyenv, fnm, AWS, etc.)

**Q: Icons not displaying?**
→ Configure terminal font to "MesloLGS Nerd Font Mono" (see guide above)

**Q: How long does it take?**
→ ~30-45 minutes automated + 10-15 minutes manual config

---

## 🔧 Maintenance

### **Update Brewfile**
```bash
cd 1-app
brew bundle dump --force
```

### **Update Brewfile-IDEs**
```bash
cd 3-ides
brew bundle dump --force --file=Brewfile-IDEs
```

---

## 📊 Stats

| Category | Count | Time |
|----------|-------|------|
| CLI Tools | 15 | ~5 min |
| GUI Apps | 25 | ~15-20 min |
| IDEs | 5 | ~10-15 min |
| Fish Plugins | 3 | ~2 min |
| **Total** | **48 packages** | **~30-45 min** |

---

**🎉 Enjoy your fresh Mac setup!**

See [SETUP-GUIDE.md](SETUP-GUIDE.md) for complete details.
