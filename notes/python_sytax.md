# Python Notes — Basic to Intermediate and Advanced Syntax

These notes are for learning Python step by step. They focus on syntax, examples, and practical use.

---

## 1. Basic Python Syntax

### Print text

```python
print("Hello, Python!")
```

### Comments

```python
# This is a single-line comment

"""
This is a multi-line comment
or documentation string.
"""
```

### Variables

```python
name = "Mariusz"
age = 43
height = 1.80
is_admin = False
```

Python does not require declaring types before using variables.

---

## 2. Basic Data Types

### Strings

```python
text = "Linux admin"
print(text.upper())
print(text.lower())
print(text[0])      # first character
print(text[-1])     # last character
```

### Integers and floats

```python
x = 10
price = 19.99

print(x + 5)
print(price * 2)
```

### Booleans

```python
is_running = True
is_failed = False
```

---

## 3. String Formatting

### f-strings

```python
name = "Mariusz"
level = "beginner"

print(f"User {name} is a {level} Python learner.")
```

### Multi-line strings

```python
message = """
Python is useful for:
- automation
- scripts
- data processing
- system administration
"""

print(message)
```

---

## 4. Operators

### Arithmetic operators

```python
print(10 + 5)   # addition
print(10 - 5)   # subtraction
print(10 * 5)   # multiplication
print(10 / 3)   # division
print(10 // 3)  # floor division
print(10 % 3)   # modulo
print(2 ** 3)   # power
```

### Comparison operators

```python
print(10 == 10)
print(10 != 5)
print(10 > 5)
print(10 < 5)
print(10 >= 10)
print(10 <= 20)
```

### Logical operators

```python
age = 25
has_access = True

if age >= 18 and has_access:
    print("Access granted")

if age < 18 or not has_access:
    print("Access denied")
```

---

## 5. Conditions

```python
service = "ssh"

if service == "ssh":
    print("SSH selected")
elif service == "apache":
    print("Apache selected")
else:
    print("Unknown service")
```

### Short condition

```python
age = 20
status = "adult" if age >= 18 else "minor"
print(status)
```

---

## 6. Lists

Lists are ordered and changeable.

```python
users = ["root", "mariusz", "admin"]

print(users[0])
print(users[-1])

users.append("testuser")
users.remove("admin")

print(users)
```

### Loop through a list

```python
for user in users:
    print(user)
```

### List slicing

```python
numbers = [1, 2, 3, 4, 5]

print(numbers[0:3])
print(numbers[:3])
print(numbers[2:])
```

---

## 7. Tuples

Tuples are ordered but cannot be changed.

```python
server = ("ubuntu", "22.04", "active")
print(server[0])
```

---

## 8. Dictionaries

Dictionaries store key-value pairs.

```python
user = {
    "name": "Mariusz",
    "role": "Linux learner",
    "active": True
}

print(user["name"])
print(user.get("role"))

user["level"] = "basic"
print(user)
```

### Loop through dictionary

```python
for key, value in user.items():
    print(f"{key}: {value}")
```

---

## 9. Sets

Sets store unique values.

```python
ports = {22, 80, 443, 22}
print(ports)  # duplicate 22 is removed
```

---

## 10. Loops

### for loop

```python
for i in range(5):
    print(i)
```

### while loop

```python
counter = 0

while counter < 5:
    print(counter)
    counter += 1
```

### break and continue

```python
for number in range(10):
    if number == 5:
        break
    print(number)
```

```python
for number in range(10):
    if number == 5:
        continue
    print(number)
```

---

## 11. Functions

```python
def greet(name):
    print(f"Hello, {name}")

greet("Mariusz")
```

### Function with return

```python
def add(a, b):
    return a + b

result = add(5, 3)
print(result)
```

### Default parameters

```python
def connect(host="localhost", port=22):
    print(f"Connecting to {host}:{port}")

connect()
connect("192.168.1.10", 22)
```

---

## 12. User Input

```python
name = input("Enter your name: ")
print(f"Hello, {name}")
```

### Convert input to number

```python
age = int(input("Enter your age: "))
print(age + 1)
```

---

## 13. Error Handling

```python
try:
    number = int(input("Enter a number: "))
    print(10 / number)
except ValueError:
    print("This is not a valid number")
except ZeroDivisionError:
    print("You cannot divide by zero")
finally:
    print("Program finished")
```

