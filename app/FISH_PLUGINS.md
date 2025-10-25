# Fish Shell Plugins Guide

**4 plugins siêu hữu ích cho Fish shell trên Mac M1**

Sau khi chạy `setup-mac.sh`, bạn sẽ có sẵn 4 plugins này!

---

## 📋 Table of Contents

1. [Tide](#1-tide---beautiful-prompt)
2. [fzf.fish](#2-fzffish---fuzzy-search)
3. [zoxide](#3-zoxide---smart-directory-jump)
4. [done](#4-done---command-notifications)
5. [Tips & Tricks](#tips--tricks)
6. [Troubleshooting](#troubleshooting)

---

## 1. Tide - Beautiful Prompt

**Prompt theme đẹp với nhiều thông tin hữu ích**

### ✨ Features

**Hiển thị tự động:**
- 📁 Current directory (với Git repo name)
- 🌿 Git branch + status (clean/dirty)
- 🐍 Python version (nếu có pyenv)
- 📦 Node version (nếu có fnm)
- ⏱ Command execution time
- ⚡ Vi mode indicator (nếu enable)
- 🔴 Exit code (nếu command failed)

### 🎨 Styles Available

**1. Modern (Khuyên dùng)**
```fish
╭─ ~/project main ✓ 🐍 3.12.0 📦 v20.10.0
╰─❯
```
- Balanced giữa thông tin và không gian
- 2 dòng (dễ đọc)
- Hiển thị đủ thông tin quan trọng

**2. Lean (Minimal)**
```fish
~/project main ✓ ❯
```
- 1 dòng
- Minimal, chỉ info cơ bản
- Nhanh, ít lag

**3. Rainbow (Colorful)**
```fish
╭─ 🌈 ~/project main ✓ 🐍 3.12.0 📦 v20.10.0 ⏱ 2s
╰─❯
```
- Nhiều màu sắc
- Hiển thị nhiều info nhất
- Đẹp nhưng hơi busy

**4. Classic (Traditional)**
```fish
user@hostname ~/project main ✓
❯
```
- Giống bash/zsh traditional
- Hiển thị hostname
- 2 dòng

### ⚙️ Configuration

**Chạy interactive config:**
```bash
tide configure
```

**Sẽ hỏi:**
1. **Style?** → Chọn Modern
2. **Prompt Colors?** → True color (16 million colors)
3. **Show time?** → Yes (hiển thị thời gian command chạy)
4. **Prompt Spacing?** → Compact
5. **Icons?** → Many icons
6. **Transient Prompt?** → No (giữ history đầy đủ)

**Manual config (nếu muốn):**
```bash
# Set style
set -U tide_left_prompt_items pwd git
set -U tide_right_prompt_items status cmd_duration context jobs node python rustc java php

# Set colors
set -U tide_git_color_branch 5FD700
set -U tide_pwd_color_dirs 00AFFF

# Reload
tide reload
```

### 🎯 What Tide Shows

#### **Git Status Icons:**
- `✓` - Clean (no changes)
- `*` - Dirty (có changes)
- `+` - Staged changes
- `?` - Untracked files
- `↑2` - Ahead 2 commits
- `↓3` - Behind 3 commits

#### **Python Version:**
```fish
╭─ ~/project 🐍 3.12.0
# Tự động detect từ pyenv
```

#### **Node Version:**
```fish
╭─ ~/project 📦 v20.10.0
# Tự động detect từ fnm
```

#### **Command Duration:**
```fish
╭─ ~/project ⏱ 2s
# Hiển thị nếu command chạy > 5s
```

### 💡 Tips

**1. Tắt/Bật items:**
```bash
# Tắt Python version
set -U tide_python_display off

# Bật lại
set -U tide_python_display on

# Reload
tide reload
```

**2. Custom colors:**
```bash
# List tất cả colors
tide configure --list

# Change git branch color
set -U tide_git_color_branch FF0000  # Red

# Reload
tide reload
```

**3. Transient prompt (cho clean history):**
```bash
set -U tide_transient_enabled true
# → Previous commands show minimal prompt
```

### 📚 Resources

- GitHub: https://github.com/IlanCosman/tide
- Wiki: https://github.com/IlanCosman/tide/wiki
- Configuration: `tide configure`

---

## 2. fzf.fish - Fuzzy Search

**Search mọi thứ siêu nhanh với fuzzy matching**

### 🎯 Keyboard Shortcuts

| Shortcut | Function | Description |
|----------|----------|-------------|
| **Ctrl+R** | Search History | Search command history |
| **Ctrl+Alt+F** | Search Files | Search & preview files |
| **Ctrl+Alt+L** | Search Git Log | Browse git commits |
| **Ctrl+Alt+S** | Search Git Status | Browse changed files |
| **Ctrl+Alt+P** | Search Processes | Search & kill processes |
| **Ctrl+Alt+V** | Variables | Search environment variables |

### 🔍 1. Search Command History (Ctrl+R)

**Cách dùng:**
```fish
# Nhấn Ctrl+R
❯ [HISTORY SEARCH]
  docker compose up -d
  docker ps -a
  docker logs nginx
  git commit -m "Update"
  npm install

# Gõ "docker" để filter
❯ docker___
  docker compose up -d
  docker ps -a
  docker logs nginx

# Arrow keys để chọn, Enter để chạy
```

**Fuzzy matching:**
```fish
# Gõ: "gti cmt" → Tìm "git commit"
# Gõ: "dkr ps" → Tìm "docker ps"
# Gõ: "npm i" → Tìm "npm install"
```

**Tips:**
- Gõ một phần command, không cần chính xác
- Space để match nhiều từ (gti cmt → git commit)
- Ctrl+C để cancel

### 📁 2. Search Files (Ctrl+Alt+F)

**Cách dùng:**
```fish
# Nhấn Ctrl+Alt+F
❯ [FILE SEARCH]
  ./src/index.ts
  ./src/components/Header.tsx
  ./package.json
  ./README.md

# Gõ "config" để filter
❯ config___
  ./config.yaml
  ./tsconfig.json
  ./.config/fish/config.fish

# Enter để insert filename vào command line
```

**With preview:**
```fish
# Preview file content khi chọn
❯ [FILE SEARCH]
  > ./src/index.ts     [PREVIEW]
                      import express from 'express'
                      const app = express()
                      app.listen(3000)
```

**Tips:**
- Gõ path fragment: "src comp" → src/components
- Preview tự động với syntax highlighting
- Enter: Insert path vào cursor
- Ctrl+C: Cancel

### 📝 3. Search Git Log (Ctrl+Alt+L)

**Cách dùng:**
```fish
# Nhấn Ctrl+Alt+L (trong Git repo)
❯ [GIT LOG SEARCH]
  abc123 - Fix bug in authentication (2 days ago)
  def456 - Add user profile page (3 days ago)
  789ghi - Update dependencies (1 week ago)

# Gõ "fix" để filter commits
❯ fix___
  abc123 - Fix bug in authentication
  xyz999 - Fix typo in README

# Enter để insert commit hash
```

**Tips:**
- Search trong commit messages
- Preview commit diff
- Useful cho `git revert`, `git cherry-pick`

### 📊 4. Search Git Status (Ctrl+Alt+S)

**Cách dùng:**
```fish
# Nhấn Ctrl+Alt+S (trong Git repo có changes)
❯ [GIT STATUS SEARCH]
  M src/index.ts
  M src/components/Header.tsx
  ?? new-file.ts

# Chọn files để stage/diff
```

**Use cases:**
- Quick `git add` specific files
- Review changes trước khi commit
- Staged/unstaged files

### ⚡ 5. Search Processes (Ctrl+Alt+P)

**Cách dùng:**
```fish
# Nhấn Ctrl+Alt+P
❯ [PROCESS SEARCH]
  1234 node    server.js
  5678 python  app.py
  9012 docker  daemon

# Gõ "node" để filter
❯ node___
  1234 node server.js
  3456 node worker.js

# Enter để kill process
```

**Tips:**
- Quick kill stuck processes
- Preview process details
- Alternative to `ps aux | grep`

### 🎨 Customization

**Change fzf colors:**
```bash
# Add to ~/.config/fish/config.fish
set -gx FZF_DEFAULT_OPTS '--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9'
```

**Change preview window:**
```bash
# Larger preview
set -gx FZF_DEFAULT_OPTS '--preview-window=right:60%'

# Bottom preview
set -gx FZF_DEFAULT_OPTS '--preview-window=down:50%'
```

### 💡 Pro Tips

**1. Use with other commands:**
```fish
# Edit file from search
vim (fzf)

# Cat file from search
cat (fzf)

# Git add specific files
git add (git status -s | fzf -m | awk '{print $2}')
```

**2. Custom keybindings:**
```fish
# Add to ~/.config/fish/config.fish
bind \cg 'git status -s | fzf'  # Ctrl+G for git status
```

**3. Search with preview:**
```fish
# Preview file content
fzf --preview 'cat {}'

# Preview with syntax highlighting (if bat installed)
fzf --preview 'bat --color=always {}'
```

### 📚 Resources

- GitHub: https://github.com/PatrickF1/fzf.fish
- fzf official: https://github.com/junegunn/fzf

---

## 3. zoxide - Smart Directory Jump

**Jump to directories bằng "memory", không cần gõ full path**

### 🚀 Basic Usage

**Cách hoạt động:**
- zoxide **học từ history** của bạn
- Track folders bạn hay `cd` vào
- Tạo "frecency" database (frequency + recency)
- Jump bằng keyword, không cần full path

### 📍 Commands

| Command | Description | Example |
|---------|-------------|---------|
| `z <keyword>` | Jump to directory | `z project` |
| `zi` | Interactive mode | `zi` (shows list) |
| `z -` | Jump to previous dir | `z -` |
| `zoxide query <keyword>` | Show match | `zoxide query work` |
| `zoxide query -l` | List all tracked dirs | `zoxide query -l` |

### 🎯 Usage Examples

**Example 1: Basic jump**
```fish
# Bạn thường cd vào:
cd ~/work/projects/smart-tab-platform/stab-portal-api

# Sau vài lần, zoxide học được
# Giờ chỉ cần:
z portal
# → Instant jump to stab-portal-api

# Hoặc:
z stab
# → Jump to smart-tab-platform

# Hoặc:
z api
# → Jump to stab-portal-api
```

**Example 2: Fuzzy matching**
```fish
# Muốn vào: ~/Documents/Projects/Backend
z doc proj back
# → Match "Documents/Projects/Backend"

# Hoặc ngắn hơn:
z dpb
# → Match by first letters
```

**Example 3: Multiple matches**
```fish
# Có nhiều folders match "project"
z project
# → Jump to folder hay vào nhất (highest score)

# Xem tất cả matches:
zoxide query -l project
  /Users/you/work/project-1
  /Users/you/personal/project-2
  /Users/you/Documents/projects
```

**Example 4: Interactive mode**
```fish
# Không chắc tên folder
zi
# → Show list với fzf:
  ~/work/smart-tab-platform
  ~/Documents/work
  ~/Downloads
  ~/projects/backend

# Gõ để filter, arrow keys chọn, Enter
```

**Example 5: Jump back**
```fish
# Đang ở ~/work/project
z doc
# → Jump to ~/Documents

# Quay lại:
z -
# → Back to ~/work/project
```

### ⚙️ Configuration

**Setup trong Fish config (đã có sẵn):**
```fish
# ~/.config/fish/config.fish
if command -v zoxide > /dev/null
    zoxide init fish | source
end

# Optional: Alias cd to z
alias cd='z'
```

**Custom options:**
```fish
# Strict matching (không fuzzy)
zoxide init fish --strict | source

# Custom data directory
set -gx _ZO_DATA_DIR ~/.local/share/zoxide

# Resolve symlinks
zoxide init fish --resolve-symlinks | source
```

### 📊 Understanding Scores

**Xem scores của directories:**
```fish
zoxide query -l -s
  12000 /Users/you/work/smart-tab-platform
  8500  /Users/you/Documents
  3200  /Users/you/Downloads
  1500  /Users/you/Desktop
```

**Score based on:**
- **Frequency** - Bao nhiêu lần cd vào
- **Recency** - Lần cuối cd khi nào
- **Frecency** = Frequency × Recency decay

**Ví dụ:**
```fish
# Folder A: cd 100 lần, last access 1 tháng trước
# Folder B: cd 50 lần, last access hôm qua
# → Folder B có score cao hơn (recent!)
```

### 💡 Pro Tips

**1. Train zoxide:**
```fish
# Những ngày đầu, cd bình thường
cd ~/work/smart-tab-platform/stab-portal-api
cd ~/work/smart-tab-platform/stab-payment-api
cd ~/Documents/work

# Sau 1 tuần, zoxide học được patterns:
z stab port    → stab-portal-api
z stab pay     → stab-payment-api
z doc work     → Documents/work
```

**2. Remove entries:**
```fish
# Remove specific directory
zoxide remove ~/old-project

# Remove by path pattern
zoxide remove /tmp
```

**3. Import from z/autojump:**
```fish
# Nếu dùng z hoặc autojump trước đó
zoxide import --from z ~/.z
zoxide import --from autojump ~/Library/autojump/autojump.txt
```

**4. Use with fzf:**
```fish
# Interactive jump với preview
zi  # Already uses fzf!

# Custom preview
zi --preview 'ls -la {}'
```

### 🔧 Maintenance

**Clean old entries:**
```fish
# Remove entries not accessed >90 days
zoxide remove --older-than 90d

# Clean all
rm -rf ~/.local/share/zoxide
```

**View database:**
```fish
# SQLite database location
cat ~/.local/share/zoxide/db.zo

# Query with zoxide
zoxide query -l
zoxide query -l -s  # with scores
```

### 📚 Resources

- GitHub: https://github.com/ajeetdsouza/zoxide
- Comparison with z: https://github.com/ajeetdsouza/zoxide/wiki/Comparison

---

## 4. done - Command Notifications

**Nhận macOS notification khi long-running commands xong**

### 🔔 Features

**Tự động notification khi:**
- Command chạy > 5 seconds (configurable)
- Terminal window **không focus**
- Command success hoặc fail

**Notification shows:**
- Command name
- Duration
- Exit code (success/fail)
- Terminal title

### 🎯 Usage

**Không cần làm gì, tự động work!**

**Example scenarios:**

**1. Long install:**
```fish
❯ npm install
# → Mất 5 phút
# → Cmd+Tab sang Chrome làm việc
# → 5 phút sau: Notification "npm install finished in 5m 23s"
```

**2. Long build:**
```fish
❯ cargo build --release
# → Mất 10 phút
# → Cmd+Tab sang VS Code code tiếp
# → 10 phút sau: Notification "cargo build finished"
```

**3. Failed command:**
```fish
❯ pytest
# → Có test fail
# → Switch qua browser
# → Notification: "pytest failed after 2m 15s ❌"
```

**4. Database operations:**
```fish
❯ pg_dump -h prod mydb > backup.sql
# → Large DB, mất 15 phút
# → Làm việc khác
# → Notification khi xong!
```

### ⚙️ Configuration

**Customize timeout (default: 5s):**
```fish
# Add to ~/.config/fish/config.fish

# Only notify if command > 10 seconds
set -U __done_min_cmd_duration 10000  # milliseconds

# Only notify if command > 1 minute
set -U __done_min_cmd_duration 60000
```

**Exclude commands:**
```fish
# Don't notify for specific commands
set -U __done_exclude 'git (?!push|pull|fetch)'
# → Only notify for git push/pull/fetch

# Don't notify for vim
set -U __done_exclude 'vim|nvim|nano'
```

**Custom notification sound:**
```fish
# Use different sound
set -U __done_notification_sound "Submarine"

# Available sounds on macOS:
# Basso, Blow, Bottle, Frog, Funk, Glass, Hero, Morse,
# Ping, Pop, Purr, Sosumi, Submarine, Tink
```

**Only notify on failure:**
```fish
set -U __done_notify_error_only true
# → Only show notification if command failed
```

### 🎨 Advanced Configuration

**Custom notification command:**
```fish
# Use terminal-notifier for more features
brew install terminal-notifier

# Custom function
function __done_notification
    terminal-notifier \
        -title "Command Finished" \
        -message "$argv[1]" \
        -sound Submarine \
        -sender com.apple.Terminal
end
```

**Integration with other tools:**
```fish
# Send to Slack
function __done_notification
    curl -X POST $SLACK_WEBHOOK \
        -d "{'text': 'Command finished: $argv[1]'}"
end

# Log to file
function __done_notification
    echo (date) "$argv[1]" >> ~/command-log.txt
end
```

### 💡 Pro Tips

**1. Combine với long tasks:**
```fish
# Run multiple long commands
npm install && npm run build && npm test
# → Notification khi TẤT CẢ xong
```

**2. Background jobs:**
```fish
# Run in background
docker compose up -d
# → Notification khi container ready
```

**3. Use với watch:**
```fish
# Monitor file changes
watchexec --exts rs cargo test
# → Notification mỗi khi tests chạy xong
```

**4. Remote commands:**
```fish
# SSH to server
ssh server 'long-running-script.sh'
# → Notification khi script xong trên server
```

### 🔕 Disable Temporarily

**Disable for one session:**
```fish
set __done_enabled 0
# Run commands...
set __done_enabled 1
```

**Disable for specific command:**
```fish
# Just prefix with space (not in history)
 npm install
# → Space ở đầu = không notify
```

### 📚 Resources

- GitHub: https://github.com/franciscolourenco/done

---

## Tips & Tricks

### 🚀 Combining Plugins

**1. fzf + zoxide:**
```fish
# Interactive jump với preview
zi

# Custom: Jump + open in VS Code
function zc
    set dir (zoxide query -l | fzf)
    and cd $dir
    and code .
end
```

**2. fzf + git:**
```fish
# Interactive git checkout
function gco
    git branch -a | fzf | xargs git checkout
end

# Interactive git diff
function gd
    git status -s | fzf --preview 'git diff --color=always {2}' | awk '{print $2}' | xargs git diff
end
```

**3. Tide + zoxide:**
```fish
# Tide automatically shows you're in a git repo
# zoxide remembers your repos
# → Quick jump to repos with z, see status with Tide
```

**4. All together:**
```fish
# Search command history (fzf) →
# Jump to that directory (zoxide) →
# See git status (Tide) →
# Long operation? Get notified (done)!
```

### ⌨️ Custom Key Bindings

**Create shortcuts:**
```fish
# Add to ~/.config/fish/config.fish

# Ctrl+O: Open file in VS Code
bind \co 'code (fzf)'

# Ctrl+G: Git status with fzf
bind \cg 'git status -s | fzf'

# Ctrl+D: Jump to directory
bind \cd 'zi'
```

### 🎨 Theme Customization

**Matching colors:**
```fish
# Tide colors
set -U tide_git_color_branch 5FD700

# fzf colors (match Tide)
set -gx FZF_DEFAULT_OPTS '--color=fg:#f8f8f2,bg:#282a36,hl:#5FD700'
```

### 📊 Performance Tips

**1. Fast startup:**
```fish
# Load plugins conditionally
if status is-interactive
    # Only load in interactive shells
    zoxide init fish | source
end
```

**2. Lazy loading:**
```fish
# Only init when first used
function z --wraps z --description 'zoxide'
    zoxide init fish | source
    functions -e z
    z $argv
end
```

**3. Exclude large directories:**
```fish
# Don't track /tmp, node_modules
set -U __zoxide_exclude '^/tmp|node_modules'
```

---

## Troubleshooting

### 🐛 Common Issues

**1. Ctrl+R không work:**
```fish
# Check fzf installed
which fzf

# Re-init fzf
fzf --fish | source

# Check bindings
bind | grep fzf
```

**2. zoxide không nhớ directories:**
```fish
# Check database
zoxide query -l

# Re-init zoxide
zoxide init fish | source

# Check if cd is aliased
alias | grep cd
```

**3. Tide không hiển thị Python/Node version:**
```fish
# Check pyenv/fnm installed
which pyenv
which fnm

# Re-init
pyenv init - | source
fnm env | source

# Reload Tide
tide reload
```

**4. done không notification:**
```fish
# Check min duration
echo $__done_min_cmd_duration

# Test notification
sleep 10  # Switch windows
# → Should notify

# Check macOS notification settings
# System Preferences → Notifications → Terminal
```

### 🔧 Reset Configuration

**Reset Tide:**
```fish
tide configure
# Choose "Reset to default"
```

**Reset fzf:**
```fish
set -e FZF_DEFAULT_OPTS
fzf --fish | source
```

**Reset zoxide:**
```fish
# Clear database
rm -rf ~/.local/share/zoxide

# Re-init
zoxide init fish | source
```

**Reset done:**
```fish
# Unset all done variables
set -e __done_min_cmd_duration
set -e __done_exclude
set -e __done_notification_sound
```

### 📝 Check Installation

**Verify all plugins installed:**
```fish
# List Fisher plugins
fisher list

# Should show:
# IlanCosman/tide@v6
# PatrickF1/fzf.fish
# franciscolourenco/done

# Check tools
which fzf
which zoxide
```

**Re-install plugins:**
```fish
# Remove all
fisher remove IlanCosman/tide PatrickF1/fzf.fish franciscolourenco/done

# Re-install
fisher install IlanCosman/tide@v6
fisher install PatrickF1/fzf.fish
fisher install franciscolourenco/done
```

---

## Resources

### 📚 Documentation

- **Tide**: https://github.com/IlanCosman/tide/wiki
- **fzf**: https://github.com/junegunn/fzf#usage
- **fzf.fish**: https://github.com/PatrickF1/fzf.fish
- **zoxide**: https://github.com/ajeetdsouza/zoxide#getting-started
- **done**: https://github.com/franciscolourenco/done

### 🎥 Videos & Tutorials

- Tide configuration: https://asciinema.org/a/KIBfUy6qvQSPpfRpRaZVWFQ9t
- fzf tips: https://www.youtube.com/watch?v=qgG5Jhi_Els
- Fish shell intro: https://www.youtube.com/watch?v=C2PzY6FWX4o

### 💬 Community

- Fish Gitter: https://gitter.im/fish-shell/fish-shell
- r/fishshell: https://reddit.com/r/fishshell
- Stack Overflow: Tag `fish`

---

## Keyboard Shortcuts Cheat Sheet

### Essential Shortcuts

```
# Fish Built-in
Ctrl+C          Cancel current command
Ctrl+D          Exit shell
Ctrl+L          Clear screen
Ctrl+U          Clear line before cursor
Ctrl+K          Clear line after cursor
Ctrl+W          Delete word before cursor
Ctrl+A          Move to start of line
Ctrl+E          Move to end of line

# fzf.fish
Ctrl+R          Search command history
Ctrl+Alt+F      Search files
Ctrl+Alt+L      Search git log
Ctrl+Alt+S      Search git status
Ctrl+Alt+P      Search processes
Ctrl+Alt+V      Search variables

# Tide
tide configure  Configure prompt style
tide reload     Reload configuration

# zoxide
z <keyword>     Jump to directory
zi              Interactive jump
z -             Jump to previous directory

# done
(automatic)     Notifications for long commands
```

---

**🎉 Happy hacking with Fish shell!**

**Questions?** Check the troubleshooting section or individual plugin documentation.
