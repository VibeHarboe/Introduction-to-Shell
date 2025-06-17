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
If you don’t know the exact command, try searching Stack Overflow or check the “SEE ALSO” section for related commands.

---

# ✂️ Selecting Columns from a File in Real Data Tasks
When working with large CSV files in data analysis or automation, you’ll often need to extract specific columns—such as timestamps, IDs, or features—for downstream processing or quick checks. The ```cut``` command is a simple, robust way to grab only the data you need without loading the entire file into a spreadsheet or Python script.

### 💡 Real-World Scenario
Suppose you’re prepping raw sensor data for a machine learning pipeline. The file ```spring.csv``` contains multiple columns, but you only need the first column (e.g., date) to align data from several sources.

### Solution
The cut command lets you extract specific columns by delimiter. For comma-separated files, the command is:

```cut -d , -f 1 spring.csv```

or equivalently:

```cut -f 1 -d , spring.csv```

Both versions are valid and will output just the first column of ```spring.csv```.

### Terminal Example:
```
$ cut -d , -f 1 spring.csv
# Outputs:
# 2017-01-25
# 2017-02-19
# 2017-02-24
# ...
```

### Why this matters
* **Efficiency:** Instantly preview or extract just the needed fields, even from massive files.
* **Automation:** Integrate into batch processing or data-cleaning shell scripts.
* **Flexibility:** Supports a variety of delimiters (```-d```) and custom column selections (```-f```).

💡 > *Pro tip: Use ```cut``` to streamline data wrangling before loading files into more complex analytics tools!*

---

# 🛠️ Limitation: What Can’t ```cut``` Do? (And Why Does It Matter?)
When working with delimited data in the shell, the ```cut``` command is often used for fast column extraction. But it has some important limitations you need to be aware of in real-world data workflows.

### 💡 Real-World Scenario
Suppose you receive a CSV file containing:

```
Name,Age
"Johel,Ranjit",28
"Sharma,Rupinder",26
```

If you try to extract the age column using:

```cut -f 2 -d , everyone.csv```

You don’t get the correct ages, because ```cut``` simply treats every comma as a separator. Quoted fields (like ```"Johel,Ranjit"```) are not handled correctly. The result is:

```
Age
Ranjit"
Rupinder"
```

*The tool splits inside the quotes, giving you the wrong columns.*

### 🛠️ Command Example: Fields With a Trailing Separator

If you run:

```echo 'first:second:third:' | cut -d : -f 2-4```

The output is:

```second:third:```

Notice: Because of the trailing colon, there’s an “empty” fourth field, but only the second and third are present.

### Takeaway:
```cut``` is fast, but only works well for simple, consistently-formatted delimited data. For robust parsing—especially with quoted text—use tools like ```awk```, ```csvkit```, or Python’s ```csv``` module.

💡 *Know your tool’s limits: use ```cut``` for speed, but switch to more powerful parsing when needed!*

---

# ⏪ Efficient Command Repetition in the Shell
One of the biggest productivity hacks for data professionals is learning how to repeat and re-use commands in the shell. Repetition is not just about speed — it's about reducing errors, working efficiently, and automating your workflow.

### 📝 Problem: Running the Same Data Task Repeatedly
You often need to re-run the same command, maybe after tweaking a script, fixing a typo, or applying a process to different files (e.g., viewing or cleaning similar CSVs). Manually re-typing commands wastes time and increases the risk of mistakes.

### ⚡️ Solution: Shell History & Command Re-run Shortcuts
* **Arrow keys:** Use the up-arrow to cycle through your command history, edit as needed, and press Enter to re-run.
* ```history``` **command:** Run ```history``` to see a list of your previous commands — each with a unique number.
* **Repeat by number:** To instantly re-run, say, the 3rd command in your ```history```, type ```!3```.
* **Repeat by name:** To re-run your most recent use of a specific command (e.g., ```head```), type ```!head```.

