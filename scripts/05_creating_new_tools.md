# 🛠️ Creating New Tools: Shell Scripting for Data Analysts
As a data analyst, automation and reproducibility are everything. The Unix shell lets me go beyond manual command chaining—I can create custom scripts that encapsulate complex workflows, scale batch processing, and eliminate tedious, error-prone repetition. This chapter demonstrates how I turn everyday data problems into robust, portable tools with shell scripting.

---

# 📝 Editing a File with Nano 

## 🌏 Real-World Workflow
Whenever I need to create or tweak a configuration, dataset, or documentation file directly on a server, I use Nano. It's lightweight, always available, and perfect for fast edits—no GUI needed.

#### *Common Nano shortcuts:*
   * ```Ctrl + K``` : Delete a line
   * ```Ctrl + U``` : Un-delete a line
   * ```Ctrl + O``` : Save file (confirm filename with Enter)
   * ```Ctrl + X``` : Exit Nano

#### *Example:*
Create a demo list:

```
nano names.txt
# Add names, save and exit.
```

---

# 📝 Capturing Workflows for Reproducibility

🌍 Real-World Example
To document or debug analyses, I routinely export my last N commands for transparency and version control. Instead of copying by hand, I automate it::

```history | tail -n 10 > recent-steps.txt```

This pipeline guarantees a clear, shareable record of my work. It's an essential part of my workflow—proving what was run, when, and in what order.

---

# 🚀 🚀 Automating Tasks: Shell Scripts in Action

### Why scripts?
   * Run complex commands with one click
   * Share workflows with teammates
   * Guarantee reproducibility

#### *Example:*
**1. Extract the first column from all CSVs:**

   ```cut -d , -f 1 seasonal/*.csv```

**2. Run it with:**

   ```bash dates.sh```

**3. Result:**
   Instant, scalable batch processing!

---

# 🔁 Re-using Pipelines for Real-World Automation
Instead of retyping long command chains, I embed them into scripts for next-level productivity. Example:
teeth.sh:

```cut -d , -f 2 seasonal/*.csv | grep -v Tooth | sort | uniq -c```

This counts unique tooth types across all files—automated, repeatable, and team-ready.

### Workflow:

```
bash teeth.sh > teeth-summary.txt
cat teeth-summary.txt
```

---

# 📦 Dynamic Scripts: Passing Filenames as Arguments
## 🌍 Flexible Data Automation
I never want to rewrite scripts for each new dataset. That’s why I use $@ (all command-line arguments) to process any set of files:

#### ```count-records.sh:```

```wc -l $@```

#### Run on multiple files:

```bash count-records.sh seasonal/*.csv > num-records.out```

This makes my scripts plug-and-play for any batch of data.

---

# 🔥 Multi-Step Scripts: Advanced Batch Reporting
Why run commands one at a time? I automate range checks and audits with multi-line scripts:

### ```range.sh```:

   ```wc -l $@ | grep -v total | sort -n | head -n 1        # shortest```
   
   ```wc -l $@ | grep -v total | sort -n -r | head -n 1     # longest```

### *Usage:*

   ```bash range.sh seasonal/*.csv > range.out```

### *Result:*
Spot incomplete or anomalous files before they break the pipeline!

---

# 🔄 Loops in Shell Scripts: Batch Data Automation
## 🌍 Example: Audit all files for first and last records

#### ```date-range.sh:```
```
for filename in "$@"
do
  head -n 2 "$filename" | tail -n 1
  tail -n 1 "$filename"
done
```

One script = batch validation, scalable and reproducible!

---

# 🛑 Troubleshooting: Stuck Scripts & Missing Filenames
Real-world scripting is messy. Forgetting filenames or arguments can cause a command to hang.
When this happens, my first move is always:

```Ctrl + C```

This instantly stops the running process, letting me recover and debug—without restarting my terminal or losing progress.

---

## 🎯 Business Value & Automation
* **Quality Assurance:** Instantly spot incomplete files or unexpected sizes before they break your pipeline.
* **Reproducibility:** I (or any teammate) can generate the same summary every time, regardless of data updates.
* **Efficiency:** As new data arrives, I simply rerun the script — no manual edits required.
* **Collaboration:** Colleagues use the same tool and get identical, reliable outputs — great for teamwork or onboarding.
* **Auditability:** Every pipeline step is version-controlled, transparent, and easy to review for QA.

---

# 💡 *Bottom Line*
*Saving and re-using pipelines in scripts is my “superpower” as a data analyst.
It keeps my work DRY, robust, and future-proof—ready for anything from daily reports to enterprise-scale batch jobs.*

---

## 🚀 Ready to see more? 

Check out the full pipeline examples and code in my GitHub repo! [Vibes Repositories](https://github.com/VibeHarboe?tab=repositories)

*(All examples here can be adapted for your own analytics, ETL, or reporting workflows.)*



