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

