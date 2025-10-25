# Mac Backup & Restore

**Backup được tạo:** 2025-10-25
**Mục đích:** Cài lại Mac trong 1 lệnh, tất cả tự động!

---

## 🚀 Quick Start - SAU KHI RESET MAC

```bash
cd /Volumes/DATA/mac-backup
./setup-mac.sh
```

**Xong!** Uống cafe ☕ đợi 20-40 phút, script làm tất cả.

---

## 📦 Files trong backup

```
/Volumes/DATA/mac-backup/
├── setup-mac.sh         ⭐ Master script - CHẠY FILE NÀY
├── Brewfile             📦 Danh sách 37 packages
├── fish-config.fish     🐟 Fish shell config + PATH auto-setup
├── manual-apps.txt      📝 25 apps cần cài thủ công
└── README.md            📖 File này
```

**Tổng: 5 files (~19KB)**

---

## ⚡ Script tự động làm gì?

### **1. Install Homebrew** (tự động)
- Cài Homebrew nếu chưa có
- Setup PATH cho M1/M2 hoặc Intel Mac

### **2. Install 37 packages** (tự động)

**CLI Tools (9 packages):**
- git, fish, fnm, direnv
- awscli, azure-cli
- pyenv, pyenv-virtualenv
- libpq (PostgreSQL client)

**GUI Apps (28 apps):**

*Development Tools (7):*
- VS Code, Postman, Docker, ngrok
- Android Studio, GitHub Desktop, GitKraken

*JetBrains IDEs (5):*
- IntelliJ IDEA, PyCharm, WebStorm, GoLand, DataGrip

*Browsers (3):*
- Chrome, Firefox, Edge

*Communication (4):*
- Slack, Telegram, Zoom, Messenger

*Utilities (9):*
- iTerm2, The Unarchiver, Onyx, Spectacle
- VLC, WireGuard, AnyDesk, Google Drive, Folx

### **3. Setup Fish Shell** (tự động)
- ✅ Set Fish làm **default shell**
- ✅ Install **Fisher** plugin manager
- ✅ Install **Tide** prompt (đẹp + hiển thị Python/Node version)
- ✅ Tự động config PATH cho:
  - pyenv (Python version manager)
  - fnm (Node.js version manager)
  - libpq (PostgreSQL client: psql, pg_dump)
  - direnv (auto-load .envrc)
  - AWS CLI, Azure CLI
  - Homebrew packages

### **4. Install Python & Node.js** (tự động)
- Python 3.12 via pyenv
- Node.js LTS via fnm

### **5. Show Manual Apps List**
- Hiển thị 25 apps cần cài thủ công

---

## 🎯 Workflow chi tiết

### **Bước 1: Chạy setup script**
```bash
cd /Volumes/DATA/mac-backup
./setup-mac.sh
```

**Thời gian:** 20-40 phút (tùy tốc độ mạng)

**Trong lúc chờ, bạn có thể:**
- Uống cafe ☕
- Check email 📧
- Xem YouTube 📺

### **Bước 2: Restart terminal**
```bash
# Sau khi script xong
exec fish
```

**Lúc này bạn sẽ thấy Tide prompt:**
```fish
╭─ ~/ 🐍 3.12.0 📦 v20.10.0
╰─❯
```

### **Bước 3: (Optional) Configure Tide style**
```bash
tide configure
```

Chọn style bạn thích:
- **Modern** - Balanced, khuyên dùng
- **Lean** - Minimal
- **Rainbow** - Colorful
- **Classic** - Traditional

### **Bước 4: Cài manual apps**

Check file `manual-apps.txt`, tải và cài 25 apps:
- **Microsoft Office** (Excel, Word, PowerPoint, Outlook)
- **Games** (League of Legends)
- **Music Production** (Cubase 12, Steinberg tools)
- **Vietnamese** (EVKey, Zalo)
- **iOS Tools** (3uTools, Sideloadly)
- **Others** (Final Cut Pro, CapCut, Snagit...)

