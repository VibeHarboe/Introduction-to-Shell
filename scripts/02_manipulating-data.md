# 🗃️ Introduction to Shell: Manipulating Data

### Why This Matters as a Data Analyst
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


💡 *If I want to review several files (for example, multiple job logs), I can open them all at once:*

  ```less logs/job1.log logs/job2.log```

  * Type ```:n``` to go to the next file,
  * Type ```:p``` to return to the previous file.
  
### *Why this matters:*

It’s much faster than opening big files in a GUI, especially on servers or in automated workflows.

---

# 👀 Preview Data with ```head```
Before I load data into a pipeline or hand it off to stakeholders, I use head to preview the top rows and ensure everything looks as expected:

  ```head seasonal/summer.csv```

  * See column headers and first few entries
  * Spot data quality issues instantly
  * No need to open spreadsheets or load into pandas

If a file has fewer than 10 lines, head will just show what’s there — no errors or surprises.

<br>

💡 *When exploring unfamiliar datasets, this technique lets me quickly understand what fields are present and spot data quality issues before investing time in deeper analysis.*

---

# 🚀 Speed Up Navigation with ```Tab``` Completion
Efficiency is everything in data ops. Typing out long filenames is slow and error - prone—tab completion is my superpower for fast, accurate navigation.

#### *Example:*

  ```head sea[TAB]a[TAB]     # auto-completes to seasonal/autumn.csv```

  ```head sea[TAB]s[TAB]     # auto-completes to seasonal/spring.csv```


If multiple files match, tap ```[TAB]``` again to see all options and pick the right one.

<br>

💡 *```Tab``` completion isn’t just for convenience — it prevents typos, speeds up navigation, and lets you focus on data insights instead of repetitive typing. Always leverage ```tab``` completion for faster, error-free work in the Shell!*

---

# 🛠️ Fine-tune Commands with Flags
Flags let me customize commands for the job at hand. For example, I can preview just 3 lines instead of the default 10 with:

```head -n 3 seasonal/summer.csv```

Want to see more or fewer lines? Just change the number:

```head -n 100 seasonal/summer.csv```

<br>

💡 *This is especially useful for QA, automation, and debugging data pipelines.*

---

# 🗂️ Recursively Audit Project Structure with ls ```-R```

In real analytics projects, your data and scripts are rarely in a single folder.

  * ```-R``` stands for **recursive:** it will list all directories and subdirectories, showing every file at every level.

When I inherit a messy project or need a snapshot before archiving or sharing, I use recursive listing:

```ls -R```

<br>

💡 *This outputs every file and subfolder — perfect for documentation, troubleshooting, or making sure my ETL outputs landed in the right place.*

---

# 📖 Get Help Instantly with ```man```
No more guessing what a command does — ```man``` brings up the built-in manual, including a one-line description, showing all available flags, usage, and examples.

### *Example:*

  * ```man tail```: This brings up the official manual page, including a one-line description, all supported flags, and concrete usage   examples.

  * ```tail -n 7 seasonal/spring.csv```: This shows the last 7 lines of the specified file.

<br>

💡 *Use ```man``` before copy-pasting code from Stack Overflow. Learn what each flag does and avoid nasty surprises in production.*

---

# ✂️ Select Columns Fast with ```cut```

The cut command is a simple, robust way to grab only the data you need without loading the entire file into a spreadsheet or Python script.

For quick-and-dirty data wrangling (e.g., extracting just the timestamps or IDs), I use:

  ```cut -d , -f 1 spring.csv```

This grabs the first column from a comma-separated file — great for simple transformations or piping into analytics scripts.
<br>

### *Why this matters:*

  * **Efficiency:** Instantly preview or extract just the needed fields, even from massive files.
  * **Automation:** Integrate into batch processing or data-cleaning shell scripts.
  * **Flexibility:** Supports a variety of delimiters (```-d```) and custom column selections (```-f```).

### *Limitations:*

```cut``` can’t handle quoted strings or variable-length fields. For complex CSVs, I use ```awk```, ```csvkit```, or ```pandas```.

<br>

💡 *Use ```cut``` to streamline data wrangling before loading files into more complex analytics tools!*

---

# ⏪ Reuse and Repeat Commands with History
Productivity hack:
  * Arrow keys cycle through previous commands
  * ```history``` lists all recent commands
  * ```!N``` reruns the Nth command, ```!head``` reruns the last ```head```

### *Example:*
   ```
    head summer.csv         # Oops, wrong directory!
    cd seasonal
    !head                   # repeats the last head command
    history                 # See all recent commands with line numbers
    !4                      # Re-run the 4th command from the history
   ```

<br>

💡 *Combine with search (Ctrl+R) and editing to turn your shell into a powerful, error-free productivity tool.* 🚀

---

# 🔎 Filter Rows with grep
I use grep all the time to search, filter, or count lines matching a pattern — way faster than opening in Excel.

  * **Show all** records containing the word "molar":
    ```grep molar seasonal/autumn.csv ```

  * **Exclude** the word "molar" lists every line (with it's number):
    ```grep -v -n molar seasonal/spring.csv ```

  * **Count** number of lines that contain the word "incisor", in multiple files:
    ```grep -c incisor seasonal/*.csv ```

💡 *Chain ```grep``` with other shell tools (like ```cut``` or ```sort```) for even more powerful data wrangling on the fly!*

---

# ⚠️ Know Your Tool’s Limits
Shell tools treat data as plain text, not as true tables. This means things like ```cut``` or ```paste``` can produce wrong results if your data has missing fields or inconsistent formatting.

## *Best practice:*
  * Always check shape with ```wc -l``` before merging.
  * For merges, prefer pandas or ```csvkit``` if your CSVs are complex or have quoted commas.

---

## *Bottom line:*
*The Unix shell makes me faster, more reproducible, and more reliable as a data analyst. These techniques aren’t just for “toy” problems—they’re battle-tested in real data projects and make automation, troubleshooting, and reporting dramatically more effective.* 🚀

