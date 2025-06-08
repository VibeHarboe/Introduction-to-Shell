#!/bin/bash
# ---------------------------------------------------------------
# 📁 Introduction to Shell – Exercise 01
# 🔍 Topic: Shell vs. Graphical User Interface (GUI)
# 🧠 Objective: Understand the conceptual relationship between GUI and shell.
# ---------------------------------------------------------------

# ✅ Correct Answer:
# They are both interfaces for issuing commands to the operating system.

# ---------------------------------------------------------------
# 💡 Real-world context:
# Think of the shell and the file explorer as two different "languages"
# for communicating with your computer. Both ultimately control the
# same underlying processes – they just do so differently.

# File explorer (GUI):
#   - Click to open folders
#   - Drag to move files
#   - Double-click to run apps

# Shell (CLI):
#   - `cd /home/user/documents` = go to folder
#   - `mv file1.txt archive/` = move file
#   - `./app.sh` = run a script or program

# 🎯 Why this matters for Data Analysts:
# Knowing both gives you flexibility. You can automate, batch process,
# and script operations in a way that GUIs can’t – crucial for data pipelines.


📁 Exercise: Identify Current Working Directory (Filesystem Navigation)
Scenario:
As a Data Analyst working on a remote Linux server, you often need to verify where you are in the filesystem before executing scripts or referencing files. This is crucial when automating batch jobs, syncing logs, or debugging broken paths in ETL pipelines.

Objective:
Use the shell to confirm your current working directory.

Command:

bash
Kopiér
Rediger
pwd
Example Output:

bash
Kopiér
Rediger
/home/repl
Explanation:
The pwd command ("print working directory") returns the absolute path of your current location in the file system. In this case, you are inside the repl user directory, under /home.

This is especially useful when scripting with relative paths or executing scripts from cron jobs that don't start in your project folder.
