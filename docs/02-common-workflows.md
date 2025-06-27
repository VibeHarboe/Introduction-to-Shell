# ⚡ Common Shell Workflows for Data Analysts

In real-world data projects, shell scripting is not just about running commands—it's about **designing repeatable, scalable workflows** that turn manual tasks into one-click operations. This guide showcases my most-used shell workflows for automation, reporting, and data wrangling.

---

# 📊 Automating Daily Reports

### **Scenario:**
You need to generate and email a daily summary report from new data files delivered every morning.

#### **Workflow Steps:**
1. **Batch process all new CSV files in a folder**
   ```sh
   for file in data/daily/*.csv; do
       # Extract summary stats (e.g., row counts, unique values)
       wc -l "$file" >> logs/daily_rowcounts.txt
   done

2. **Concatenate results and send via email**
   ```sh
   cat logs/daily_rowcounts.txt | mail -s "Daily Report" analytics@company.com


## *Why this matters:*
This workflow replaces manual file opening and spreadsheet work with a simple, automated pipeline—saving time and reducing errors.

---

# 🔄 Batch-Renaming Files

### **Scenario:**
Your vendor delivers files with inconsistent or verbose names. You need to standardize filenames for processing and analytics.

#### **Workflow Steps:**
1. **Rename all files with spaces to underscores:**

   ```sh
   for file in data/raw/*\ *; do
       mv "$file" "${file// /_}"
   done

2. **Add a prefix or suffix to all files:**
   ```sh
   for file in data/raw/*.csv; do
       mv "$file" "data/raw/2024Q2_${file##*/}"
   done

## *Why this matters:*
Standardizing filenames in bulk saves hours and ensures consistency for downstream automation.

---

# 🧹 Batch Data Cleaning in Shell
### **Scenario:**
Before loading into Python, SQL, or BI tools, you need to quickly clean hundreds of raw CSVs—removing headers, empty lines, or problematic rows.

#### **Workflow Steps:**
1. **Remove blank lines from all CSVs:**
   ```sh
   for file in data/cleaned/*.csv; do
       grep -v '^$' "$file" > "tmpfile" && mv "tmpfile" "$file"
   done

2. **Remove header rows and combine all data:**

   ```sh
   for file in data/cleaned/*.csv; do
       tail -n +2 "$file" >> data/combined/all_data.csv
   done

## *Why this matters:*
With just a few lines, you can clean and combine massive data drops—no Excel or manual effort required.

---

# 💡 Bonus: Combining Shell with Python or SQL
Shell excels at pre-processing, but the real magic is when you combine it with Python or SQL for deeper analysis.

   ```sh
   # After batch-cleaning, run your Python analysis pipeline:
   python scripts/analyze_data.py data/combined/all_data.csv
   ```

# 🏆 Best Practices
* Always use quotes ("$file") for filenames with spaces.
* Test on a few files first before running a loop on the full dataset.
* Use logging (e.g., echo, tee, or >> logfile) for transparency and troubleshooting.
* Modularize: Turn common pipelines into scripts you can reuse in other projects.

## 🚀 Bottom Line
Shell scripting supercharges your analytics by turning repetitive, error-prone chores into robust, automated workflows.
Every hour you invest in workflow automation pays off with faster, cleaner, and more reliable results.


> See my other guides in /docs for even more real-world shell techniques!
