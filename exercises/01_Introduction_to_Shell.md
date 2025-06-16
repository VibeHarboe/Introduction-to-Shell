# 🐚 Introduction to Shell: Manipulating Files and Directories

This chapter introduces the Unix shell, its practical relevance for modern data workflows, and the fundamental differences between graphical interfaces and the command-line. Exercises are reframed with a real-world data analytics perspective.

---

# 💡 Real-world context:
Think of the shell and the file explorer as two different "languages" for communicating with your computer. Both ultimately control the same underlying processes – they just do so differently.

## File explorer (GUI):
  - Click to open folders
  - Drag to move files
  - Double-click to run apps

## Shell (CLI):
  - `cd /home/user/documents` = go to folder
  - `mv file1.txt archive/` = move file
  - `./app.sh` = run a script or program

---

# 🎯 Why this matters for Data Analysts
Knowing both gives you flexibility. You can automate, batch process, and script operations in a way that GUIs can’t – crucial for data pipelines.


---

# 🖥️ Shell vs. Desktop Interface

**Prompt:**  
An operating system like Windows, Linux, or Mac OS is a special kind of program. It controls the computer's processor, hard drive, and network connection, but its most important job is to run other programs.  
Users need an interface to communicate with the OS – either a graphical file explorer or a command-line shell.

**Question:**  
*What is the relationship between the graphical file explorer that most people use and the command-line shell?*

**Correct answer:**  
> They are both interfaces for issuing commands to the operating system.

---

# 📂 Navigating File Systems in Real-World Data Work
A fundamental part of my daily analytics and ETL automation is never losing track of where I am in the file system. Before creating, moving, or renaming files—especially when running scripts on production servers or in collaborative projects—I always verify my current working directory.

Real-World Example
Before launching any batch process or automating file operations, I use: 

``` pwd ```

to confirm my current workspace.

Typical output: ```/home/repl```

This practice ensures that all files are created, processed, or deleted in the intended location. It helps prevent costly errors—like overwriting or removing important data—or breaking automation jobs.

## 💡 Real-world context
When automating file tasks or collaborating on a data project, always check your working directory with pwd before creating, moving, or deleting files. This helps prevent costly mistakes—such as writing files to the wrong location or accidentally deleting important directories.

### Why it matters
Automation safety: Reduces the risk of damaging the wrong files or directories.

Collaboration: Provides clear documentation for teammates ("Always check your working directory with pwd before running critical scripts").

Auditability: I routinely log the output of pwd at the start of my scripts to document the workflow and support troubleshooting.


---

# 📝 Identifying Files and Directories in Practice

A key part of working efficiently in a Unix environment is quickly identifying which files and folders exist within your workspace. In my typical workflow, I frequently use the ```ls``` command to audit data structures, check the presence of key files, and validate the outcome of automated jobs or scripts.

For example, when handling large data directories (such as ```/home/repl/seasonal```, where we might store seasonal data extracts for reporting), I use:

``` ls /home/repl/seasonal ```

This command lists all files in the specified directory. It is much faster than clicking through folders—especially on remote servers or in CI/CD pipelines.


## 🧩 Real-world scenario:

Recently, I was tasked with automating quarterly reporting. Before launching an aggregation script, I used ls to verify which seasonal data files were actually present:

```
$ ls /home/repl/seasonal
autumn.csv  spring.csv  summer.csv  winter.csv
 ```

Here I immediately noticed that a file named ```fall.csv``` was missing (in our naming convention, we use ```autumn.csv``` instead). This quick check prevented an error downstream and ensured my scripts referenced the correct datasets.

### 💡 Tip:
In Bash scripting, combining ```ls``` with conditionals lets you automate file validation as part of your ETL/data pipeline setup.

### 📌 Summary:
Using ```ls``` to audit directory contents is a critical real-world skill—whether you're troubleshooting, validating data, or designing robust scripts that can handle missing or unexpected files.

---