---

## 14. Working with Files

### Write to file

```python
with open("notes.txt", "w") as file:
    file.write("Python notes\n")
```

### Read from file

```python
with open("notes.txt", "r") as file:
    content = file.read()
    print(content)
```

### Append to file

```python
with open("notes.txt", "a") as file:
    file.write("New line\n")
```

---

## 15. Importing Modules

```python
import os

print(os.getcwd())
```

```python
from datetime import datetime

now = datetime.now()
print(now)
```

---

## 16. Useful Modules for Linux Admin

### os

```python
import os

print(os.getcwd())
os.system("ls -la")
```

### subprocess

Better than `os.system()` for running commands.

```python
import subprocess

result = subprocess.run(["ls", "-la"], capture_output=True, text=True)
print(result.stdout)
```

### pathlib

Modern way to work with paths.

```python
from pathlib import Path

path = Path("notes.txt")

if path.exists():
    print("File exists")
```

---

# Intermediate Python

## 17. List Comprehension

```python
numbers = [1, 2, 3, 4, 5]
squares = [n ** 2 for n in numbers]
print(squares)
```

### With condition

```python
even_numbers = [n for n in numbers if n % 2 == 0]
print(even_numbers)
```

---

## 18. Dictionary Comprehension

```python
users = ["root", "admin", "mariusz"]
user_lengths = {user: len(user) for user in users}
print(user_lengths)
```

---

## 19. Lambda Functions

Small anonymous functions.

```python
add = lambda a, b: a + b
print(add(2, 3))
```

Usually normal functions are easier to read.

---

## 20. Sorting

```python
users = ["root", "mariusz", "admin"]
print(sorted(users))
```

### Sort by length

```python
print(sorted(users, key=len))
```

---

## 21. Working with JSON

```python
import json

server = {
    "hostname": "ubuntu-lab",
    "ip": "192.168.1.10",
    "active": True
}

json_text = json.dumps(server, indent=4)
print(json_text)
```

### Read JSON file

```python
import json

with open("server.json", "r") as file:
    data = json.load(file)

print(data["hostname"])
```

---

## 22. Command Line Arguments

```python
import sys

print(sys.argv)
```

Run:

```bash
python3 script.py hello test
```

---

## 23. argparse

Better way to handle script arguments.

```python
import argparse

parser = argparse.ArgumentParser(description="Simple Linux admin script")
parser.add_argument("hostname", help="Hostname to check")
parser.add_argument("--port", type=int, default=22, help="Port number")

args = parser.parse_args()

print(f"Host: {args.hostname}")
print(f"Port: {args.port}")
```

Run:

```bash
python3 check.py server1 --port 22
```

---

## 24. Virtual Environments

Create:

```bash
python3 -m venv venv
```

Activate:

```bash
source venv/bin/activate
```

Deactivate:

```bash
deactivate
```

Install package:

```bash
pip install requests
```

Save packages:

```bash
pip freeze > requirements.txt
```

Install from requirements:

```bash
pip install -r requirements.txt
```

---

## 25. Object-Oriented Programming Basics

### Class and object

```python
class User:
    def __init__(self, name, role):
        self.name = name
        self.role = role

    def show_info(self):
        print(f"{self.name} is {self.role}")

user1 = User("Mariusz", "Linux learner")
user1.show_info()
```

### Inheritance

```python
class Admin(User):
    def restart_service(self, service):
        print(f"Restarting {service}")

admin = Admin("root", "administrator")
admin.show_info()
admin.restart_service("ssh")
```

---

# Advanced Python Syntax

## 26. Type Hints

```python
def add(a: int, b: int) -> int:
    return a + b

print(add(2, 3))
```

### Type hints with lists

```python
def show_users(users: list[str]) -> None:
    for user in users:
        print(user)
```

---

## 27. Dataclasses

Cleaner way to create simple classes.

```python
from dataclasses import dataclass

@dataclass
class Server:
    hostname: str
    ip: str
    active: bool

server = Server("ubuntu-lab", "192.168.1.10", True)
print(server)
```

---

## 28. Context Managers

`with` automatically handles opening and closing resources.

```python
with open("notes.txt", "r") as file:
    print(file.read())
```

Custom context manager:

```python
from contextlib import contextmanager

@contextmanager
def simple_context():
    print("Start")
    yield
    print("End")

with simple_context():
    print("Inside")
```

