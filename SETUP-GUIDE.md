# 🚀 Mac Setup Guide

Complete setup guide for Mac after factory reset with **3 simple steps**.

---

## 📋 Overview

Setup is divided into **3 steps** in IMPORTANT order:

1. **`1-app/`** - Install Homebrew, apps, CLI tools, fonts (15-30 minutes)
2. **`2-fish-shell/`** - Setup Fish shell with beautiful Tide prompt (2-3 minutes)
3. **`3-ides/`** - Install IDEs (PyCharm, Android Studio, etc.) (10-20 minutes)

⚠️ **IMPORTANT**: Must run in order for IDEs to auto-detect Fish shell!

---

## 🎯 Step 1: Install Apps & Tools (NO IDEs)

### Run script:

```bash
cd 1-app
./setup.sh
```

### Script will automatically:

✅ Install Homebrew package manager
✅ Install all apps & tools from Brewfile:
- **CLI Tools**: git, fish, fnm, pyenv, direnv, fzf, zoxide
- **Cloud**: AWS CLI, Azure CLI
- **Dev Tools**: Docker, VS Code, Postman, GitHub Desktop, GitKraken
- **Browsers**: Chrome, Firefox, Edge
- **Communication**: Slack, Telegram, Zoom, Messenger
- **Utilities**: iTerm2, VLC, Rectangle, The Unarchiver, etc.
- **Nerd Font**: MesloLGS NF (for beautiful icons)

✅ Install Python 3.12 (via pyenv)
✅ Install Node.js LTS (via fnm)
✅ Setup PATH for bash/zsh

⚠️ **IDEs NOT installed** (PyCharm, Android Studio, etc.) - Will install in step 3!

---

## 🐟 Step 2: Setup Fish Shell

### Run script:

```bash
cd ../2-fish-shell
./setup-fish.sh
```

### Script will automatically:

✅ Set Fish as **default shell** of the system
✅ Create `~/.config/fish/config.fish` with PATH setup for:
- Homebrew
- Python (pyenv)
- Node.js (fnm), pnpm
- PostgreSQL (libpq)
- Direnv, zoxide (as `cd`)
- Android SDK (auto-detect)
- Java: Android Studio's bundled JBR (auto-detect)
- Python from python.org as the fallback `python3` (auto-detect)

