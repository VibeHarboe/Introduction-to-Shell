# 🗃️ Introduction to Shell – Chapter 2: Manipulating Data

### **Theme:**  
While the first chapter focused on moving and organizing files and directories, this chapter is all about **working with the data inside those files**. Here, I use essential shell tools to search, filter, extract, and transform data efficiently—crucial skills for data analytics, automation, and reporting.

### **Approach:**  
All commands and workflows are presented as practical building blocks for real-world data projects—not as isolated exercises, but as proven techniques for scalable and repeatable results.

---

# 📂 Viewing File Contents in the Shell
In data projects, it’s often necessary to quickly inspect the contents of a file without opening a text editor or importing it into another program. The Unix ```cat``` command is a simple yet powerful tool for this purpose. By running ```cat <filename>```, you can instantly print the contents of any file to the terminal. This is invaluable for data analysts who need to verify data, check configuration files, or debug scripts.

### Example:
```cat course.txt```

This command prints the full content of ```course.txt``` to the screen, allowing you to review its structure and information in a matter of seconds. It’s especially handy when you’re automating workflows or working on remote servers where GUI access isn’t available.

---

# 📖 Paging Through Large Files with less
When I work with large datasets, log files, or configuration files, it’s not practical to print the entire file to the terminal using ```cat``` — especially if the file is hundreds eller thousands of lines. That’s where the ```less``` command becomes indispensable.

## 🛠️ Real-World Example
Suppose I’m debugging a complex ETL pipeline, and need to quickly scan the first few pages of a long log file:

```less logs/pipeline.log```

* Press ```spacebar``` to page down,
* Press ```b``` to page up,
* Type ```q``` to quit when done.

If I want to review several files (for example, multiple job logs), I can open them all at once:

```less logs/job1.log logs/job2.log```

* Type ```:n``` to go to the next file,
* Type ```:p``` to return to the previous file.

### Why use ```less```?

* It saves time (no need to scroll up and down endlessly),
* It makes it easy to search with ```/``` (just like in Vim),
* It’s essential for troubleshooting on remote servers where text editors aren’t available.

---

# 👀 Previewing Data Files with ```head```
### Scenario:
Before processing new datasets, it's crucial to quickly preview their structure and contents. For instance, when dealing with CSV files exported from databases or spreadsheets, I use the ```head``` command to instantly check the first few rows and validate the data format.

```head seasonal/summer.csv```

### Output Example:

```
Date,Tooth
2017-01-11,canine
2017-01-18,wisdom
2017-01-21,bicuspid
2017-02-02,molar
2017-02-27,wisdom
2017-02-27,wisdom
2017-03-07,bicuspid
2017-03-15,wisdom
2017-03-20,canine
```

### What happens if there aren't 10 lines?
head will simply display as many lines as are available in the file – no errors or blank rows added.

## 💡 Real-World Usage:
> When exploring unfamiliar datasets, this technique lets me quickly understand what fields are present and spot data quality issues before investing time in deeper analysis.

---

