# Git Repository Setup and Initial Workflow

## Overview

This document captures the initial setup of the Environmental Operational BI Warehouse repository.

The objective was to establish a clean Git repository, connect it to GitHub, and create a professional project structure that can support dimensional modeling, ETL development, analytics engineering, and dashboard delivery.

---

## Repository Strategy

An older repository existed with the same project name but contained experimental content.

Instead of deleting it immediately, the repository was renamed and preserved as a backup.

A new repository was created to provide:

* Clean commit history
* Professional project structure
* Clear portfolio presentation
* Controlled development process

---

## Local Repository Initialization

Navigate to the project folder:

```bash
cd environmental-operational-bi-warehouse
```

Initialize Git:

```bash
git init
```

Purpose:

* Creates the `.git` directory
* Enables version control
* Establishes the repository on the local machine

---

## Create Initial Documentation

Create the README:

```bash
touch README.md
```

Stage the file:

```bash
git add README.md
```

Create the first commit:

```bash
git commit -m "Initialize repository with project README"
```

Purpose:

* Establishes the first repository snapshot
* Creates the root commit
* Documents project intent

---

## Connect Repository to GitHub

Add GitHub as the remote origin:

```bash
git remote add origin https://github.com/PatriciaDros/environmental-operational-bi-warehouse.git
```

Verify:

```bash
git remote -v
```

Purpose:

* Links local repository to GitHub
* Enables push and pull operations

---

## Publish Repository

Push to GitHub:

```bash
git push -u origin main
```

Purpose:

* Publishes commit history
* Establishes branch tracking
* Synchronizes local and remote repositories

---

## Create Core Repository Structure

Folders created:

* architecture/
* dashboards/
* data/
* docs/
* etl/
* screenshots/
* sql/

Git placeholder files:

```text
.gitkeep
```

were added so Git can track otherwise empty directories.

Commit:

```bash
git commit -m "Create core repository structure"
```

---

## Current Status

Repository initialized.

GitHub connected.

Commit history established.

Core project structure created.

Ready for warehouse architecture and dimensional modeling development.