---

## 29. Decorators

Decorators modify functions.

```python
def logger(func):
    def wrapper():
        print("Before function")
        func()
        print("After function")
    return wrapper

@logger
def say_hello():
    print("Hello")

say_hello()
```

---

## 30. Generators

Generators produce values one at a time.

```python
def count_up_to(limit):
    number = 1
    while number <= limit:
        yield number
        number += 1

for value in count_up_to(5):
    print(value)
```

---

## 31. map, filter, zip

```python
numbers = [1, 2, 3, 4]

squares = list(map(lambda x: x ** 2, numbers))
print(squares)
```

```python
even = list(filter(lambda x: x % 2 == 0, numbers))
print(even)
```

```python
names = ["root", "admin"]
ids = [0, 1000]

combined = list(zip(names, ids))
print(combined)
```

---

## 32. Regular Expressions

```python
import re

text = "Server IP is 192.168.1.10"
match = re.search(r"\d+\.\d+\.\d+\.\d+", text)

if match:
    print(match.group())
```

---

## 33. Working with CSV

```python
import csv

with open("users.csv", "w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["username", "role"])
    writer.writerow(["mariusz", "learner"])
```

```python
import csv

with open("users.csv", "r") as file:
    reader = csv.DictReader(file)
    for row in reader:
        print(row["username"], row["role"])
```

---

## 34. Logging

```python
import logging

logging.basicConfig(
    filename="app.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

logging.info("Script started")
logging.warning("This is a warning")
logging.error("This is an error")
```

---

## 35. Async Python Basics

```python
import asyncio

async def main():
    print("Start")
    await asyncio.sleep(1)
    print("End")

asyncio.run(main())
```

Useful for network tasks, APIs, and many waiting operations.

---

## 36. Example: Check if a Linux Service Is Running

```python
import subprocess

service = "ssh"

result = subprocess.run(
    ["systemctl", "is-active", service],
    capture_output=True,
    text=True
)

if result.stdout.strip() == "active":
    print(f"{service} is running")
else:
    print(f"{service} is not running")
```

---

## 37. Example: Read Users from /etc/passwd

```python
with open("/etc/passwd", "r") as file:
    for line in file:
        username = line.split(":")[0]
        print(username)
```

---

## 38. Example: Simple Backup Script

```python
from pathlib import Path
import shutil
from datetime import datetime

source = Path("notes.txt")
backup_dir = Path("backups")
backup_dir.mkdir(exist_ok=True)

timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
backup_file = backup_dir / f"notes_{timestamp}.txt"

if source.exists():
    shutil.copy(source, backup_file)
    print(f"Backup created: {backup_file}")
else:
    print("Source file does not exist")
```

---

## 39. Good Python Habits

- Use clear variable names.
- Keep functions small.
- Use `with open(...)` for files.
- Use `pathlib` for paths.
- Use `subprocess.run()` instead of `os.system()`.
- Use virtual environments for projects.
- Add comments only when they help.
- Handle errors with `try/except`.
- Test scripts with small examples first.

---

## 40. Recommended Learning Order

1. Variables, strings, numbers
2. Conditions
3. Loops
4. Lists and dictionaries
5. Functions
6. Files
7. Modules
8. Error handling
9. `subprocess`, `os`, `pathlib`
10. JSON and CSV
11. argparse
12. Classes
13. Type hints
14. Dataclasses
15. Decorators and generators
16. Async Python

---

## 41. Mini Practice Tasks

### Basic

1. Print your name and age.
2. Create a list of Linux commands and print each command.
3. Ask the user for a number and check if it is even or odd.

### Intermediate

1. Read a text file and count the lines.
2. Create a script that checks if a file exists.
3. Create a script that accepts a filename as an argument.
4. Save server information to a JSON file.

### Advanced

1. Create a service-checking script using `subprocess`.
2. Create a backup script with timestamps.
3. Create a class called `Server` with hostname, IP, and status.
4. Add logging to your script.
5. Use argparse to control your script from the terminal.

---

## 42. Useful Commands on Linux

Check Python version:

```bash
python3 --version
```

Run Python file:

```bash
python3 script.py
```

Make script executable:

```bash
chmod +x script.py
```

Use shebang:

```python
#!/usr/bin/env python3

print("Hello from executable Python script")
```

Run:

```bash
./script.py
```

---

# End of Notes
