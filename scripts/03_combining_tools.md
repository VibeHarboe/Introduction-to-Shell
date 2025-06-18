# 🧩 Combining Tools: Power Moves in the Unix Shell

As a data analyst, my daily workflows often involve transforming, cleaning, and summarizing large datasets—fast. The real power of the Unix shell isn’t in individual commands, but in how you can chain simple tools together to solve complex, real-world problems. This chapter is packed with my go-to pipelines for efficient data wrangling and automation.

## ✨ What You’ll Learn
  * **Piping and Redirection**: Seamlessly send output from one tool to the next for streamlined workflows.
  * **Selecting Data**: Combine ```cut```, ```grep```, ```head```, and more to get exactly the rows or columns you need.
  * **Sorting Results**: Use ```sort``` to order your data—by dates, numbers, or categories.
  * **Removing Duplicates**: Apply ```uniq``` after ```sort``` to ensure clean, non-redundant datasets.
  * **Real-World Automation**: Chain tools to automate repetitive data-cleaning or QA steps in analytics projects.

---

## 🛠️ Real-World Scenarios
  * Extracting top customer records from a CSV and emailing a summary—all in one line.
  * Sorting log files by timestamp and identifying unique errors in seconds.
  * Filtering, deduplicating, and summarizing millions of rows in seconds, before loading into Python or SQL.

---

# 🚩 Storing Command Output: DataOps Best Practice
In real-world analytics projects, you often want to save results from the shell for further analysis, sharing, or automation. This is where output redirection (```>```) is essential.

#### *Example:*

  ```tail -n 5 seasonal/winter.csv > last.csv```

  * ```tail -n 5``` gets the last 5 lines from your data.
  * ```>``` redirects the output into ```last.csv``` (instead of showing it in the terminal).
  * Ready for reporting, review, or as input to the next step in your pipeline.


### 💡 *Why this matters:*
  * **Automate data** hand-off between tools and teammates
  * Save **intermediate results** for debugging or documentation
  * **Build** repeatable, versioned **pipelines**
  
---

# 🔁 Chaining Commands: Input-Output Magic
You rarely need just the first or last rows of a file. What if you want lines 3–5 from a huge CSV? Chaining commands is how I build flexible, repeatable pipelines:

### *Workflow Example:*
Extract lines 3–5 from a file and save for review.

  ```head -n 5 seasonal/winter.csv | tail -n 3 > midrows.csv```

  * ```head -n 5``` gets the first 5 lines
  * ```tail -n 3``` selects the last 3 of those (i.e., lines 3–5)
  * ```>``` writes result to midrows.csv

<br>

💡 *This pattern—combining ```head```, ```tail```, and redirection — is widely used in real data operations, especially for log analysis, automated quality checks, and pipeline validation.*

---

# 🧩 Combining Commands with Pipes
Instead of cluttering your workspace with intermediate files, use pipes (```|```) to pass data between commands seamlessly.

### *Example:*
Extract all unique tooth types (except the header) from summer data:

```cut -d , -f 2 seasonal/summer.csv | grep -v Tooth | sort | uniq```

 * ```cut``` grabs column 2
 * ```grep -v Tooth``` removes header
 * ```sort | uniq``` deduplicates

One-liners like this mean less manual cleanup, more reproducible analytics, and much faster data exploration.


### 💡 *Business value:*
 * **Cleaner workflow:** Avoids creating temporary files like ```step1.csv```, ```step2.csv```, etc.
 * **Readability:** Keeps the entire transformation in a single, readable line.
 * **Performance:** Reduces disk I/O and clutter.
   
---


# 🔢 Counting Records Fast with wc
When dealing with batch files or big datasets, I use ```wc``` (word count) for a quick record tally:

```wc -l seasonal/summer.csv```

 * ```-l``` counts lines (i.e., records)

### *Why use it?*
 * **Instantly validate** file sizes before/after transformations
 * **Automate sanity checks** in data pipelines

---

# 🌟 Working with Multiple Files: Wildcards
Batch processing is a must in any real data project. Wildcards (```*```, ```?```, ```{}```) let me target multiple files without typos or missed cases.

### *Example:*
Preview the first 3 rows from all spring and summer CSVs:

```head -n 3 seasonal/s*.csv```

### 🚀 *Why Use Wildcards?*

 * **Saves time:** No need to type each file name.
 * **Prevents errors:** Avoids missing or duplicating files by mistake.
 * **Scalable:** Works for any number of files — perfect for automation and scripting.

<br>

💡 *Master wildcards to DRY out your code and automate repetitive tasks across dozens (or hundreds) of files.*

---

## 🎯 Advanced Wildcards: Smart File Selection
Match exactly the files you want—nothing more, nothing less.
E.g., ```ls``` {```singh.pdf```,```j*.txt```} matches only ```singh.pdf``` and ```johel.txt—not``` — not files like ```sandhu.txt```

### ⭐️ Common Wildcards for File Selection

 * ```*``` (asterisk): Matches any number of characters (including none).
   Example: ```*.csv``` matches all CSV files in the directory.
 * ```?``` (question mark): Matches exactly one character.
   Example: ```201?.txt``` matches ```2017.txt```, ```2018.txt``` but not ```2017-01.txt```.
 * ```[abc]```: Matches a single character from the set.
   Example: ```201[78].txt``` matches ```2017.txt``` and ```2018.txt```.
 * ```{pattern1,pattern2}```: Matches any of the comma-separated patterns.
 Example: ```{*.txt,*.csv}``` matches all ```.txt``` and ```.csv``` files.

---

# 🔀 Sorting Data in the Shell
Sorting is crucial for QA, reporting, or prepping for downstream analysis.

```cut -d , -f 2 seasonal/winter.csv | grep -v Tooth | sort -r```

* Get all tooth types in reverse (descending) order.

### *Example:*
 > The ```sort``` command has useful flags:
 * ```-n``` for numerical sort
 * ```-r``` for reverse order
 * ```-b``` to ignore leading blanks
 * ```-f``` for case-insensitive sorting

<br>

💡 *Combine with ```uniq``` for unique values, or add ```head/tail``` for the top/bottom -N (value).*

---

