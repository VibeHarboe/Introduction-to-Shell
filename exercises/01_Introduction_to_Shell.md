# 🐚 Introduction to Shell: Manipulating Files and Directories

## Overview
This chapter introduces the Unix shell as a foundational tool for interacting with the operating system. You'll learn the value of typing commands over using graphical interfaces, and how these skills enable you to automate and streamline your work as a data analyst.

## 💡 Real-world context:
Think of the shell and the file explorer as two different "languages" for communicating with your computer. Both ultimately control the same underlying processes – they just do so differently.

---

## File explorer (GUI):
  - Click to open folders
  - Drag to move files
  - Double-click to run apps

---

## Shell (CLI):
  - `cd /home/user/documents` = go to folder
  - `mv file1.txt archive/` = move file
  - `./app.sh` = run a script or program

---

# 🎯 Why this matters for Data Analysts:
Knowing both gives you flexibility. You can automate, batch process, and script operations in a way that GUIs can’t – crucial for data pipelines.


---

## Exercise 1: How does the shell compare to a desktop interface?

**Prompt:**  
An operating system like Windows, Linux, or Mac OS is a special kind of program. It controls the computer's processor, hard drive, and network connection, but its most important job is to run other programs.

Since human beings aren't digital, they need an interface to interact with the operating system. The most common one these days is a graphical file explorer, which translates clicks and double-clicks into commands to open files and run programs. Before computers had graphical displays, though, people typed instructions into a program called a command-line shell. Each time a command is entered, the shell runs some other programs, prints their output in human-readable form, and then displays a prompt to signal that it's ready to accept the next command. (Its name comes from the notion that it's the "outer shell" of the computer.)

Typing commands instead of clicking and dragging may seem clumsy at first, but as you will see, once you start spelling out what you want the computer to do, you can combine old commands to create new ones and automate repetitive operations with just a few keystrokes.

**Question:**  
*What is the relationship between the graphical file explorer that most people use and the command-line shell?*

**Answer:**  
> They are both interfaces for issuing commands to the operating system.

---
