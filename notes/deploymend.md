# deployment.md

# Deployment with Bash, Git, SSH and systemd

## What is deployment?

Deployment is the process of transferring a new version of an application from the development environment to the target machine where it will run.

Instead of copying files manually, deployment can be automated using a Bash script.

---

# Development workflow

The project is developed on the main computer (Ubuntu).

```text
Ubuntu
    │
    ├── Write code
    ├── Test application
    ├── git add .
    ├── git commit
    ├── git push
    │
    ▼
GitHub
    │
    ▼
deploy.sh
    │
    ▼
Raspberry Pi
```

The Raspberry Pi is treated as a deployment target, not as a development machine.

---

# Why use deployment?

Benefits:

* Faster than copying files manually.
* Reduces deployment mistakes.
* Every Raspberry Pi receives the same version.
* Easy to update after every commit.
* Can be extended later with automatic testing or CI/CD.

---

# Components used

## Git

Tracks project history.

Common commands:

```bash
git add .
git commit -m "Describe changes"
git push
git pull
```

---

## SSH

Secure Shell allows executing commands on another Linux machine.

Example:

```bash
ssh mariusz@raspberry
```

In deploy.sh, SSH executes multiple commands remotely:

```bash
ssh mariusz@raspberry << EOF
cd project
git pull
EOF
```

Everything between `EOF` markers is executed on the Raspberry Pi.

---

## Virtual Environment (venv)

Creates an isolated Python environment.

Create:

```bash
python3 -m venv .venv
```

Activate:

```bash
source .venv/bin/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Advantages:

* No conflicts with system Python.
* Project-specific packages.
* Easier maintenance.

---

## systemd

Linux service manager.

Useful commands:

```bash
sudo systemctl start waste-reminder.service
sudo systemctl stop waste-reminder.service
sudo systemctl restart waste-reminder.service
sudo systemctl status waste-reminder.service
```

Using a systemd service allows the application to:

* start automatically after boot,
* restart after crashes,
* run in the background,
* be managed consistently.

---

# deploy.sh workflow

1. Connect to Raspberry Pi using SSH.
2. Change to the project directory.
3. Download the newest version from GitHub.
4. Create (or reuse) the Python virtual environment.
5. Install required Python packages.
6. Restart the application service (optional).

---

# Deployment vs Development

Development computer:

* Write code
* Test
* Debug
* Commit
* Push to GitHub

Raspberry Pi:

* Pull latest code
* Install dependencies
* Run the application
* No code editing

---

# Why not develop directly on Raspberry Pi Zero 2 W?

The Raspberry Pi Zero 2 W has only 512 MB RAM.

Running VS Code Remote Server consumes a significant amount of memory, causing:

* high load average,
* swap usage,
* slow SSH sessions,
* delayed typing.

For this reason, development is performed on Ubuntu, while the Raspberry Pi is used only to execute the application.

---

# Future improvements

Possible enhancements for deploy.sh:

* check network connectivity,
* verify available disk space,
* create timestamped logs,
* verify Git branch before deployment,
* skip dependency installation if requirements.txt has not changed,
* automatically restart the systemd service,
* notify if deployment fails.

---

# Summary

A simple deployment script automates software updates on a remote Linux machine.

Skills demonstrated:

* Bash scripting
* SSH
* Git
* Python virtual environments
* Linux administration
* systemd
* Deployment automation

These are practical skills commonly used by Linux administrators, DevOps engineers, and Python developers.
