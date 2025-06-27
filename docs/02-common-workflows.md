# ⚡ Common Shell Workflows for Data Analysts

In real-world data projects, shell scripting is not just about running commands—it's about **designing repeatable, scalable workflows** that turn manual tasks into one-click operations. This guide showcases my most-used shell workflows for automation, reporting, and data wrangling.

---

## 📊 Automating Daily Reports

### Scenario:
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


### Why this matters:
This workflow replaces manual file opening and spreadsheet work with a simple, automated pipeline—saving time and reducing errors.

---

