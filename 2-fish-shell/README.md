# 🐟 Fish Shell Setup

**Bước 2 của 2** - Setup Fish shell với Tide prompt đẹp

---

## 🚀 Chạy ngay

```bash
./setup-fish.sh
```

⚠️ **Lưu ý**: Chạy script này **SAU KHI** đã chạy `1-app/setup.sh`

---

## ✨ Script sẽ làm gì?

### 1. Set Fish làm default shell
- Thêm Fish vào `/etc/shells`
- Đổi default shell sang Fish

### 2. Tạo config.fish với PATH setup
Tự động setup PATH cho:
- ✅ Homebrew
- ✅ Python (pyenv + virtualenv)
- ✅ Node.js (fnm với auto-switch khi cd)
- ✅ PostgreSQL client (libpq)
- ✅ Direnv
- ✅ fzf (fuzzy finder)
- ✅ zoxide (smart cd)

### 3. Cài Fisher plugin manager
Plugin manager cho Fish shell

### 4. Cài Tide prompt
Tide prompt sẽ được cài đặt, bạn sẽ configure style với `tide configure` sau khi restart Terminal.

**Ví dụ (Rainbow style)** - Colorful, info-rich với icons:
```
╭─  ~/projects/app  main ⇡1  🐍 3.12.0  ⬢ 20.0.0  5s ─╮
╰─ ❯                                                     ─╯
```

Có thể hiển thị:
- 📁 Directory (smart truncation)
- 🌿 Git branch & status
- 🐍 Python version
- ⬢ Node.js version
- ⏱️ Command duration
- ✔️ Exit status

### 5. Cài Fish plugins hữu ích
- **fzf.fish** - Fuzzy search
  - `Ctrl+R`: Search history
  - `Ctrl+Alt+F`: Find files
- **done** - Notifications cho long commands

### 6. Setup terminal fonts
- ✅ Tự động cài MesloLGS Nerd Font (nếu chưa có)
- ✅ Tự động config VSCode terminal font
- ⚠️ Cần config thủ công cho iTerm2/Terminal.app/JetBrains IDEs

---

## 🎨 Sau khi chạy xong

### 1. Set font trong Terminal app của bạn

**iTerm2:**
```
Preferences (Cmd+,) → Profiles → Text → Font
Chọn: MesloLGS Nerd Font Mono, Size: 13
```

**Terminal.app:**
```
Preferences (Cmd+,) → Profiles → Font → Change
Chọn: MesloLGS Nerd Font Mono, Size: 13
```

**JetBrains IDEs (PyCharm, WebStorm, etc.):**
```
Settings (Cmd+,) → Editor → Color Scheme → Console Font
✅ Use console font instead of the default
Font: MesloLGS Nerd Font Mono, Size: 13
```

**VSCode:**
```
✅ Đã được config tự động!
```

### 2. Restart Terminal
```bash
exec fish
```

### 3. Configure Tide prompt
```fish
tide configure
```
Chọn style bạn thích (Rainbow recommended)

### 4. Enjoy! 🎉

---

## 🎨 Configure Tide prompt

Sau khi restart Terminal, chạy lệnh sau để chọn style:

```fish
tide configure
```

Chọn 1 trong 3 styles:
1. **Lean** - Minimalist 1 dòng
2. **Classic** - Classic 2 dòng
3. **Rainbow** - Colorful 2 dòng ⭐ Recommended

---

## 💡 Tips & Tricks

### Smart directory jump (zoxide)
```fish
z project          # Jump to most-used directory matching "project"
z doc download     # Jump to ~/Documents/Downloads
```

### Fuzzy search
```fish
Ctrl+R             # Search command history
Ctrl+Alt+F         # Search files
```

### Reload config
```fish
source ~/.config/fish/config.fish
```

### List installed plugins
```fish
fisher list
```

---

## 📝 Files tạo ra

- `~/.config/fish/config.fish` - Fish configuration
- `~/.config/fish/functions/` - Fisher & Tide functions
- Universal variables cho Tide settings

---

## ❓ Troubleshooting

**Icons không hiển thị? (Thấy dấu · hoặc ?)**
→ Terminal chưa dùng Nerd Font
→ Check: `ls ~/Library/Fonts/ | grep Meslo`
→ Nếu có font → Config font trong Terminal (xem hướng dẫn ở trên)
→ Nếu chưa có → Chạy: `brew install --cask font-meslo-lg-nerd-font`

**fnm không hoạt động?**
→ Chạy: `source ~/.config/fish/config.fish`

**Muốn đổi style khác?**
→ Chạy: `tide configure`

**Fish chưa phải default shell?**
→ Restart Terminal hoặc chạy: `exec fish`

**VSCode terminal font không áp dụng?**
→ Check `~/Library/Application Support/Code/User/settings.json`
→ Phải có: `"terminal.integrated.fontFamily": "MesloLGS Nerd Font Mono"`

---

Quay lại [SETUP-GUIDE.md](../SETUP-GUIDE.md) để xem hướng dẫn đầy đủ.
