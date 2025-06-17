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

> 💡 Tip:
> Output redirection (```>```) works with nearly every shell command—making it a core part of any data analyst’s toolkit!

---

# 🔁 How to Chain Commands and Use Outputs as Inputs in Shell
In real-world data work, you’ll often need to extract specific rows or columns—not just from the start or end of files, but from anywhere in your dataset. Shell redirection and chaining commands is a powerful way to do this, especially when working with CSV or log files.

### 🗃️ Scenario: Extracting Specific Lines from a Large Data File
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

> 💡 Pro tip:
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

> 💡 Tip:
> Pipes (```|```) are the backbone of efficient shell workflows. They help you chain together powerful, single-purpose tools into robust, automated data wrangling pipelines—perfect for analytics and reporting tasks.

---

