# Case 002 – Windows Cannot Access Samba Share

## Overview

A Samba share was successfully configured on a Debian server, but Windows 10 could not access the shared folder.

---

## Environment

* Debian Server
* Samba
* Windows 10
* Local network

---

## Problem

The shared folder was configured, but Windows returned an authentication error when trying to connect.

Symptoms included:

* Access denied
* Windows repeatedly asked for credentials
* Existing credentials did not work

---

## Investigation

### Verify Samba service

```bash
systemctl status smbd
```

---

### Verify Samba configuration

```bash
testparm
```

---

### Verify shared directory

```bash
ls -ld /srv/samba/shared
```

---

### Check Samba users

```bash
pdbedit -L
```

---

### Verify firewall

Confirmed that SMB ports were accessible.

---

### Windows investigation

Opened:

Credential Manager

Found cached credentials for the Samba server.

---

## Root Cause

Windows was using previously saved credentials that no longer matched the Samba configuration.

Even after entering the correct username and password, Windows continued sending the old credentials automatically.

---

## Resolution

Removed the saved Windows credentials.

Created a Samba user:

```bash
sudo smbpasswd -a <username>
```

Connected again using the new credentials.

---

## Result

* Windows connected successfully.
* Shared folder became accessible.
* Authentication succeeded.

---

## Lessons Learned

* Windows caches SMB credentials.
* Always verify Samba users separately from Linux users.
* Test the Samba configuration with `testparm`.
* Check directory permissions before modifying Samba configuration.

---

## Useful Commands

```bash
systemctl status smbd

testparm

pdbedit -L

smbpasswd -a <username>

ls -ld /srv/samba/shared
```

---

## Skills Practiced

* Samba administration
* Windows troubleshooting
* SMB authentication
* Linux permissions
* Service verification
