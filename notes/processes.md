# Processes Notes

## Show Running Processes

```bash
ps aux
```

Displays all running processes.

Important columns:

* USER
* PID
* %CPU
* %MEM
* COMMAND

## Search for a Process

```bash
ps aux | grep ssh
```

Find processes containing "ssh".

## Real-Time Monitoring

```bash
top
```

Shows CPU, memory, and running processes.

Exit:

```text
q
```

## Better Monitoring Tool

```bash
htop
```

Install:

```bash
sudo apt install htop
```

## Stop a Process

```bash
kill PID
```

Requests a process to terminate cleanly.

## Force Stop a Process

```bash
kill -9 PID
```

Forces immediate termination.

Use only if normal kill does not work.

## Kill by Name

```bash
pkill firefox
```

Stops processes matching the name.

## Useful Troubleshooting

Server slow?

```bash
top
```

Find a sleep process:

```bash
ps aux | grep sleep
```