### Example Workflow:
```
head summer.csv         # Oops, wrong directory!
cd seasonal
!head                   # Instantly re-run the previous 'head' command
history                 # See all recent commands with line numbers
!4                      # Re-run the 4th command from the history
```

### 💡 Takeaway
Learning to **repeat and re-run commands** with ```!``` and ```history``` lets you move lightning-fast—no more copy-paste or re-typing! This is a must-have trick for anyone automating analytics or wrangling lots of data files in Bash.

### **Pro tip:** 
Combine with search (Ctrl+R) and editing to turn your shell into a powerful, error-free productivity tool. 🚀

---

# 🔎 Filtering Data Efficiently: Using ```grep``` for Line Selection
In real-world data analytics projects, you often need to filter out only the relevant records from large datasets. The shell’s ```grep``` command is a lightning-fast way to extract lines that contain specific values, patterns, or exclude unwanted results entirely. Here are a few hands-on, practical scenarios:

## 🧩 Scenario 1: Find All Matching Lines
Suppose you’re working with a dataset on dental treatments and want to find all autumn records containing the word ```molar```:

```grep molar seasonal/autumn.csv```

This command prints every line in ```autumn.csv``` where “molar” appears.

## 🧩 Scenario 2: Exclude Matches & Show Line Numbers
What if you need to analyze spring data, but want to exclude all ```molar``` treatments and also see the line numbers? The ```-v``` flag inverts the match, and ```-n``` includes line numbers:

```grep -v -n molar seasonal/spring.csv```

This command lists every line (with its number) in ```spring.csv``` that does not contain “molar.”

## 🧩 Scenario 3: Count Occurrences Across Multiple Files
If you need to count how many times a specific value appears — say, how often “incisor” is recorded across autumn and winter datasets—use the ```-c``` flag for count:

```grep -c incisor seasonal/autumn.csv seasonal/winter.csv```

This outputs the number of lines in each file that contain the word “incisor,” helping you quantify cases quickly across multiple datasets.

### Why This Matters
Filtering, excluding, and counting values is core to any data workflow: from QA checks to building pipeline steps or summarizing data for dashboards. Mastering ```grep``` saves hours when parsing logs, CSVs, or any structured text files.

### 💡 Tip: 
*Chain ```grep``` with other shell tools (like ```cut``` or ```sort```) for even more powerful data wrangling on the fly!*

---

# ⚠️ Caution: Treating Data as Plain Text Isn’t Always Safe
When manipulating tabular data in the shell, tools like ```cut```, ```paste```, or even ```cat``` can seem quick and effective for combining or splitting files. But **data isn’t always just “text”** — and this can cause subtle but critical problems in real analysis.

### 🚩 Real-World Scenario: Combining Datasets with ```paste```
Suppose you want to combine two CSV files (e.g., ```autumn.csv``` and ```winter.csv```) into a single table, matching rows side by side. You check the manual page for ```paste``` (```man paste```), then run:

```paste -d , seasonal/autumn.csv seasonal/winter.csv```

At first glance, the output looks fine… but:

### 🛑 What’s the Problem?
> The last few rows have the wrong number of columns.

* If the two files don’t have the same number of lines, ```paste``` simply fills missing values with blanks—leading to misaligned columns, missing values, or malformed rows.
* Downstream tools (R, Python, SQL, etc.) will often fail or produce misleading results when parsing such files.

### 🎯 Key Takeaway
* **Text tools don’t “understand” tables.** They only see lines of characters, not rows and columns of structured data.
* Always check your data’s shape before and after joining or splitting files—especially in automation scripts or batch workflows.
* For reliable merges, consider using dedicated CSV tools (```csvkit```, ```pandas```, ```awk``` with proper field checks) or at least pre-check line counts with ```wc -l```.

💡 *When in doubt, treat your data as structured—not just as plain text. Robust data wrangling starts here!*
