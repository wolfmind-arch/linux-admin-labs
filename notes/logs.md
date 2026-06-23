# Linux Log Analysis Notes

## Overview

Logs are records of events that happen on a Linux system.

System administrators use logs to:

* Troubleshoot problems
* Monitor services
* Detect security issues
* Investigate failed logins
* Verify system activity

---

# systemd Journal

Most modern Linux distributions use systemd-journald.

View all logs:

```bash
journalctl
```

Show newest logs:

```bash
journalctl -r
```

---

# Viewing Recent Logs

Last 20 log entries:

```bash
journalctl -n 20
```

Last 50 log entries:

```bash
journalctl -n 50
```

---

# Live Log Monitoring

Follow logs in real time:

```bash
journalctl -f
```

Equivalent to:

```bash
tail -f
```

for journal logs.

---

# Service Logs

Show SSH service logs:

```bash
journalctl -u ssh
```

Last 20 SSH log entries:

```bash
journalctl -u ssh -n 20
```

Follow SSH logs live:

```bash
journalctl -u ssh -f
```

---

# Filtering Logs

Search for SSH entries:

```bash
journalctl | grep ssh
```

Search for errors:

```bash
journalctl | grep -i error
```

Search for warnings:

```bash
journalctl | grep -i warning
```

Search for failed login attempts:

```bash
journalctl | grep "Failed password"
```

---

# Log Time Filters

Logs since boot:

```bash
journalctl -b
```

Previous boot:

```bash
journalctl -b -1
```

Logs from today:

```bash
journalctl --since today
```

Last hour:

```bash
journalctl --since "1 hour ago"
```

Specific date:

```bash
journalctl --since "2026-06-23 08:00:00"
```

---

# Common Investigation Commands

Check SSH activity:

```bash
journalctl -u ssh -n 20
```

Check failed logins:

```bash
journalctl | grep "Failed password"
```

Check sudo activity:

```bash
journalctl | grep sudo
```

Check system errors:

```bash
journalctl -p err
```

Check warnings and above:

```bash
journalctl -p warning
```

---

# Challenge 1

Display the last 50 log entries:

```bash
journalctl -n 50
```

---

# Challenge 2

Show only SSH-related logs:

```bash
journalctl -u ssh
```

or

```bash
journalctl | grep ssh
```

---

# Challenge 3

Watch logs live:

```bash
journalctl -f
```

In another terminal:

```bash
sudo systemctl restart ssh
```

Observe new log entries appearing in real time.

---

# Mini Admin Scenario

A user reports they cannot connect through SSH.

Steps:

1. Check recent SSH logs

```bash
journalctl -u ssh -n 20
```

2. Look for:

```text
Failed password
Connection closed
Authentication failure
```

3. Verify SSH service status

```bash
systemctl status ssh
```

4. Confirm SSH is running

```bash
systemctl is-active ssh
```

Expected result:

```text
active
```

---

# Useful Commands Summary

```bash
journalctl
journalctl -n 20
journalctl -f
journalctl -u ssh
journalctl -u ssh -n 20
journalctl -u ssh -f
journalctl -b
journalctl -b -1
journalctl -p err
grep
systemctl status ssh
systemctl is-active ssh
```

---

# What I Learned

* How to view logs with journalctl
* How to filter logs
* How to investigate SSH problems
* How to monitor logs in real time
* How to search for errors and failed logins
* How to perform basic log analysis tasks as a Linux administrator
