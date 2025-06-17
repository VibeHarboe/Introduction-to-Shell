# 🧩 Combining Tools: Power Moves in the Unix Shell

The real power of the Unix shell is not just in single commands — but in how easily you can combine simple tools to solve complex, real-world problems. This chapter is all about chaining commands, selecting relevant data, sorting, and removing duplicates — essentials for efficient data wrangling and automation as a data analyst.

## ✨ What You’ll Learn
* **Piping and Redirection**
  Seamlessly send output from one tool to the next for streamlined workflows.

* **Selecting Data**
  Combine ```cut```, ```grep```, ```head```, and more to get exactly the rows or columns you need.

* **Sorting Results**
  Use ```sort``` to order your data—by dates, numbers, or categories.

* **Removing Duplicates**
  Apply ```uniq``` after ```sort``` to ensure clean, non-redundant datasets.

* **Real-World Automation**
  Chain tools to automate repetitive data-cleaning or QA steps in analytics projects.


## 🛠️ Real-World Scenarios
* Extracting top customer records from a CSV and emailing a summary—all in one line.
* Sorting log files by timestamp and finding unique error messages.
* Filtering, deduplicating, and summarizing millions of rows in seconds, before loading into Python or SQL.

---

# 🚩 Storing Command Output for Data Projects
In real-world data work, you often want to capture the results of your shell commands—not just display them in the terminal, but save them as new files for further analysis, documentation, or sharing. This is where shell output redirection becomes a must-have tool!

### 💡 Real-World Example:
Imagine you’re working on a dental research project, and you need to extract just the last 5 records from a large CSV log of winter dental surgeries. Instead of scrolling through the whole file every time, you want a separate file (```last.csv```) that always holds the latest 5 rows—ready for reporting or loading into another tool.

```tail -n 5 seasonal/winter.csv > last.csv```

* ```tail -n 5 seasonal/winter.csv``` gets the last 5 lines from your data.
* ```>``` redirects the output into ```last.csv``` (instead of showing it in the terminal).
* Now, ```last.csv``` is ready for downstream analysis, versioning, or sharing.

### Why Use Output Redirection?
* **Automate workflows:** Save intermediate steps as files for pipelines or reproducible research.
* **Error tracking:** Keep logs and outputs for troubleshooting or documentation.
* **Data hand-off:** Easily share results with collaborators, or move them between systems.

#### 💡 Tip:
> Output redirection (```>```) works with nearly every shell command—making it a core part of any data analyst’s toolkit!

---

# 🔁 How to Chain Commands and Use Outputs as Inputs in Shell
In real-world data work, you’ll often need to extract specific rows or columns—not just from the start or end of files, but from anywhere in your dataset. Shell redirection and chaining commands is a powerful way to do this, especially when working with CSV or log files.

### 🗃️ Real-World Scenario: Extracting Specific Lines from a Large Data File
#### **Problem:**
You need to extract lines 3–5 from a large CSV file (```seasonal/winter.csv```) and save them for downstream processing.

#### **Solution:**
Combine basic commands with redirection and use one command’s output as the next command’s input. Here’s how:

1. **Extract the Last Two Lines and Save Them**
    Use ```tail``` to grab the last 2 lines of the file and redirect (```>```) the result to ```bottom.csv```:

    ```tail -n 2 seasonal/winter.csv > bottom.csv```

2. **Extract the First Line from the Output**
    Now, use ```head``` to select just the first of those two lines (the "second-to-last" line in the original file):

   ```head -n 1 bottom.csv```

### Why does this matter?
This workflow lets you build flexible, repeatable data pipelines without manual editing or heavy scripting. You can chain as many commands as you need to filter, clean, and extract only the data you need.

#### 💡 Tip:
> This pattern—combining ```head```, ```tail```, and redirection—is widely used in real data operations, especially for log analysis, automated quality checks, and pipeline validation.

---

# 🧩 Combining Commands Efficiently with Pipes
In real-world data projects, it's common to transform and filter data in several steps. If you use intermediate files for each step (e.g., ```top.csv```), you quickly end up with a messy workspace and a fragmented workflow. To keep things efficient and reproducible, you should combine commands with pipes.

### 🚀 Why use pipes?
* Cleaner workflow: Avoids creating temporary files like ```step1.csv```, ```step2.csv```, etc.
* Readability: Keeps the entire transformation in a single, readable line.
* Performance: Reduces disk I/O and clutter.

### Example: Filtering data without intermediate files
Let’s say you want to extract all tooth types from column 2 in seasonal/summer.csv, but want to exclude rows with the word "Tooth" in the header.

Instead of:
```
cut -d , -f 2 seasonal/summer.csv > teeth.csv
grep -v Tooth teeth.csv
```

You can do it all in one step using a pipe:

```cut -d , -f 2 seasonal/summer.csv | grep -v Tooth```

This way, ```cut``` sends its output directly to ```grep```, which filters out the unwanted rows—no need to save intermediate files!

#### 💡 Tip:
> Pipes (```|```) are the backbone of efficient shell workflows. They help you chain together powerful, single-purpose tools into robust, automated data wrangling pipelines—perfect for analytics and reporting tasks.

---

# 🔗 Chaining Shell Commands for Data Extraction
In real-world data analysis, you often need to filter, clean, and select data in one seamless operation—not as separate steps. Instead of writing temporary files for each step, you can chain multiple commands with pipes (```|```) to make your workflow faster, cleaner, and more reproducible.

### 💡 Real-World Scenario:
Suppose you need to extract a specific value from a CSV dataset:
* You want all tooth types except those labeled "Tooth" (header) from ```seasonal/summer.csv```.
* Finally, you want to return only the very first value found.

Efficient one-liner:

