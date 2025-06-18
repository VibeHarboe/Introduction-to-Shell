# 🗃️ Introduction to Shell: Manipulating Data

# Why This Matters as a Data Analyst
As a data analyst, much of my day is spent wrangling, exploring, and validating raw data. The Unix shell isn’t just an old-school tool—it’s an essential part of any serious analytics workflow. This chapter demonstrates how I use the shell’s built-in commands to search, filter, preview, and transform data files—making my pipelines faster, more reproducible, and scalable.

---

# 📂 Rapid File Inspection with cat
When working on real data projects, I often need to **quickly inspect the contents of a file** — whether to verify a data export, check a config, or debug a broken script. The ```cat``` command prints any file’s content directly to the terminal, making this process instant:

  ```cat course.txt```

### *Use case:*

Check the structure of a file before further processing or importing into R/Python.

---

# 📖 Paging Large Files with ```less```
Big log files and datasets don’t fit on one screen! I rely on ```less``` to page through huge files, search interactively, and move up/down quickly:

less logs/pipeline.log
  * ```spacebar```: scroll forward
  * ```b:``` scroll back
  * ```/text```: search for "text"
  * ```q:``` quit

### *Why this matters:*

It’s much faster than opening big files in a GUI, especially on servers or in automated workflows.

---

# 👀 Preview Data with head
Before I load data into a pipeline or hand it off to stakeholders, I use head to preview the top rows and ensure everything looks as expected:

  ```head seasonal/summer.csv```

  * See column headers and first few entries
  * Spot data quality issues instantly
  * No need to open spreadsheets or load into pandas

If a file has fewer than 10 lines, head will just show what’s there — no errors or surprises.

---

# 🚀 Speed Up Navigation with Tab Completion
Efficiency is everything in data ops. Typing out long filenames is slow and error - prone—tab completion is my superpower for fast, accurate navigation.

*Example:*

  ```head sea[TAB]a[TAB]     # auto-completes to seasonal/autumn.csv```

  ```head sea[TAB]s[TAB]     # auto-completes to seasonal/spring.csv```

If multiple files match, tap ```[TAB]``` again to see all options and pick the right one.

---

# 🛠️ Fine-tune Commands with Flags
Flags let me customize commands for the job at hand. For example, I can preview just 3 lines instead of the default 10 with:

```head -n 3 seasonal/summer.csv```

Want to see more or fewer lines? Just change the number:

```head -n 100 seasonal/summer.csv```

*This is especially useful for QA, automation, and debugging data pipelines.*

---

# 📖 Get Help Instantly with man
No more guessing what a command does —```man``` brings up the built-in manual, showing all available flags, usage, and examples.

#### *Example:*

```man tail```

#### *Best practice:*
Use ```man``` before copy-pasting code from Stack Overflow. Learn what each flag does and avoid nasty surprises in production.

---

# ✂️ Select Columns Fast with cut
For quick-and-dirty data wrangling (e.g., extracting just the timestamps or IDs), I use:

```cut -d , -f 1 spring.csv```

This grabs the first column from a comma-separated file — great for simple transformations or piping into analytics scripts.

#### *Limitations:*

```cut``` can’t handle quoted strings or variable-length fields. For complex CSVs, I use ```awk```, ```csvkit```, or ```pandas```.

---

# ⏪ Reuse and Repeat Commands with History
Productivity hack:
  * Arrow keys cycle through previous commands
  * ```history``` lists all recent commands
  * ```!N``` reruns the Nth command, ```!head``` reruns the last ```head```

#### *Example:*

 ```cd seasonal```

 ```!head    # repeats the last head command```

---

# 🔎 Filter Rows with grep
I use grep all the time to search, filter, or count lines matching a pattern — way faster than opening in Excel.

  * **Show all** lines with "molar":
    ```grep molar seasonal/autumn.csv ```

  * **Exclude** "molar" and show line numbers:
    ```grep -v -n molar seasonal/spring.csv ```

  * **Count** "incisor" in multiple files:
    ```grep -c incisor seasonal/*.csv ```

---

# ⚠️ Know Your Tool’s Limits
Shell tools treat data as plain text, not as true tables. This means things like ```cut``` or ```paste``` can produce wrong results if your data has missing fields or inconsistent formatting.

## *Best practice:*
  * Always check shape with ```wc -l``` before merging.
  * For merges, prefer pandas or ```csvkit``` if your CSVs are complex or have quoted commas.

---

## *Bottom line:*
*The Unix shell makes me faster, more reproducible, and more reliable as a data analyst. These techniques aren’t just for “toy” problems—they’re battle-tested in real data projects and make automation, troubleshooting, and reporting dramatically more effective.* 🚀


