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

---

# 📁 Navigating to Parent Directories in Real Workflows
When working with file systems in real-world data projects, it’s often necessary to move up through directory levels—whether you’re searching for shared resources, debugging file paths, or managing scripts and datasets. The shell provides simple commands to do this efficiently.

### 💡 Scenario: Efficient Directory Navigation
Suppose you’re working in ```/home/repl/seasonal``` (perhaps handling seasonal data files for a data analysis project). If you want to quickly check a configuration file or shared resource in a parent directory, you can use the ```cd ..``` command to move up one level.

But what if you want to move to your main user directory from deep within the structure, and then reference the parent of that directory? That’s where the tilde ```~``` and double dots ```..``` come in handy:

* ```~``` always takes you to your home directory (for example, ```/home/repl```).

* ```..``` means “the directory above the one I’m in.”

So, if you’re in ```/home/repl/seasonal``` and you run:

```
cd ~/../.
```
* ```~``` → ```/home/repl```

* ```/../``` → the parent directory, which is ```/home```

```/.``` → stays in ```/home```

Result:
You end up in ```/home```.

### Tip:
Mastering quick navigation commands like ```cd ..```, ```cd ~```, and their combinations saves you time and reduces errors in complex directory structures—especially in collaborative projects or when managing multiple data environments. 

---

# 🗂️ Copying Files Efficiently with the Shell

As part of my daily workflow as a data analyst, I often need to organize, back up, and version data files to ensure nothing gets lost or overwritten by accident. The Unix shell offers the ```cp``` command, which is a reliable way to quickly copy files or entire groups of files between directories.

## 💡 Scenario:
Suppose I am managing seasonal sales data stored as separate CSV files for each quarter. To create a backup before running transformations, I use:

```cp seasonal/summer.csv backup/summer.bck```

* This copies ```summer.csv``` from the ```seasonal``` directory into the ```backup``` directory and renames it ```summer.bck```.

If I need to back up multiple files at once, I can do:

```cp seasonal/spring.csv seasonal/summer.csv backup/```

* Here, both ```spring.csv``` and ```summer.csv``` are copied into the ```backup``` directory in a single command, saving time and reducing manual errors.

### Why is this useful?
💡 Using the shell, I can automate file management for reporting, reproducibility, and version control—critical for effective data operations and collaboration.

---

# 🚚 Moving Files Efficiently with mv
In my daily work as a Data Analyst, it's often necessary to reorganize project directories—especially when preparing datasets for analysis or archiving old results. For example, I might need to move raw data files from an "incoming" folder to a structured backup location after they’ve been processed.

## 💡 Real-world scenario:
Suppose I have a project directory ```/home/repl/``` with two subdirectories, ```seasonal``` (storing data by season) and ```backup``` (for archiving copies). After analyzing seasonal datasets like ```spring.csv``` and ```summer.csv```, I want to move them to the ```backup``` folder in one go.

Shell command:

```mv seasonal/spring.csv seasonal/summer.csv backup```

This command moves both files from the ```seasonal``` directory into the ```backup``` folder in a single, efficient operation—helping keep my workspace organized and my workflows smooth. 

---

# 🔄 Renaming Files for Better Project Structure
In real-world data projects, it’s common to rename files to keep your workspace organized, clarify versions, or follow naming conventions for reproducibility. For instance, if you receive raw data exports named ```winter.csv```, you might want to rename them before archiving or processing.

## 💡 Example Workflow
Imagine you're working on a dataset of seasonal metrics stored in your ```seasonal/``` directory. To version or back up your original file, you can rename ```winter.csv``` to ```winter.csv.bck``` before running a data cleaning script. This way, you always have a backup of the raw input.

```
# Move into the directory with my seasonal data
```cd seasonal

# Rename the file as a backup
mv winter.csv winter.csv.bck

# Check that the file was renamed
ls
```

### Result:
This renames ```winter.csv``` to ```winter.csv.bck``` (overwriting any previous backup). The workflow is much faster, scriptable, and reproducible—perfect for version-controlling datasets in data projects. 

---

# 🗂️ Creating and Deleting Directories in a Real Data Workflow
When organizing your project folders and files, it's essential to efficiently manage directories—just as you would in any complex data or codebase structure.

### Why does this matter?
If you’re setting up a new data pipeline, archiving previous results, or simply tidying up your workspace, you need to know how to:

* Remove files and folders you no longer need
* Create new directories for new data or analyses
* Keep your workspace clean and logically structured

## 💡 Example Workflow
### 1. Delete a file from a directory without leaving your current location

```rm people/agarwal.txt```

*Removes a file you don’t need anymore, freeing up space and keeping things organized.*

### 2. Delete an empty directory

```rmdir people```

*Useful when a folder is no longer needed after its files have been removed.*

### 3. Create a new directory for annual data

```mkdir yearly```

*Perfect for separating projects or datasets by year, making historical tracking and archiving easier.*

### 4. Create subfolders for specific years or categories

```mkdir yearly/2017```

*You can create nested directories in one go, helping you keep your file system clear and hierarchical.*

> Tip: 
> Use ```rmdir``` only on empty directories, or ```rm r``` for directories with content—but always double-check before deleting folders recursively!

---

# 🏁 Wrapping Up Temporary File Management with Shell

In real-world data analysis, it's common to generate intermediate files that only need to exist for a short time—such as logs, temporary calculation results, or scratch data. Rather than cluttering your home or project directory, these files are best kept in ```/tmp```, a dedicated temporary directory available on most Unix-like systems. Keeping your workspace clean is not just good practice, but it also reduces accidental data leaks or version control mishaps.

Here's how I use the shell for robust, temporary file management:

### 1. Navigating to the Temporary Directory

```cd /tmp```

 *Move into the system’s temporary folder to prepare for scratch work.*

### 2. Listing Temporary Contents

```ls```

*Quickly check which temp files or folders already exist before creating new ones.*

### 3. Creating a New Working Directory

```mkdir scratch```

*Set up a new subdirectory (e.g., ```scratch```) inside ```/tmp``` for project-specific intermediate files.*

### 4. Moving Files into Scratch Space

```mv ~/project/data/intermediate-file.csv /tmp/scratch/```

*Relocate an intermediate file from your project directory into the temporary workspace for safe, short-term storage.*

---

## Why use /tmp?

* Keeps your main directories clean and organized
* Prevents unnecessary files from being tracked in version control
* Supports reproducible, clutter-free workflows

This workflow makes shell scripting a powerful tool for data analysts who regularly process large datasets or automate ETL (Extract, Transform, Load) pipelines. Keeping scratch work organized means fewer headaches—and a much smoother path to production-ready results! 🚀
