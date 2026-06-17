# Users and Groups

## Create User

```bash
sudo useradd anna
```

## Set Password

```bash
sudo passwd anna
```

## Delete User

```bash
sudo userdel anna
```

## Create Group

```bash
sudo groupadd developers
```

## Add User To Group

```bash
sudo usermod -aG developers anna
```

## Show Current User

```bash
whoami
```

## Show User ID

```bash
id
```

## Show Groups

```bash
groups
```

## Show All Users

```bash
cat /etc/passwd
```

## Show All Groups

```bash
cat /etc/group
```

## Switch User

```bash
su anna
```

## Run Command As Root

```bash
sudo command
```

## File Ownership

```bash
chown anna:developers file.txt
```

## Permissions

```bash
chmod 640 file.txt
chmod 755 script.sh
```
