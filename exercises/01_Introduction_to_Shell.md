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

# Scripts & Exercises

## 🖥️ Shell vs. Desktop Interface

**Prompt:**  
An operating system like Windows, Linux, or Mac OS is a special kind of program. It controls the computer's processor, hard drive, and network connection, but its most important job is to run other programs.  
Users need an interface to communicate with the OS – either a graphical file explorer or a command-line shell.

**Question:**  
*What is the relationship between the graphical file explorer that most people use and the command-line shell?*

**Correct answer:**  
> They are both interfaces for issuing commands to the operating system.

---

## 📂 Where am I? (pwd)

The filesystem manages files and directories, each identified by an absolute path.

Example: ```/home/repl``` is the directory repl inside the directory home.

```/home/repl/course.txt``` is a file called course.txt inside that directory.

/ on its own is the root directory.

To find your current location in the filesystem, use the command:
```
pwd

```
```pwd``` stands for "print working directory" and prints the absolute path of your current working directory—where the shell runs commands and looks for files by default.