✅ Install Fisher plugin manager
✅ Install Tide prompt (you'll configure style with `tide configure`)
✅ Install Fish plugins:
- `fzf.fish` - Fuzzy finder (Ctrl+R: history, Ctrl+Alt+F: files)
- `done` - Notifications for long-running commands

✅ Auto-configure VSCode terminal to use Fish

### Tide Prompt - Example (Rainbow style):

```
╭─  ~/projects/myapp  main ⇡1  🐍 3.12.0  ⬢ 20.0.0  5s ─╮
╰─ ❯                                                        ─╯
```

- 📁 Current directory (with smart truncation)
- 🌿 Git branch & status (⇡ unpushed, ⇣ behind, etc.)
- 🐍 Python version (when in Python project)
- ⬢ Node.js version (when in Node project)
- ⏱️ Command duration (if > 3 seconds)
- ✔️/❌ Exit status

### ⚠️ After running:

```bash
# Restart Terminal COMPLETELY (close and reopen)
# Check Fish is default shell
echo $SHELL
# → Must show: /opt/homebrew/bin/fish
```

### 🎨 Configure Terminal Font (For icons to display correctly)

Script automatically:
- ✅ Installed MesloLGS Nerd Font
- ✅ Configured VSCode terminal font

**You need to manually configure for other terminals:**

#### **iTerm2:**
1. Open Preferences (`Cmd + ,`)
2. **Profiles** → Select profile you're using
3. **Text** tab
4. **Font** → Click **Change Font**
5. Select: **MesloLGS Nerd Font Mono**, Size: **13**

#### **Terminal.app (Mac default):**
1. Open Preferences (`Cmd + ,`)
2. **Profiles** tab
3. Select profile you're using (usually "Basic" or "Pro")
4. Click **Font** → **Change**
5. Select: **MesloLGS Nerd Font Mono**, Size: **13**

#### **JetBrains IDEs (PyCharm, WebStorm, GoLand, DataGrip):**
1. Open Settings (`Cmd + ,`)
2. **Editor** → **Color Scheme** → **Console Font**
3. ✅ Check **Use console font instead of the default**
4. **Font:** `MesloLGS Nerd Font Mono`
5. **Size:** `13`
6. Click **Apply** → **OK**

#### **VSCode:**
✅ Already auto-configured!

**After configuring font, restart Terminal to apply.**

---

## 💻 Step 3: Install IDEs (AFTER Fish is default shell)

⚠️ **IMPORTANT**: Only run this step **AFTER** restarting Terminal and Fish is default shell!

### Why must IDEs be installed last?

When IDE (PyCharm, Android Studio, etc.) **runs for the first time**, they will:
1. Detect system default shell (`$SHELL`)
2. Save that shell to IDE settings
3. Use that shell for terminal panel

→ If install IDE **AFTER** Fish is default shell → IDE auto-uses Fish! ✅
→ If install IDE **BEFORE** Fish is default → IDE uses zsh → Must configure manually! ❌

### Run script:

```bash
cd ../3-ides
./setup-ides.sh
```

### Script will:

✅ Check Fish is default shell (if not → error)
✅ Install JetBrains IDEs:
- PyCharm (Python IDE)
- WebStorm (JavaScript/TypeScript IDE)
- GoLand (Go IDE)
- DataGrip (Database IDE)

✅ Install Android Studio

### After installation:

1. Open any IDE (PyCharm, Android Studio, etc.)
2. Open Terminal panel in IDE
3. **You'll see Tide prompt!** 🌈
4. Verify: `echo $SHELL` → Must be Fish!

---

## 🎨 Step 4: Set Font for Terminal (to see icons)

**REQUIRED to see beautiful icons!**

### Terminal.app / iTerm2:
1. `Preferences` (⌘,)
2. `Profiles` → `Text` / `Font`
3. Select **MesloLGS NF**
4. Restart Terminal

### IDE Terminal Font (PyCharm, Android Studio, etc.):
1. `Settings` (⌘,)
2. `Editor` → `Font`
3. Or `Appearance & Behavior` → `Appearance` → `Use custom font`: **MesloLGS NF**

---

## 📊 Process Summary

```
┌─────────────────────────────────────────────────────┐
│  Step 1: 1-app/setup.sh                             │
│  ✅ Install Homebrew, CLI tools, apps               │
│  ❌ NO IDEs                                          │
└─────────────────────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────┐
│  Step 2: 2-fish-shell/setup-fish.sh                 │
│  ✅ Set Fish as DEFAULT SHELL                       │
│  ✅ Configure Fish, install Tide                    │
│  ⚠️ RESTART TERMINAL                                 │
└─────────────────────────────────────────────────────┘
                       ↓
┌─────────────────────────────────────────────────────┐
│  Step 3: 3-ides/setup-ides.sh                       │
│  ✅ Install PyCharm, Android Studio, etc.           │
│  ✅ IDEs auto-detect Fish shell! 🎉                  │
└─────────────────────────────────────────────────────┘
```

---

## 📦 Apps Installed List

<details>
<summary><b>Click to view full list</b></summary>

### CLI Tools (Step 1)
- git, fish shell
- fnm (Node.js version manager)
- pyenv (Python version manager)
- direnv, fzf, zoxide
- awscli, azure-cli
- libpq (PostgreSQL client)

### Development (Step 1)
- Visual Studio Code (auto-configured for Fish)
- Postman
- Docker
- GitHub Desktop
- GitKraken

### IDEs (Step 3 - Install LAST)
- PyCharm
- WebStorm
- GoLand
- DataGrip
- Android Studio

### Browsers (Step 1)
- Google Chrome
- Firefox
- Microsoft Edge

### Communication (Step 1)
- Slack
- Telegram
- Zoom
- Messenger

### Utilities (Step 1)
- iTerm2
- The Unarchiver
- OnyX
- Rectangle (window manager)
- VLC
- WireGuard
- AnyDesk
- Google Drive
- Folx

### Fonts (Step 1)
- MesloLGS Nerd Font (for Tide icons)

</details>

---

## 🔧 Additional Setup

### Git Config:
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

### SSH Key:
```bash
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub  # Copy and add to GitHub/GitLab
```

### Fish Shell Tips:

```fish
# Smart directory jump (zoxide replaces cd)
cd project         # Jump to ~/projects/my-project
cdi                # Pick a directory interactively

# Fuzzy search history
Ctrl+R

# Fuzzy find files
Ctrl+Alt+F

# Change Tide style if desired
tide configure     # Interactive wizard
```

---

## 🎨 If You Want to Change Tide Style

Tide has 3 preset styles:

```fish
tide configure
```

1. **Lean** - Minimalist 1 line (compact)
2. **Classic** - Classic 2 lines (simple)
3. **Rainbow** - Colorful 2 lines (info-rich, colorful) ⭐ **Recommended**

---

## ❓ Troubleshooting

### Icons not displaying correctly (see · or ?)

**Cause:** Terminal not using Nerd Font

**Solution:**
1. Check font is installed:
   ```bash
   ls ~/Library/Fonts/ | grep Meslo
   ```
   If not found → Run: `brew install --cask font-meslo-lg-nerd-font`

2. Configure font in your Terminal app:
   - **iTerm2:** Preferences → Profiles → Text → Font → `MesloLGS Nerd Font Mono`
   - **Terminal.app:** Preferences → Profiles → Font → `MesloLGS Nerd Font Mono`
   - **VSCode:** Script auto-configured (check `settings.json`)
   - **JetBrains:** Settings → Editor → Console Font → `MesloLGS Nerd Font Mono`

3. **Restart Terminal** after changing font

### Fish not default shell?
→ Restart terminal or run `exec fish`

### IDE still using zsh?
→ May have installed IDE **BEFORE** Fish was default shell
→ See guide in `2-fish-shell/CONFIGURE-IDES.md`

### fnm/pyenv not working in Fish?
→ Reload config: `source ~/.config/fish/config.fish`

### VSCode terminal font not applied?
→ Check `~/Library/Application Support/Code/User/settings.json` has line:
```json
"terminal.integrated.fontFamily": "MesloLGS Nerd Font Mono"
```

---

## 📂 Directory Structure

```
mac-backup-main/
├── 1-app/                    # Step 1: Apps & Tools (NO IDEs)
│   ├── setup.sh
│   ├── Brewfile
│   └── manual-apps.txt
│
├── 2-fish-shell/             # Step 2: Fish Shell (Set as default!)
│   ├── setup-fish.sh
│   ├── CONFIGURE-IDES.md     # If manual IDE config needed
│   └── README.md
│
├── 3-ides/                   # Step 3: IDEs (Install LAST)
│   ├── setup-ides.sh
│   └── Brewfile-IDEs
│
├── README.md
└── SETUP-GUIDE.md            # This guide
```

---

## 🎉 Final Result

After completing all 3 steps, you'll have:

✅ Homebrew + dozens of apps & tools
✅ Python 3.12 & Node.js LTS ready
✅ Fish shell as **default shell** of system
✅ Fish with beautiful Tide prompt & rich info
✅ Icons & colors displaying fully
✅ Fuzzy search, smart cd, notifications
✅ **ALL IDEs automatically use Fish shell!** 🎉
✅ Git, Docker, browsers, communication apps

**Happy coding!** 🚀
