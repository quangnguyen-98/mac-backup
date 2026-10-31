# 🔧 Configure Fish Shell in IDEs

After running `setup-fish.sh`, Fish is set as system default shell.
However, some IDEs need manual configuration.

---

## ✅ Already Configured

- **Terminal.app** - Uses system default → Fish ✅
- **iTerm2** - Uses system default → Fish ✅
- **VSCode** - Auto-configured by setup script → Fish ✅

---

## ⚙️ Need Manual Configuration

### 🔹 **JetBrains IDEs** (PyCharm, WebStorm, GoLand, DataGrip, IntelliJ IDEA)

**All JetBrains IDEs use the same steps:**

1. Open IDE
2. **⌘,** (Settings/Preferences)
3. Navigate to: **Tools → Terminal**
4. Change **Shell path** to:
   ```
   /opt/homebrew/bin/fish
   ```
5. Click **OK**
6. Restart IDE or close/reopen terminal panel

**Screenshot:**
```
Settings
  └─ Tools
       └─ Terminal
            └─ Shell path: [/opt/homebrew/bin/fish]
```

---

### 🔹 **Android Studio**

Same as JetBrains:

1. Open Android Studio
2. **⌘,** (Settings/Preferences)
3. **Tools → Terminal**
4. **Shell path**: `/opt/homebrew/bin/fish`
5. **OK**
6. Restart or reopen terminal panel

---

## 🎯 One-time Setup

You only need to configure each IDE **once**.

After configuration:
- New projects in that IDE will automatically use Fish
- Terminal panel will use Fish shell
- All PATH from Fish config will be available

---

## 🔍 Verify Fish in IDE

After configuring, open terminal in IDE and run:

```fish
echo $SHELL
# Should show: /opt/homebrew/bin/fish

# Test Fish features
cd <dir>         # zoxide smart jump
Ctrl+R           # fzf history search
python --version # Should show Python from pyenv
node --version   # Should show Node from fnm
```

---

## 📋 Quick Reference

| IDE | Settings Path | Shell Path |
|-----|--------------|------------|
| **PyCharm** | Tools → Terminal | `/opt/homebrew/bin/fish` |
| **WebStorm** | Tools → Terminal | `/opt/homebrew/bin/fish` |
| **GoLand** | Tools → Terminal | `/opt/homebrew/bin/fish` |
| **DataGrip** | Tools → Terminal | `/opt/homebrew/bin/fish` |
| **IntelliJ IDEA** | Tools → Terminal | `/opt/homebrew/bin/fish` |
| **Android Studio** | Tools → Terminal | `/opt/homebrew/bin/fish` |
| **VSCode** | Auto-configured | ✅ Done |

---

## 💡 Tips

- **Tide prompt** will show in all IDE terminals
- **fzf, zoxide** work in IDE terminals
- **Language versions** (Python, Node) show correctly
- If IDE doesn't have "Tools → Terminal", check:
  - **Preferences → Terminal** (older IDEs)
  - **Settings → Terminal** (some versions)

---

## ❓ Troubleshooting

**Q: IDE terminal still shows zsh/bash?**
- Check shell path is correct: `/opt/homebrew/bin/fish` (not `/usr/local/bin/fish`)
- Restart IDE completely (not just terminal panel)

**Q: Fish works but no Tide prompt?**
- Run in IDE terminal: `tide reload`
- Check font is set to "MesloLGS NF" in IDE terminal preferences

**Q: Can't find Terminal settings?**
- Use search in Settings: Type "terminal"
- Or: Preferences → Search → "shell path"

---

Done! 🎉
