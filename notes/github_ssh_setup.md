# GitHub SSH Authentication Setup

## Objective

Configure GitHub authentication using SSH keys to avoid entering a username, password, or Personal Access Token when using Git commands such as:

```bash
git push
git pull
git clone
```

---

## Problem

Using HTTPS repositories requires authentication.

Example:

```bash
https://github.com/username/repository.git
```

GitHub no longer supports account passwords for Git operations and requires a Personal Access Token (PAT).

A more convenient solution is SSH authentication.

---

## Step 1 - Generate SSH Key Pair

Create a new ED25519 SSH key:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Example:

```bash
ssh-keygen -t ed25519 -C "wolf8mind@gmail.com"
```

Accept the default file location:

```text
/home/ernest/.ssh/id_ed25519
```

For a home lab environment, leave the passphrase empty:

```text
Enter
Enter
```

---

## Step 2 - Verify Key Files

Check generated files:

```bash
ls -la ~/.ssh
```

Expected:

```text
id_ed25519
id_ed25519.pub
```

Meaning:

| File           | Purpose                       |
| -------------- | ----------------------------- |
| id_ed25519     | Private key (keep secret)     |
| id_ed25519.pub | Public key (upload to GitHub) |

---

## Step 3 - Display Public Key

Show public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Copy the entire output.

---

## Step 4 - Add Key to GitHub

Navigate to:

GitHub → Settings → SSH and GPG Keys → New SSH Key

Paste:

```text
ssh-ed25519 AAAA...
```

Save.

---

## Step 5 - Test Connection

Run:

```bash
ssh -T git@github.com
```

First connection:

```text
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

Answer:

```text
yes
```

Expected result:

```text
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
```

Successful authentication:

```text
Hi wolfmind-arch! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## Step 6 - Verify Repository Remote

Check repository configuration:

```bash
git remote -v
```

HTTPS example:

```text
https://github.com/user/repo.git
```

SSH example:

```text
git@github.com:user/repo.git
```

---

## Step 7 - Change Remote to SSH

Example:

```bash
git remote set-url origin git@github.com:wolfmind-arch/linux-admin-labs.git
```

Verify:

```bash
git remote -v
```

Expected:

```text
origin git@github.com:wolfmind-arch/linux-admin-labs.git (fetch)
origin git@github.com:wolfmind-arch/linux-admin-labs.git (push)
```

---

## Step 8 - Test Push

Push repository:

```bash
git push
```

Result:

```text
Everything up-to-date
```

Meaning:

* SSH authentication works
* GitHub accepts the SSH key
* Local and remote repositories are synchronized

---

## Useful Commands

Generate key:

```bash
ssh-keygen -t ed25519 -C "email@example.com"
```

Display public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Test GitHub connection:

```bash
ssh -T git@github.com
```

Check remote:

```bash
git remote -v
```

Change remote:

```bash
git remote set-url origin git@github.com:user/repo.git
```

Push:

```bash
git push
```

---

## What I Learned

* How SSH public/private key authentication works
* How to generate ED25519 keys
* How GitHub SSH authentication works
* How to add SSH keys to GitHub
* How to switch a repository from HTTPS to SSH
* How to test SSH connectivity
* How to use Git without entering credentials every time
