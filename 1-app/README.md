# 📦 Step 1: Apps & Tools Setup

**Step 1 of 3** - Install Homebrew, CLI tools, and GUI apps (NO IDEs)

---

## 🚀 Quick Start

```bash
cd 1-app
./setup.sh
```

⚠️ **NOTE**: Run this script **BEFORE** setting up Fish shell!

---

## ✨ What Does the Script Do?

### 1. Install Homebrew
- Auto-detect M1/M2 (ARM) or Intel
- Setup PATH for Homebrew
- Update Homebrew

### 2. Install packages from Brewfile
- **CLI Tools:** 15 packages
- **GUI Apps:** ~25 apps
- **Nerd Font:** For terminal icons

### 3. Install Python & Node.js
- Python 3.12 (via pyenv)
- Node.js LTS (via fnm)

### 4. Setup bash/zsh PATH
- Configure PATH for bash/zsh (compatibility)
- Fish will be configured in step 2

### 5. Show manual apps list
- Display 25+ apps that need manual installation
- Saved in `manual-apps.txt`

---

## 📦 Packages to be Installed

### **CLI Tools (15)**

**Version Managers:**
- `pyenv` + `pyenv-virtualenv` - Python version manager
- `fnm` - Fast Node.js version manager
- `goenv` - Go version manager
- `jenv` - Java version manager

**Dev Tools:**
- `git` - Version control
- `fish` - Friendly Interactive Shell
- `direnv` - Directory-specific environment variables

**Utilities:**
- `fzf` - Fuzzy finder
- `zoxide` - Smart cd (z command)
- `bat` - Better cat with syntax highlighting
- `eza` - Modern ls replacement
- `ripgrep` - Fast grep (rg)

**Cloud & DB:**
- `awscli` - AWS CLI
- `azure-cli` - Azure CLI
- `libpq` - PostgreSQL client (psql, pg_dump)

### **GUI Apps (~25)**

**Development:**
- Visual Studio Code
- Docker Desktop
- Postman (API testing)
- TablePlus (Database GUI)
- Fork (Git GUI)

**Browsers:**
- Google Chrome
- Arc Browser

**Productivity:**
- Slack
- Notion
- Rectangle (Window manager)
- Clipy (Clipboard manager)
- Stats (System monitor)

**Media:**
- VLC Media Player
- IINA (Modern video player)

**Utilities:**
- Keka (Archive manager)
- AppCleaner (Uninstaller)
- The Unarchiver

**Fonts:**
- MesloLGS Nerd Font (for terminal icons)

### **NOT Included (Install in Step 3):**
- ❌ PyCharm
- ❌ WebStorm
- ❌ GoLand
- ❌ DataGrip
- ❌ Android Studio

→ IDEs are installed in **Step 3** to auto-detect Fish shell!

---

## 📝 Manual Apps (manual-apps.txt)

These apps need to be downloaded & installed manually:

**Productivity:**
- Microsoft Office (Word, Excel, PowerPoint)
- Microsoft Teams
- Zoom
- Line

**Vietnamese Tools:**
- EVKey (Vietnamese keyboard)
- Zalo

**Entertainment:**
- Spotify
- Discord
- Steam

**Developer Tools (Licensed):**
- JetBrains Toolbox (optional, for managing IDEs)

**Utilities:**
- Logi Options+ (Logitech mouse/keyboard)
- NTFS for Mac (Read/write NTFS drives)

See `manual-apps.txt` for the complete list.

---

## ⚠️ After Script Completion

### 1. Restart Terminal (or reload shell)
```bash
exec bash
```

### 2. Verify Homebrew
```bash
brew --version
# → Should display version (e.g., Homebrew 4.x.x)
```

### 3. Verify tools installed
```bash
which python3  # → /Users/you/.pyenv/shims/python3
which node     # → /Users/you/.local/share/fnm/node-versions/.../bin/node
```

### 4. Next step → Setup Fish Shell
```bash
cd ../2-fish-shell
./setup-fish.sh
```

---

## 🔧 Customization

### Add/remove packages in Brewfile

Edit `Brewfile`:

```ruby
# Add CLI tool
brew "neovim"

# Add GUI app
cask "figma"

# Remove: Comment out or delete line
# cask "slack"
```

Then run again:
```bash
brew bundle install
```

### Update Brewfile with current packages

```bash
cd 1-app
brew bundle dump --force
```

---

## ❓ Troubleshooting

### Homebrew install failed?
```bash
# Try manual install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Python/Node not found after install?
```bash
# Reload shell
exec bash

# Check pyenv
pyenv versions

# Check fnm
fnm list
```

### Some apps failed to install?
```bash
# Check errors
brew bundle install --verbose

# Install individually
brew install --cask <app-name>
```

### Nerd Font not working in Terminal?
→ Font is installed but not **configured**. See font configuration guide in `SETUP-GUIDE.md` or after running step 2.

---

## 📚 Files

```
1-app/
├── setup.sh           # Main setup script
├── Brewfile           # Homebrew packages list
├── manual-apps.txt    # Manual install apps
└── README.md          # This file
```

---

## 🎯 What's Next?

```bash
# Step 2: Setup Fish Shell
cd ../2-fish-shell
./setup-fish.sh
```

See [../SETUP-GUIDE.md](../SETUP-GUIDE.md) for complete details.
