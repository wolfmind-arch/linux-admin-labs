# Git Notes – Editing Commit Messages

## Change the Last Commit Message (Before Push)

If you have not pushed the commit to GitHub yet:

```bash
git commit --amend -m "New commit message"
```

Example:

```bash
git commit --amend -m "docs: add project roadmap, decisions and troubleshooting guides"
```

---

## Change the Last Commit Message (After Push)

If the commit has already been pushed to the remote repository:

```bash
git commit --amend -m "New commit message"
git push --force-with-lease
```

### Why `--force-with-lease`?

`git push --force-with-lease` safely updates the remote repository.

Before replacing the remote history, Git checks whether another developer has pushed new commits. If the remote branch has changed, Git refuses to overwrite it.

This makes it much safer than:

```bash
git push --force
```

---

## Change an Older Commit Message

To edit one of the last three commits:

```bash
git rebase -i HEAD~3
```

Example:

```text
pick a1b2c3 First commit
pick d4e5f6 Second commit
pick g7h8i9 Third commit
```

Replace:

```text
pick
```

with:

```text
reword
```

Save and close the editor.

Git will pause and allow you to enter a new commit message.

---

## Verify the Commit History

Display the commit history:

```bash
git log --oneline
```

Example output:

```text
a6f8d9c docs: add project roadmap, decisions and troubleshooting guides
d31b8a1 docs: add Cyclus API documentation
8e93b2f feat: create project structure
```

---

## Best Practices

* Write clear and descriptive commit messages.

* Use prefixes such as:

  * `feat:` – new feature
  * `fix:` – bug fix
  * `docs:` – documentation
  * `refactor:` – code restructuring without changing behavior
  * `test:` – tests
  * `config:` – configuration changes
  * `chore:` – maintenance tasks

* Amend commits before pushing whenever possible.

* Prefer `git push --force-with-lease` over `git push --force`.

* Keep each commit focused on one logical change.
