# 🛠️ Creating New Tools
In my workflow as a data analyst, reusing and automating processes is key to efficiency and accuracy. The Unix shell is not just for stringing together existing commands—it also empowers you to create your own tools and scripts, streamlining repetitive tasks and enabling advanced automation. In this chapter, I demonstrate how to write and use custom shell scripts to boost productivity in real-world data projects.

### **Key Concepts:**
* Writing and running shell scripts (```.sh``` files)
* Making scripts executable and placing them in your ```PATH```
* Using variables, arguments, and loops in scripts
* Turning complex command sequences into reusable tools
* Showcasing practical automation for data cleaning, file management, and reporting

Below, I present hands-on examples of how these scripting skills solve common data and workflow challenges.

---

# 📝 Editing a File with Nano 

### 🌏 Real-world scenario:
Whenever I need to create or update a quick configuration file, document, or data list directly on a server or in a project, I reach for the Nano editor. It’s lightweight, always available, and easy to use—perfect for batch scripting or quick fixes.

#### 💡 Step-by-step:

**1. Open (or create) a new file for editing:**
   ```nano names.txt```

**2. Use these common Nano keyboard shortcuts:**

   * ```Ctrl + K``` : Delete a line
   * ```Ctrl + U``` : Un-delete a line
   * ```Ctrl + O``` : Save the file (press Enter to confirm the filename)
   * ```Ctrl + X``` : Exit Nano

**3. Example file content for a team list or demo data:**
```
Lovelace
Hopper
Johnson
Wilson
```

**4. Save and exit as shown above.**
This approach keeps my shell workflow fast and flexible, without ever leaving the terminal.

---

# 📝 Capturing Command-Line Workflows with History
When I run complex analyses in the Unix shell, it’s essential to keep a clear record of the exact commands I’ve used—both for reproducibility and knowledge sharing. Rather than manually jotting down steps in a notebook, I leverage the power of history and standard shell tools.

### 🌏 Real-world scenario:
Let’s say I want to save the last 10 commands I executed, perhaps as documentation for a project or to troubleshoot a recent workflow. Here’s how I do it:

```history | tail -n 10 > figure-5.history```

This command grabs the last three lines from your shell history and saves them in a text file called ```steps.txt``` for easy reference or sharing.

#### Typical workflow:
* ```history``` prints the full list of previously executed commands.
* ```tail -n 10``` extracts the 10 most recent commands.
* ```> figure-5.history``` redirects the output into a file for future reference.

This simple pipeline ensures I never miss a step and that my processes are fully reproducible. This approach demonstrates a key Unix philosophy: combining small, powerful tools to create efficient, auditable workflows.

### 💡 Tip: 
> *Regularly exporting your shell history helps maintain a transparent, shareable record of your data analyses and automation tasks!*

---

# 🚀 Save and Re-Run Commands Automatically: Creating and Using Shell Scripts
One of the key skills in professional shell work is automating tasks by saving your commands into scripts. Instead of typing complex or repetitive commands again and again, I create .sh files to store my command sequences. This lets me re-run them reliably, share them with others, and keep my analyses reproducible.

### 🌏 Real-world example:
Suppose I want to extract the first column from every CSV file in my seasonal directory. Instead of running the command manually each time, I save it in a file named dates.sh:

```cut -d , -f 1 seasonal/*.csv```

I then execute the script with:

```bash dates.sh```

This runs the command and extracts all the date columns across my dataset – quickly, repeatably, and with a single command. This is not just a time saver: it's the foundation for building robust, automated data pipelines in Unix.

### 🎯 Why this matters:
* Reproducibility: Anyone can re-run my workflow exactly as I did.
* Documentation: My scripts serve as living documentation for my analysis process.
* Scalability: I can chain scripts, schedule them, or plug them into larger automation frameworks.

---
