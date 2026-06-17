# Linux Commands

## Navigation

```bash
pwd
ls
ls -la
cd
```

## File Operations

```bash
touch file.txt
mkdir directory
cp source destination
mv oldname newname
rm file.txt
rm -r directory
```

## Viewing Files

```bash
cat file.txt
less file.txt
head file.txt
tail file.txt
```

## Searching

```bash
grep "text" file.txt
find /home -name "*.txt"
```

## Disk and Memory

```bash
df -h
du -sh directory
free -h
```

## Services

```bash
systemctl status ssh
systemctl start ssh
systemctl stop ssh
systemctl restart ssh
systemctl is-active ssh
```

## Logs

```bash
journalctl
journalctl -u ssh
```

## Permissions

```bash
chmod 644 file.txt
chmod 755 script.sh
chown user:user file.txt
```

## Network Information

```bash
ip a
hostname -I
ss -tuln
```