### **Bước 5: Additional setup**
```bash
# Git config
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# SSH keys
ssh-keygen -t ed25519 -C "your@email.com"

# AWS config
aws configure

# Azure login
az login
```

---

## 🐟 Fish Shell - PATH tự động!

**Sau khi chạy script, Fish đã được config sẵn mọi thứ:**

### ✅ **PATH tự động nhận:**
- **pyenv** - Python version manager
- **fnm** - Node.js version manager (auto-switch theo .node-version)
- **libpq** - PostgreSQL client (psql, pg_dump)
- **direnv** - Auto-load environment variables (.envrc)
- **AWS CLI**, **Azure CLI**
- **Homebrew packages** (git, docker, kubectl...)

### ✅ **Aliases có sẵn:**
```fish
ll      # ls -lah
g       # git
dc      # docker-compose
d       # docker
```

### ✅ **Tide prompt hiển thị:**
- 📁 Current directory
- 🌿 Git branch + status
- 🐍 Python version (nếu có pyenv)
- 📦 Node version (nếu có fnm)
- ⏱ Command execution time
- ⚡ Vi mode (nếu enable)

### ✅ **Auto-switch versions:**
```fish
# Tự động switch Python version
cd ~/project-python38
# → Fish tự động dùng Python 3.8 (nếu có .python-version)

# Tự động switch Node version
cd ~/project-node18
# → Fish tự động dùng Node 18 (nếu có .node-version)
```

**→ KHÔNG CẦN CONFIG PATH THỦ CÔNG!** 🎉

---

## 🐍 Python Development

### **Quản lý versions:**
```bash
# List Python versions đã cài
pyenv versions

# Install thêm version
pyenv install 3.11
pyenv install 3.13

# Set global Python
pyenv global 3.12

# Set local Python cho project
cd ~/myproject
pyenv local 3.11

# Create virtualenv
pyenv virtualenv 3.12 myenv
pyenv activate myenv
```

### **Cách dùng:**
```bash
# Install packages
pip install requests pandas numpy

# Tide prompt tự động show version
╭─ ~/project 🐍 3.12.0
╰─❯
```

---

## 📦 Node.js Development

### **Quản lý versions:**
```bash
# List Node versions
fnm list

# Install version
fnm install 18
fnm install 20

# Use version
fnm use 20

# Set default
fnm default 20

# Auto-switch theo .node-version
echo "20" > .node-version
cd .  # Fish tự động switch!
```

### **Cách dùng:**
```bash
# Install packages global
npm install -g yarn pnpm typescript

# Tide prompt tự động show version
╭─ ~/project 📦 v20.10.0
╰─❯
```

---

## 🗄️ PostgreSQL Client

**Script cài libpq (client only, không có server):**

```bash
# Connect to database
psql -h localhost -U postgres -d mydb

# Dump database
pg_dump -h localhost -U postgres mydb > backup.sql

# Restore database
psql -h localhost -U postgres mydb < backup.sql

# Với Docker PostgreSQL
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=pass postgres
psql -h localhost -U postgres
```

**→ Không cần cài PostgreSQL server, dùng Docker tốt hơn!**

---

## ☁️ Cloud CLI Tools

### **AWS CLI**
```bash
# Configure
aws configure

# Test
aws s3 ls
aws ec2 describe-instances
```

### **Azure CLI**
```bash
# Login
az login

# Test
az account list
az vm list
```

**→ Đã có sẵn trong PATH, không cần config gì!**

---

## 📊 Tổng kết packages

| Loại | Số lượng | Thời gian cài |
|------|----------|---------------|
| **CLI Tools** | 9 | Auto (~5 phút) |
| **GUI Apps** | 28 | Auto (~20-30 phút) |
| **Manual Apps** | 25 | Manual (~30-60 phút) |
| **Total** | **62 packages** | |

### **Đã giảm manual apps:**
- **Trước:** 52 manual apps ❌
- **Sau:** 25 manual apps ✅
- **Tự động:** 27 apps qua Homebrew! 🚀