```cut -d , -f 2 seasonal/summer.csv | grep -v Tooth | head -n 1```

### How it works:
* ```cut -d , -f 2 seasonal/summer.csv```: Extracts the second column (tooth types) from the file.
* ```grep -v Tooth```: Removes lines containing the word "Tooth" (skipping the header).
* ```head -n 1```: Returns only the first tooth type found in the filtered data.

### 🎯 Business value:
This chaining technique means you can instantly get targeted results—no manual cleaning, no temp files—boosting your speed when handling large, messy datasets.

---

# 🔢 Counting Records Efficiently with ```wc```
In everyday data analysis, you often need to quickly check the number of records, lines, or values in a dataset before diving deeper. The Unix command-line utility ```wc``` (word count) is a must-have for this task!

### 💡 Real-World Scenario:
Suppose you're working with a data file—maybe a CSV of dental visits or logs from a batch job—and need to know exactly how many records you’re dealing with. Instead of opening the file in Excel or scrolling endlessly, use ```wc``` for a one-line answer.

Quick usage:

```wc -l seasonal/summer.csv```

* ```-l``` counts the number of lines (records).
* Replace with ```-w``` for words or ```-c``` for bytes/characters if needed.

### Example Output

```10 seasonal/summer.csv```

This tells you there are 10 records (lines) in ```summer.csv``` — instantly.

### 🎯 Business value:
This technique saves time and ensures accuracy, especially when checking imports, validating data loads, or auditing pipeline steps. Fast, simple, and robust!

---

# 🌟 Handling Multiple Files with Wildcards in the Shell
When managing real-world data projects, you rarely process a single file at a time. Whether you’re generating monthly reports, transforming batches of CSV exports, or cleaning up server logs, it’s common to apply the same command to many files in a directory.

### 🔍 Example Scenario
Suppose you want to preview the first three rows from both ```seasonal/spring.csv``` and ```seasonal/summer.csv``` (but not the other seasonal files). Instead of manually typing every filename, use a wildcard (```*```) to automate the task and minimize errors:

  ```head -n 3 seasonal/s*```

* This command returns the top three lines from all files in ```seasonal/``` whose names start with "s" (such as ```spring.csv``` and ```summer.csv```), skipping others like ```autumn.csv``` and ```winter.csv```.

### 🚀 Why Use Wildcards?
* **Saves time:** No need to type each file name.
* **Prevents errors:** Avoids missing or duplicating files by mistake.
* **Scalable:** Works for any number of files—perfect for automation and scripting.

### 💡 Pro tip: 
> *In large-scale data projects, wildcards make it much easier to scale your processing pipeline and keep your workflow DRY (Don’t Repeat Yourself)!*

---

# 🎯 Advanced Shell Wildcards: Precision File Selection
In real-world data analysis, you often need to batch-process or filter files—especially when dealing with large datasets, multiple report types, or programmatic workflows. Wildcards in the shell let you flexibly match file patterns without having to manually type each filename, reducing errors and saving time.

### ⭐️ Common Wildcards for File Selection
* ```*``` (asterisk): Matches any number of characters (including none).
  Example: ```*.csv``` matches all CSV files in the directory.

* ```?``` (question mark): Matches exactly one character.
  Example: ```201?.txt``` matches ```2017.txt```, ```2018.txt``` but not ```2017-01.txt```.

* ```[abc]```: Matches a single character from the set.
  Example: ```201[78].txt``` matches ```2017.txt``` and ```2018.txt```.

* ```{pattern1,pattern2}```: Matches any of the comma-separated patterns.
Example: ```{*.txt,*.csv}``` matches all ```.txt``` and ```.csv``` files.

### 🧑‍💻 Example Use Case
Suppose your project folder contains:
* ```singh.pdf```
* ```johel.txt```
* ```sandhu.pdf```
* ```sandhu.txt```

If you need to select only ```singh.pdf``` and ```johel.txt``` (but not the ```sandhu``` files), you can use:

```ls {singh.pdf,j*.txt}```

#### This expression matches:
* The exact file ```singh.pdf```
* Any ```.txt``` file starting with the letter ```j``` (such as ```johel.txt```)

### 🚀 Why It Matters
Mastering wildcards helps automate repetitive tasks, improves precision in file selection, and reduces manual errors—key benefits for any data analyst or developer handling complex directory structures or bulk data operations.

### 💡 Tip: 
> Use advanced wildcards when you need fine-grained file selection for scripting, batch processing, or quality control.

---

# 🔀 Sorting Output in Real-World Shell Data Tasks
Sorting data efficiently is a key part of real-world data workflows, whether you’re cleaning up CSVs, organizing logs, or preparing data for analysis. In the shell, the ```sort``` command makes this easy and powerful.

### 📌 Real-World Scenario
Suppose you want to list all unique tooth names from a dental dataset and see them in reverse alphabetical order – for example, to check which types are present or to prepare for frequency analysis. Here’s how you’d do it:

```cut -d , -f 2 seasonal/winter.csv | grep -v Tooth | sort -r```

* ```cut -d , -f 2 seasonal/winter.csv``` selects the second column (tooth type) from your CSV file.
* ```grep -v Tooth``` removes the header row (anything matching "Tooth").
* ```sort -r``` sorts the output in reverse (descending) alphabetical order.

### 🏆 Result:
This pipeline lists all tooth types from your winter dataset, sorted from Z to A. This is a common real-world task when validating categorical data, prepping values for encoding, or generating reports.

### 💡 Tip:
> The ```sort``` command has useful flags:
* ```-n``` for numerical sort
* ```-r``` for reverse order
* ```-b``` to ignore leading blanks
* ```-f``` for case-insensitive sorting

Combine with ```uniq``` for deduplication, or add ```head/tail``` for top/bottom values!

---

#
