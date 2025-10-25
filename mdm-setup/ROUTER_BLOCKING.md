# Router-Level MDM Blocking

**Extra layer of protection by blocking MDM servers at network level.**

---

## Why Router Blocking?

**Advantages:**
- ✅ Works for ALL devices on network
- ✅ Cannot be bypassed by host file changes
- ✅ Applies before macOS boots
- ✅ No need to modify each Mac

**Use cases:**
- Multiple Macs need bypass
- Extra security layer
- Prevent accidental re-enrollment

---

## Method 1: DNS Blocking (Easiest)

### Router DNS Settings

Most routers support custom DNS entries.

**Steps:**
1. Login to router (usually http://192.168.1.1)
2. Find DNS settings
3. Add custom DNS entries:
   - `deviceenrollment.apple.com` → `0.0.0.0`
   - `mdmenrollment.apple.com` → `0.0.0.0`
   - `iprofiles.apple.com` → `0.0.0.0`

**Example routers:**
- **TP-Link:** Advanced → Network → DHCP Server → Custom DNS
- **Netgear:** Advanced → Setup → DNS Server
- **Asus:** LAN → DHCP Server → DNS Server

---

## Method 2: Pi-hole (Advanced)

**Pi-hole** is a network-wide ad blocker that can also block MDM.

### Setup Pi-hole:

```bash
# On Raspberry Pi or any Linux machine
curl -sSL https://install.pi-hole.net | bash
```

### Configure Router:
1. Set Pi-hole IP as DNS server
2. All devices will use Pi-hole for DNS

### Add MDM Blacklist:

```bash
# SSH to Pi-hole
pihole -b deviceenrollment.apple.com
pihole -b mdmenrollment.apple.com
pihole -b iprofiles.apple.com
pihole -b albert.apple.com
pihole -b identity.apple.com
```

**Web UI:**
- http://pi.hole/admin
- Blacklist → Add domains

---

## Method 3: Router Firewall Rules

**Most advanced - block at firewall level.**

### Example (pfSense/OPNsense):

1. Firewall → Aliases
2. Create URL Table Alias:
   - Name: `MDM_Servers`
   - Type: `Host(s)`
   - Hosts:
     ```
     deviceenrollment.apple.com
     mdmenrollment.apple.com
     iprofiles.apple.com
     ```

3. Firewall → Rules → LAN
4. Add block rule:
   - Action: Block
   - Destination: MDM_Servers
   - Description: Block Apple MDM

---

## Method 4: Unifi (Ubiquiti)

**For Unifi networks:**

### Via Controller:

1. Settings → Security → Traffic & Security
2. Create Firewall Group:
   - Name: `MDM_Block`
   - Type: `Domain`
   - Domains:
     ```
     deviceenrollment.apple.com
     mdmenrollment.apple.com
     iprofiles.apple.com
     ```

3. Create Firewall Rule:
   - Type: LAN Out
   - Action: Drop
   - Destination: MDM_Block

---

## Method 5: Hosts File on Router (DD-WRT/OpenWrt)

**For DD-WRT or OpenWrt routers:**

### DD-WRT:

```bash
# Administration → Commands
# Run:

echo "0.0.0.0 deviceenrollment.apple.com" >> /tmp/hosts
echo "0.0.0.0 mdmenrollment.apple.com" >> /tmp/hosts
echo "0.0.0.0 iprofiles.apple.com" >> /tmp/hosts

# Save as Startup script
```

### OpenWrt:

```bash
# SSH to router
vi /etc/hosts

# Add:
0.0.0.0 deviceenrollment.apple.com
0.0.0.0 mdmenrollment.apple.com
0.0.0.0 iprofiles.apple.com

# Restart dnsmasq
/etc/init.d/dnsmasq restart
```

---

## Testing

### Verify blocking works:

```bash
# From Mac or any device on network
ping deviceenrollment.apple.com
# Should fail or return 0.0.0.0

nslookup deviceenrollment.apple.com
# Should return 0.0.0.0 or NXDOMAIN
```

### Check DNS resolution:

```bash
dig deviceenrollment.apple.com
# Should show blocked IP or no answer
```

---

## Complete MDM Domains List

**Core (must block):**
```
deviceenrollment.apple.com
mdmenrollment.apple.com
iprofiles.apple.com
```

**Additional (optional):**
```
albert.apple.com
identity.apple.com
acmdm.apple.com
ppq.apple.com
axm-adm-enroll.apple.com
axm-adm-mdm.apple.com
gdmf.apple.com
deviceservices-external.apple.com
```

**ABM/ASM (Apple Business/School Manager):**
```
business.apple.com
school.apple.com
```

---

## Router Recommendations

**Best routers for custom DNS/blocking:**

1. **Ubiquiti Unifi** - Professional, great UI
2. **pfSense/OPNsense** - Open-source firewall
3. **Asus (Merlin firmware)** - Consumer with advanced features
4. **TP-Link (OpenWrt)** - Cheap + flashable
5. **Netgear (DD-WRT)** - Many models supported

---

## Troubleshooting

### Blocking not working?

**Check:**
1. Router DNS is actually being used
   ```bash
   scutil --dns  # macOS
   cat /etc/resolv.conf  # Linux
   ```

2. Mac not using custom DNS
   ```bash
   networksetup -getdnsservers Wi-Fi
   # Should show router IP
   ```

3. Flush DNS cache
   ```bash
   sudo dscacheutil -flushcache
   sudo killall -HUP mDNSResponder
   ```

### macOS bypassing router DNS?

Apple devices có thể dùng DNS-over-HTTPS (DoH), bypass router DNS.

**Disable on macOS:**
```bash
# Disable iCloud Private Relay
System Settings → Apple ID → iCloud → Private Relay → Off

# Check DNS
scutil --dns
```

---

## Security Notes

**Router blocking is NOT foolproof:**
- ⚠️ macOS can use DoH/DoT to bypass
- ⚠️ Apple có thể dùng IP addresses thay vì domains
- ⚠️ Firmware updates có thể reset rules

**Best practice:**
- ✅ Use router blocking + hosts file
- ✅ Multiple layers of protection
- ✅ Regularly check for re-enrollment

---

## Maintenance

### Monthly checks:

```bash
# 1. Verify domains still blocked
ping deviceenrollment.apple.com

# 2. Check for new MDM domains
# (Google "apple mdm domains 2025")

# 3. Update router blacklist if needed
```

---

## References

- Pi-hole: https://pi-hole.net
- pfSense: https://www.pfsense.org
- Unifi: https://ui.com
- OpenWrt: https://openwrt.org
- DD-WRT: https://dd-wrt.com

---

**⚠️ Remember: Router blocking is an extra layer. Still use hosts file for redundancy!**