---

## 🆘 Troubleshooting

### **Script báo "Permission denied"**
```bash
chmod +x setup-mac.sh
./setup-mac.sh
```

### **Fish không phải default shell**
```bash
chsh -s $(which fish)
# Sau đó logout/login lại
```

### **PATH không tự động load**
```bash
# Check Fish config
cat ~/.config/fish/config.fish

# Reload config
source ~/.config/fish/config.fish

# Hoặc restart terminal
exec fish
```

### **pyenv/fnm không hoạt động**
```bash
# Restart terminal
exec fish

# Check installation
which pyenv
which fnm

# Re-run config script
fish /Volumes/DATA/mac-backup/fish-config.fish
```

### **Homebrew cài chậm**
- Bình thường, mất 20-40 phút
- JetBrains apps (~1GB mỗi app) tốn thời gian
- Có thể dùng VPN nếu network chậm
- Script có `--verbose` flag để xem progress

### **App nào đó không cài được**
```bash
# Check app availability
brew search <app-name>

# Install manually
brew install --cask <app-name>

# Check logs
cat /tmp/setup-mac.log
```

---

## 📚 Useful Commands

### **Homebrew**
```bash
# Update Homebrew
brew update

# Upgrade all packages
brew upgrade

# List installed
brew list          # CLI tools
brew list --cask   # GUI apps

# Search package
brew search [name]

# Uninstall
brew uninstall [name]

# Cleanup old versions
brew cleanup
```

### **Fish Shell**
```bash
# Edit config
vim ~/.config/fish/config.fish

# Reload config
source ~/.config/fish/config.fish

# Update plugins
fisher update

# List plugins
fisher list

# Web-based config UI
fish_config
```

### **Update Brewfile**
```bash
# Sau khi cài thêm apps mới
cd /Volumes/DATA/mac-backup
brew bundle dump --force
```

### **Tide Prompt**
```bash
# Configure style
tide configure

# Reload
tide reload

# Bug report
tide bug-report
```

---

## 💡 Tips & Best Practices

### **1. Backup folder này lên cloud**
- Google Drive / Dropbox / iCloud Drive
- GitHub private repo
- USB drive (để dự phòng)

### **2. Định kỳ update Brewfile**
```bash
# Mỗi tháng hoặc khi cài app mới
cd /Volumes/DATA/mac-backup
brew bundle dump --force
git commit -am "Update Brewfile"  # Nếu dùng Git
```

### **3. Version control cho dotfiles**
```bash
# Backup Fish config
cp ~/.config/fish/config.fish /Volumes/DATA/mac-backup/

# Hoặc tạo Git repo
cd ~
git init
git add .config/fish/
git add .gitconfig
git commit -m "Backup dotfiles"
```

### **4. Test trên máy ảo trước**
- Dùng VM (Parallels, UTM) để test script
- Đảm bảo mọi thứ hoạt động trước khi reset Mac thật

### **5. Screenshot/video setup**
- Record lại quá trình setup lần đầu
- Để biết mình đã config gì (Git, SSH, AWS...)

---

## 🔄 Khi cài app mới

### **Qua Homebrew (khuyên dùng):**
```bash
# Search
brew search notion

# Install
brew install --cask notion

# Update Brewfile
brew bundle dump --force
```

### **Thủ công:**
- Download từ trang chính thức
- Thêm vào `manual-apps.txt` để nhớ

---

## ❓ FAQ

### **Q: Fish shell có tự động nhận PATH khi cài CLI mới không?**
A: **CÓ!** Homebrew tự động link vào PATH, Fish nhận luôn.

### **Q: Có cần config PATH cho pyenv, fnm không?**
A: **KHÔNG!** Script đã config sẵn trong `~/.config/fish/config.fish`.

### **Q: Tide prompt có update Python/Node version tự động không?**
A: **CÓ!** Tide tự động detect và hiển thị version khi cd vào project.

