# 🧠 PicoCTF Write-Ups 2026

## 📌 Overview

This repository documents my participation in the **picoCTF 2026 challenges**, showcasing hands-on experience across foundational cybersecurity domains including privilege escalation, file manipulation, and password cracking.

Each writeup follows a structured methodology covering enumeration, exploitation, and analysis, aligning practical skills with real-world security operations and adversary techniques.

---

## 🖥️ Environment

* **Host System:** HP Laptop (Windows, Intel i9)
* **Virtualization:** Kali Linux XFCE (VM)
* **Use Cases:**

  * Remote access (SSH)
  * Privilege escalation testing
  * Password cracking and OSINT analysis

---

## 🎯 Objectives

* Apply core cybersecurity concepts in hands-on scenarios
* Identify and exploit misconfigurations and weak controls
* Develop structured methodologies for CTF problem solving
* Strengthen Linux, OSINT, and password attack techniques
* Build a technical portfolio aligned with SOC and IR roles

---

# 🔍 Challenge Writeups

---

## 🧪 SUDO MAKE ME A SANDWICH

### 🔍 Challenge Overview

* **Platform:** PicoCTF
* **Category:** Privilege Escalation
* **Difficulty:** Easy
* **Points:** 50

### ⚙️ Methodology

* Enumerated directory contents using `ls -la`
* Identified restricted file: `flag.txt`
* Checked sudo privileges using `sudo -l`
* Discovered ability to execute `emacs` as root
* Leveraged elevated privileges to access restricted file

### 🛠️ Tools & Technologies

* Linux CLI
* `sudo` privilege enumeration
* `emacs` (root execution abuse)

### 🧾 Findings & Evidence

* Direct file access was restricted under standard permissions
* Misconfigured sudo permissions allowed privilege escalation
* Successfully accessed the flag using:

```bash
sudo emacs flag.txt
```

### 🧠 Lessons Learned

* Misconfigured sudo rules are a common escalation vector
* Non-obvious binaries can be abused for privilege escalation
* Maps to MITRE ATT&CK technique: **T1548 (Abuse Elevation Control Mechanism)**

---

## 🧪 Piece by Piece

### 🔍 Challenge Overview

* **Platform:** PicoCTF
* **Category:** File Manipulation / Forensics
* **Difficulty:** Easy
* **Points:** 50

### ⚙️ Methodology

* Enumerated files in the home directory
* Identified fragmented file components
* Reconstructed the original file using command-line techniques

### 🛠️ Tools & Technologies

* Linux CLI
* `cat` command
* File wildcard operations

### 🧾 Findings & Evidence

* Multiple file fragments were discovered
* Reconstructed the flag using:

```bash
cat file* > flag.txt
```

* Successfully combined all fragments into a readable output

### 🧠 Lessons Learned

* File fragmentation and reconstruction are common in forensic workflows
* Wildcards improve efficiency when handling multiple files
* Maps to **T1005 (Data from Local System)** and data reconstruction techniques

---

## 🧪 Password Profiler

### 🔍 Challenge Overview

* **Platform:** PicoCTF
* **Category:** Password Cracking / OSINT
* **Difficulty:** Medium
* **Points:** 100

### ⚙️ Methodology

* Analyzed `userinfo.txt` for OSINT-derived attributes
* Generated a targeted password list using CUPP
* Executed password cracking using the generated wordlist
* Validated results using the provided script

### 🛠️ Tools & Technologies

* CUPP (Common User Passwords Profiler)
* Python password verification script
* OSINT-based wordlist generation

### 🧾 Findings & Evidence

* Extracted meaningful personal data to generate a custom wordlist
* Targeted password list significantly improved cracking efficiency
* Successfully recovered the password by matching the hash

### 🧠 Lessons Learned

* OSINT-driven attacks are highly effective against weak password hygiene
* Custom wordlists outperform generic dictionaries
* Maps to **T1110 (Brute Force)** and credential attack techniques

---

## 🔐 Skills Demonstrated

* Privilege escalation and access control analysis
* Linux command-line proficiency
* File reconstruction and forensic techniques
* Password cracking and OSINT application
* Structured problem solving and attack methodology

---

## 🚀 Continuous Improvement

This repository will continue to expand with more advanced CTF challenges, incorporating deeper analysis in areas such as web exploitation, network traffic analysis, reverse engineering, and cloud security.
Each writeup reflects an evolving skillset aligned with real-world threat detection, incident response, and adversary simulation.
