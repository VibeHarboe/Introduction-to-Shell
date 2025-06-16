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


## 💡 Real-world scenario:

Recently, I was tasked with automating quarterly reporting. Before launching an aggregation script, I used ls to verify which seasonal data files were actually present:

```
$ ls /home/repl/seasonal
autumn.csv  spring.csv  summer.csv  winter.csv
 ```

Here I immediately noticed that a file named ```fall.csv``` was missing (in our naming convention, we use ```autumn.csv``` instead). This quick check prevented an error downstream and ensured my scripts referenced the correct datasets.

### Tip:
In Bash scripting, combining ```ls``` with conditionals lets you automate file validation as part of your ETL/data pipeline setup.

### Summary:
Using ```ls``` to audit directory contents is a critical real-world skill—whether you're troubleshooting, validating data, or designing robust scripts that can handle missing or unexpected files.

---

# 📁 Navigating with Absolute and Relative Paths

In my day-to-day data tasks, I frequently work across complex folder structures. To automate processes, I need to reference files and directories both reliably and efficiently. Here’s how I ensure precision:

* **Absolute paths** provide a universal reference—no matter where I am in the filesystem, ```/home/repl/seasonal/winter.csv``` always points to the exact same file.

* **Relative paths** are contextual, allowing me to quickly target files based on my current working directory. For example, if I’m already in ```/home/repl/seasonal/```, referencing ```winter.csv``` is sufficient.

## 🛠️ Real-world workflow
When automating reporting or batch processing, I use both:

Absolute paths for guaranteed file access in scripts that run from cron jobs, Docker containers, or shared servers.

Relative paths for quick navigation when working interactively, or for scripts that expect to be run from a known location.

### Example session:
```
# List a file using an absolute path (always works, no matter where you are)
ls /home/repl/course.txt

# List a file using a relative path (from /home/repl/)
ls seasonal/summer.csv

# List contents of a subdirectory using a simple relative path
ls people
```

This approach eliminates ambiguity, prevents path errors, and saves time, especially when scripting or working remotely on servers.

---

# 🌍 Navigating Between Directories in the Shell

When I work on real data projects, I often need to move around in complex folder structures—just like navigating through folders in a file explorer. Instead of clicking, I use the ```cd``` (“change directory”) command in the shell. For example:

```
cd seasonal
pwd   # Now I'm in /home/repl/seasonal
ls    # Lists the files: autumn.csv, spring.csv, summer.csv, winter.csv
```

This way, I can quickly jump between data folders and always know where I am. If I need to return to my starting point, I simply run:

```
cd /home/repl
```
Being comfortable with these commands allows me to work efficiently with large data projects, automate tasks, and avoid getting lost in complex directory trees. 🚀
