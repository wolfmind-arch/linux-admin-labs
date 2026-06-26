# Case 001 - VS Code Remote SSH Authentication Failed

### Problem
VS Code could not connect to the Raspberry Pi.

### Symptoms
- Terminal SSH worked.
- VS Code returned:
  Permission denied (publickey,password)

### Investigation
- Verified SSH service was running.
- Confirmed terminal login worked.
- Checked `~/.ssh/config`.
- Compared VS Code and terminal behavior.
- Verified SSH key configuration.
- Reviewed the username.

### Root Cause
Linux usernames are case-sensitive.
The username was entered as `Pi` instead of `pi`.

### Solution
Use the correct lowercase username.

### Lesson Learned
Always verify the username before investigating more complex causes.
