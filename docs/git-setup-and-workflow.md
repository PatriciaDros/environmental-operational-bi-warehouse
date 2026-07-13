# Git Setup and Repository Initialization

## Project

Environmental Operational BI Warehouse

A portfolio-quality Operational Business Intelligence Data Warehouse designed for an environmental consulting company.

The project will demonstrate:

* Dimensional Modeling
* Data Warehousing
* SQL Development
* ETL Design
* Analytics Engineering
* KPI Development
* Dashboard Design
* Professional Git Workflows

---

# Why We Started Over

An existing GitHub repository named:

environmental-operational-bi-warehouse

already existed.

However, it contained older content and did not represent the final project vision.

Instead of deleting it immediately, we chose a safer migration strategy.

## Decision

Rename existing repository:

environmental-operational-bi-warehouse

to:

environmental-operational-bi-warehouse-v1

Then create a new repository:

environmental-operational-bi-warehouse

Benefits:

* Preserve historical work
* Eliminate risk of accidental loss
* Create clean commit history
* Create professional portfolio presentation

---

# Local Environment Review

Before initializing Git, we reviewed the development environment.

Components:

macOS
├── Terminal (iTerm)
├── Git
├── MySQL Server
├── MySQL Workbench
├── Python
├── Anaconda / Miniconda
└── GitHub

Relationship:

Git
│
├── Tracks project files
├── Creates commits
└── Connects to GitHub

GitHub
│
├── Stores remote repository
└── Shares project publicly

MySQL
│
├── Stores warehouse tables
└── Executes SQL

MySQL Workbench
│
├── GUI for MySQL
└── Development environment

Python
│
├── ETL
├── Data Quality
└── Automation

Anaconda
│
├── Manages Python environments
└── Provides package management

---

# Understanding (base)

Terminal displayed:

(base)

Example:

(base) patriciaquigley@patricias-MacBook-Pro

Meaning:

The default Anaconda environment is active.

This is normal.

It does NOT mean:

* Git is running
* MySQL is running
* Repository exists

It only indicates:

Python Environment = base

---

# Locating the Project

Checked current directory:

```bash
pwd
```

Purpose:

Print Working Directory

Output:

/Users/patriciaquigley/Desktop/Projects

Verified project folder:

```bash
ls
```

Located:

environmental-operational-bi-warehouse

---

# Navigate Into Project

Command:

```bash
cd environmental-operational-bi-warehouse
```

Verify:

```bash
pwd
```

Output:

/Users/patriciaquigley/Desktop/Projects/environmental-operational-bi-warehouse

---

# Initialize Git Repository

Command:

```bash
git init
```

Purpose:

Convert normal folder into Git repository.

Git creates:

.git/

Repository structure became:

environmental-operational-bi-warehouse/
└── .git/

Important:

The .git folder stores:

* Commit history
* Branches
* Configuration
* Repository metadata

---

# Verify Repository Status

Command:

```bash
git status
```

Output:

On branch main

No commits yet

Meaning:

* Repository exists
* Main branch exists
* No history exists

---

# Create Initial README

Create file:

```bash
touch README.md
```

Purpose:

Create repository landing page.

README files are typically the first file reviewed by recruiters and hiring managers.

---

# Stage README

Command:

```bash
git add README.md
```

Important Concept:

Git has three areas.

Working Directory
↓
git add
↓
Staging Area
↓
git commit
↓
Repository History

git add does NOT commit.

git add moves changes into the staging area.

---

# Create README Content

Added:

# Environmental Operational BI Warehouse

Operational BI warehouse built using dimensional modeling, SQL analytics, KPI engineering, reconciliation testing, and executive reporting for environmental consulting operations.

Verified:

```bash
cat README.md
```

Purpose:

Display file contents.

---

# First Commit

Command:

```bash
git commit -m "Initialize repository with project README"
```

Purpose:

Create first repository snapshot.

Output:

d0c6758

Important Terms:

Commit
= snapshot in time

Commit Message
= explanation of change

Hash
= unique commit identifier

Result:

Commit #1

Initialize repository with project README

---

# Review Commit History

Command:

```bash
git log --oneline
```

Output:

d0c6758 Initialize repository with project README

Purpose:

Display repository history.

---

# Create New GitHub Repository

Created:

PatriciaDros/environmental-operational-bi-warehouse

Repository created EMPTY.

No README
No License
No .gitignore

Reason:

Prevent merge conflicts.

Local repository becomes source of truth.

---

# Connect Local Repository To GitHub

Command:

```bash
git remote add origin https://github.com/PatriciaDros/environmental-operational-bi-warehouse.git
```

Purpose:

Create remote connection.

Terminology:

origin

is simply a nickname for:

https://github.com/PatriciaDros/environmental-operational-bi-warehouse.git

Verify:

```bash
git remote -v
```

Output:

origin (fetch)
origin (push)

---

# GitHub Authentication

GitHub no longer accepts account passwords.

Created Personal Access Token (PAT).

Used PAT for:

```bash
git push
```

Important Lesson:

PAT behaves like a password.

Never:

* Commit PATs
* Share PATs
* Store PATs in repositories

---

# First Push To GitHub

Command:

```bash
git push -u origin main
```

Purpose:

Publish repository.

Result:

Local main
↓
GitHub main

Tracking relationship established.

Future pushes can use:

```bash
git push
```

Future pulls can use:

```bash
git pull
```

---

# Create Core Repository Structure

Created folders:

```text
architecture/
dashboards/
data/
docs/
etl/
screenshots/
sql/
```

---

# Git Does Not Track Empty Folders

Important discovery:

Git tracks files.

Git does NOT track empty directories.

Because folders were empty:

```bash
git status
```

showed:

nothing to commit

even though folders existed.

---

# Solution: .gitkeep Files

Created:

architecture/.gitkeep
dashboards/.gitkeep
data/.gitkeep
docs/.gitkeep
etl/.gitkeep
screenshots/.gitkeep
sql/.gitkeep

Purpose:

Provide a file Git can track.

Repository became:

environmental-operational-bi-warehouse/
├── architecture/
│   └── .gitkeep
├── dashboards/
│   └── .gitkeep
├── data/
│   └── .gitkeep
├── docs/
│   └── .gitkeep
├── etl/
│   └── .gitkeep
├── screenshots/
│   └── .gitkeep
├── sql/
│   └── .gitkeep
└── README.md

---

# Second Commit

Command:

```bash
git add .
git commit -m "Create core repository structure"
```

Commit:

d67f5ef

Message:

Create core repository structure

Purpose:

Document creation of warehouse project framework.

---

# Current Commit History

d67f5ef Create core repository structure

d0c6758 Initialize repository with project README

---

# Key Git Concepts Learned

pwd
Print Working Directory

ls
List Files

cd
Change Directory

mkdir
Create Directory

touch
Create File

git init
Initialize Repository

git status
Check Repository State

git add
Stage Changes

git commit
Create Snapshot

git log
Review History

git remote add
Connect GitHub

git push
Publish Changes

.gitkeep
Allow Git To Track Directory Structure

---

# Current Project Status

Repository Created: Complete

GitHub Connected: Complete

Commit History Established: Complete

Repository Structure Created: Complete

Ready For:

* Warehouse Architecture Design
* Star Schema Documentation
* Dimensional Modeling
* SQL DDL Development
* ETL Development
* Dashboard Design
