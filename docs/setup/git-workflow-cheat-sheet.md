# Git Mental Models

> _"Learn how Git thinks, not just the commands."_

---

# The Three Places Git Stores Your Work

Every file exists in one of three places.

```text
Working Directory
    ↓
    (your files on disk)

Staging Area (git add)
    ↓
    (the snapshot that will be committed)

Repository (git commit)
    ↓
    (the permanent history)
```

Think of it this way:

| Location          | What it Represents                                  |
| ----------------- | --------------------------------------------------- |
| Working Directory | The files you're actively editing.                  |
| Staging Area      | The exact version that will become the next commit. |
| Repository        | The permanent history of your project.              |

---

# The Four Git Questions

Each Git command answers a different question.

| Command      | Question it Answers                                           |
| ------------ | ------------------------------------------------------------- |
| `git status` | **What is the state of my files?**                            |
| `git diff`   | **What exactly changed inside the files?**                    |
| `git add`    | **Take a snapshot of the current version.**                   |
| `git commit` | **Save that snapshot permanently in the repository history.** |

Notice that each command has a single responsibility.

---

# Documentation Workflow

When creating or updating documentation.

```text
Navigate to repository
        │
        ▼
pwd
        │
        ▼
code .
        │
        ▼
Create/edit Markdown files
        │
        ▼
Save
        │
        ▼
git status
        │
        ▼
git add .
        │
        ▼
git status
        │
        ▼
git commit -m "Add ..."
        │
        ▼
git push
        │
        ▼
git status
```

## Why check `git status` twice?

The first time answers:

> **What changed?**

The second time answers:

> **What am I about to commit?**

---

# General Development Workflow

Whether writing SQL, Python, Markdown, or making any other change.

```text
Edit files
      │
      ▼
git status
      │
      ▼
git add .
      │
      ▼
git status
      │
      ▼
git commit -m "..."
      │
      ▼
git status
      │
      ▼
git push
      │
      ▼
git status
```

---

# The Git Snapshot Model

Git does **not** track every keystroke.

Git creates **snapshots**.

```text
Create file
        │
        ▼
Untracked
        │
        ▼
git add
        │
        ▼
Snapshot taken
        │
        ▼
Edit file again
        │
        ▼
Modified
```

The important idea:

- Saving a file does **not** create a Git snapshot.
- `git add` creates the snapshot.
- `git commit` permanently records that snapshot.

---

# Untracked vs. Staged vs. Committed

```text
New File
    │
    ▼
Untracked
    │
git add
    ▼
Staged
    │
git commit
    ▼
Committed
```

---

# Git Commit Flow

Every commit follows the same pattern.

```text
Working Directory
        │
        │  Edit files
        ▼
git status
        │
        ▼
git add .
        │
        ▼
Staging Area
        │
        ▼
git commit
        │
        ▼
Repository History
        │
        ▼
git push
        │
        ▼
GitHub
```

---

# Git Philosophy

Git is designed around three simple ideas.

1. **Inspect before acting.**
2. **Take snapshots, not backups.**
3. **Commit small, meaningful changes.**

A good workflow is usually:

> Create → Verify → Stage → Verify → Commit → Push

---

# Remember

You don't have to memorize Git.

Instead, remember these three questions:

1. **Where is my file?**
   - Working Directory
   - Staging Area
   - Repository

2. **What question am I asking Git?**
   - Status?
   - Difference?
   - Snapshot?
   - Save?

3. **What is the next logical step?**
   - Edit
   - Stage
   - Commit
   - Push
