# Samba File Sharing Lab

**Date:** 2026-06-21

## Objective

Configure a Samba file share on Ubuntu Server and access it from Windows.

---

# Install Samba

Update packages and install Samba:

```bash
sudo apt update
sudo apt install samba
```

Verify installation:

```bash
systemctl status smbd
```

---

# Create Shared Directory

Create a directory for sharing:

```bash
sudo mkdir -p /srv/samba/shared
```

Set permissions for testing:

```bash
sudo chmod 777 /srv/samba/shared
```

Check permissions:

```bash
ls -ld /srv /srv/samba /srv/samba/shared
```

Example output:

```text
drwxr-xr-x /srv
drwxr-xr-x /srv/samba
drwxrwxrwx /srv/samba/shared
```

---

# Configure Samba Share

Edit configuration:

```bash
sudo nano /etc/samba/smb.conf
```

Add share definition:

```ini
[Shared]
path = /srv/samba/shared
browseable = yes
read only = no
```

---

# Guest Access Test

Attempted guest access configuration:

```ini
[Shared]
path = /srv/samba/shared
browseable = yes
guest ok = yes
guest only = yes
read only = no
force user = nobody
```

Result:

* Samba configuration was correct.
* Windows 10 allowed guest access.
* Windows 11 requested credentials due to security restrictions.

---

# Validate Configuration

Check Samba configuration:

```bash
testparm
```

Important settings:

```ini
workgroup = WORKGROUP
map to guest = bad user
```

---

# Verify Available Shares

List Samba shares locally:

```bash
sudo smbclient -L localhost -N
```

Output included:

```text
Shared
IPC$
print$
```

This confirmed that Samba was working correctly.

---

# Create Samba User

Create Linux user:

```bash
sudo adduser trainee
```

Create Samba password:

```bash
sudo smbpasswd -a trainee
```

Enable user:

```bash
sudo smbpasswd -e trainee
```

---

# Secure Share Configuration

Update share configuration:

```ini
[Shared]
path = /srv/samba/shared
browseable = yes
read only = no
valid users = trainee
```

Restart Samba:

```bash
sudo systemctl restart smbd
```

---

# Connect from Windows

Open:

```text
\\IP_ADDRESS\Shared
```

Login using:

```text
Username: trainee
Password: Samba password
```

Result:

* Connection successful.
* Windows authenticated correctly.
* Share accessible from Windows.

---

# Useful Commands

Restart Samba:

```bash
sudo systemctl restart smbd
```

Check service:

```bash
systemctl status smbd
```

Check configuration:

```bash
testparm
```

List Samba users:

```bash
sudo pdbedit -L
```

List shares:

```bash
sudo smbclient -L localhost -N
```

---

# Lessons Learned

1. Samba does not interpret `~` in paths.
2. Use absolute paths such as:

```text
/srv/samba/shared
```

3. Always validate configuration with:

```bash
testparm
```

4. Verify shares with:

```bash
sudo smbclient -L localhost -N
```

5. Modern Windows versions may block guest access.
6. Authentication with Samba users is preferred in production environments.
7. Troubleshooting is a core Linux administration skill.
