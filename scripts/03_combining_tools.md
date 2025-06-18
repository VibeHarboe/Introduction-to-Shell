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


### *Why this matters:*
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