### **Q: Có thể dùng cho nhiều Mac không?**
A: **CÓ!** Copy folder này sang Mac khác và chạy script.

### **Q: Mất bao lâu để restore toàn bộ?**
A:
- Auto-install: 20-40 phút (Homebrew)
- Manual apps: 30-60 phút (tùy bạn)
- Config Git/SSH/AWS: 10 phút
- **Tổng:** ~1-2 giờ

### **Q: Có cần chạy lại script nếu thêm packages vào Brewfile?**
A: **KHÔNG!** Chỉ cần:
```bash
brew bundle install --file=/Volumes/DATA/mac-backup/Brewfile
```

### **Q: License của paid apps có được restore không?**
A: **KHÔNG!** Phải activate lại (JetBrains, Office, CleanMyMac...)

---

## 🎯 Checklist sau khi setup

### **System Setup**
- [ ] Chạy `./setup-mac.sh` ✅
- [ ] Restart terminal (`exec fish`)
- [ ] Configure Tide style (`tide configure`)
- [ ] Cài 25 manual apps từ `manual-apps.txt`

### **Development Setup**
- [ ] Git config (name, email)
- [ ] SSH keys (`ssh-keygen -t ed25519`)
- [ ] Add SSH key to GitHub/GitLab
- [ ] AWS configure (`aws configure`)
- [ ] Azure login (`az login`)
- [ ] Clone repositories

### **Application Setup**
- [ ] Sign in Mac App Store
- [ ] Sign in JetBrains Account (IntelliJ, PyCharm...)
- [ ] Sign in VS Code (sync settings)
- [ ] Sign in Chrome (sync bookmarks)
- [ ] Sign in Slack, Telegram, Zoom
- [ ] Sign in Google Drive, Dropbox

### **System Preferences**
- [ ] Trackpad settings
- [ ] Keyboard shortcuts
- [ ] Dock preferences
- [ ] Display settings (resolution, night shift)
- [ ] Mission Control settings

### **Optional**
- [ ] Import iTerm2 settings
- [ ] Restore browser bookmarks/extensions
- [ ] Setup Time Machine backup
- [ ] Install macOS updates

---

## 🔐 Security Notes

### **Điều KHÔNG BAO GIỜ backup:**
- ❌ Passwords
- ❌ SSH private keys
- ❌ AWS credentials
- ❌ API tokens
- ❌ `.env` files với secrets

### **Nên tạo mới sau khi reset:**
- ✅ SSH keys
- ✅ GPG keys
- ✅ AWS credentials
- ✅ Git signing keys

---

## 📝 Changelog

**2025-10-25**
- ✅ Created master setup script (setup-mac.sh)
- ✅ Filtered Brewfile: 37 packages (9 CLI + 28 apps)
- ✅ Added Fish auto-configuration with PATH
- ✅ Added Tide prompt installation
- ✅ Added pyenv for Python management
- ✅ Added fnm for Node.js management
- ✅ Added AWS CLI & Azure CLI
- ✅ Replaced PostgreSQL server with libpq client only
- ✅ Replaced CleanMyMac with Onyx
- ✅ Added JetBrains IDEs (5 apps)
- ✅ Added popular apps (Chrome, Slack, Docker...)
- ✅ Reduced manual apps: 52 → 25
- ✅ One-command installation workflow

---

## 🎉 Kết luận

**Backup này giúp bạn:**
- ✅ Cài lại Mac trong **1 lệnh**
- ✅ Tất cả **tự động** (37 packages)
- ✅ Fish shell **default** + Tide prompt đẹp
- ✅ PATH **tự động** nhận tất cả tools
- ✅ **Không cần config** gì thêm
- ✅ **Tiết kiệm** 2-3 giờ setup thủ công

**Chỉ cần:**
```bash
./setup-mac.sh
```

**Enjoy your fresh Mac! 🚀**

---

**Questions?** Check troubleshooting section hoặc file `manual-apps.txt`
