# 🗃️ Introduction to Shell: Manipulating Data

### **Theme:**  
While the first chapter focused on moving and organizing files and directories, this chapter is all about **working with the data inside those files**. Here, I use essential shell tools to search, filter, extract, and transform data efficiently—crucial skills for data analytics, automation, and reporting.

### **Approach:**  
All commands and workflows are presented as practical building blocks for real-world data projects—not as isolated exercises, but as proven techniques for scalable and repeatable results.

---

# 📂 Viewing File Contents in the Shell
In data projects, it’s often necessary to quickly inspect the contents of a file without opening a text editor or importing it into another program. The Unix ```cat``` command is a simple yet powerful tool for this purpose. By running ```cat <filename>```, you can instantly print the contents of any file to the terminal. This is invaluable for data analysts who need to verify data, check configuration files, or debug scripts.

### Example:
```cat course.txt```

This command prints the full content of ```course.txt``` to the screen, allowing you to review its structure and information in a matter of seconds. It’s especially handy when you’re automating workflows or working on remote servers where GUI access isn’t available.

---

# 📖 Paging Through Large Files with less
When I work with large datasets, log files, or configuration files, it’s not practical to print the entire file to the terminal using ```cat``` — especially if the file is hundreds eller thousands of lines. That’s where the ```less``` command becomes indispensable.

## 🛠️ Real-World Example
Suppose I’m debugging a complex ETL pipeline, and need to quickly scan the first few pages of a long log file:

```less logs/pipeline.log```

* Press ```spacebar``` to page down,
* Press ```b``` to page up,
* Type ```q``` to quit when done.

If I want to review several files (for example, multiple job logs), I can open them all at once:

```less logs/job1.log logs/job2.log```

* Type ```:n``` to go to the next file,
* Type ```:p``` to return to the previous file.

### Why use ```less```?

* It saves time (no need to scroll up and down endlessly),
* It makes it easy to search with ```/``` (just like in Vim),
* It’s essential for troubleshooting on remote servers where text editors aren’t available.

---

# 👀 Previewing Data Files with ```head```
### Scenario:
Before processing new datasets, it's crucial to quickly preview their structure and contents. For instance, when dealing with CSV files exported from databases or spreadsheets, I use the ```head``` command to instantly check the first few rows and validate the data format.

```head seasonal/summer.csv```

### Output Example:

```
Date,Tooth
2017-01-11,canine
2017-01-18,wisdom
2017-01-21,bicuspid
2017-02-02,molar
2017-02-27,wisdom
2017-02-27,wisdom
2017-03-07,bicuspid
2017-03-15,wisdom
2017-03-20,canine
```

### What happens if there aren't 10 lines?
head will simply display as many lines as are available in the file – no errors or blank rows added.

## 💡 Real-World Usage:
> When exploring unfamiliar datasets, this technique lets me quickly understand what fields are present and spot data quality issues before investing time in deeper analysis.

---

# 🚀 Efficient Navigation: Using Tab Completion in the Shell
When working with large directories or numerous files, typing out full file or directory names every time is both time-consuming and error-prone. In real-world data projects, speed and accuracy matter — especially when you’re wrangling dozens of CSVs or scripts in your daily workflows.

### Solution:
The shell’s **tab completion** lets you quickly and safely auto-complete file and folder names. Just start typing, hit ```Tab```, and let the shell fill in the rest!

### Example Scenario
Suppose you’re exploring seasonal dental data and want to look at ```autumn.csv``` and ```spring.csv``` in your ```seasonal``` folder. Instead of typing the full path:

```
head seasonal/autumn.csv
head seasonal/spring.csv
```
You can type:

```
head sea[TAB]a[TAB]
head sea[TAB]s[TAB]
```

… and the shell will auto-complete to ```seasonal/autumn.csv``` and ```seasonal/spring.csv``` for you.

If the prefix is ambiguous (e.g., ```seasonal/s[TAB]```), hit ```Tab``` again to see all possible completions and pick the right file.

### Takeaway:
Tab completion isn’t just for convenience—it prevents typos, speeds up navigation, and lets you focus on data insights instead of repetitive typing.
💡 *Always leverage tab completion for faster, error-free work in the shell!*

---

# 🛠️ Fine-tuning Shell Commands with Flags
In real data projects, standard commands often need to be customized to fit the specific task at hand. That's where command-line flags become invaluable—they allow me to control exactly how much output I get, keeping my workflows efficient and focused.

### Scenario
Suppose I need to quickly check only the first three lines of a CSV file—maybe to verify column headers or to preview the first few data entries before starting a larger analysis. With the ```head``` command, I can easily adjust how many lines I see by using the ```-n``` flag:

```head -n 3 seasonal/summer.csv```

Want to see more or fewer lines? Just change the number:

```head -n 100 seasonal/summer.csv```

### Why is this important?

* I avoid unnecessary scrolling and cluttered output
* It lets me debug data imports or scripts efficiently
* When automated in scripts, it keeps logs clean and easy to review

### 🔑 Best practice:
> Always put flags (like ```-n```) before filenames for clarity and portability. This ensures that your commands work consistently across different Unix environments.

---

# 🗂️ Explore Every File in Your Data Project (Recursive Listing)
In real analytics projects, your data and scripts are rarely in a single folder. You’ll often need to **see the full folder tree**, including every subdirectory and file—especially when troubleshooting, sharing, or cleaning up after an analysis sprint.

### 💡 How I do it in practice
Instead of clicking endlessly through folder after folder, I use the shell’s recursive listing to audit my project structure in seconds:

```ls -R```

* ```-R``` stands for **recursive**: it will list all directories and subdirectories, showing every file at every level.

### Example Output:

```
backup    course.txt    people    seasonal

./backup:

./people:
agarwal.txt

./seasonal:
autumn.csv   spring.csv   summer.csv   winter.csv
```

### 🚦 Real-World Uses:
* **Quickly audit** a repo before sharing, submitting, or deleting.
* **Find missing files** or check that output landed in the right subfolder.
* **Create documentation:** Copy the structure into your README for clarity!

### Key takeaway:
Recursive listing (```ls -R```) is a simple, fast way to ensure you never lose track of files in even the most complex analytics pipelines.

✨ *One command, complete overview!*

---

# 📖 How to Get Help with Any Shell Command
In real-world data projects, you’ll often come across a new shell command or flag you haven’t used before. Whether you’re automating a data pipeline, debugging a script, or collaborating in a larger team, knowing how to quickly access reliable documentation is essential.

### Why Use the Shell Manual (```man```)?
The ```man``` (manual) command lets you instantly look up official documentation for almost any Unix/Linux shell command—directly from your terminal, even if you’re offline.

### 💡 Real-world Example
Suppose you’re trying to preview only the last lines of a large log file using the ```tail``` command, but you can’t remember how to adjust the number of lines displayed. Instead of searching online, you simply run:

```man tail```

This brings up the official manual page, including a one-line description, all supported flags, and concrete usage examples. For example, you’ll quickly see that:

* ```tail -n 7 seasonal/spring.csv```
  shows the last 7 lines of the specified file.

And if you want to page through the help text, use spacebar to scroll, and type ```:q``` to exit.

### 🛠️ Pro Tips
* **Navigation:**
  * Press ```spacebar``` to scroll down a page
  * Use ```q``` or ```:q``` to quit the manual viewer

* **Find Flags Quickly:**
  * Flags (like ```-n```) are always listed in the SYNOPSIS section
  * Optional parameters are shown in square brackets ```[ ]```
  * Alternatives are separated by ```|```

* **Troubleshooting:**
If you don’t know the exact command, try searching Stack Overflow.

---


