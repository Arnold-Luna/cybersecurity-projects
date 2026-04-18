# 🚨 Phishing Incident Triage Automation (n8n + Google Sheets)

## 📌 Overview

This project demonstrates an automated phishing detection and incident triage workflow built using **n8n** and **Google Sheets**. The system ingests email data, analyzes it for phishing indicators, classifies risk, and logs structured results into a centralized tracking sheet.

This simulates a real-world **SOC Tier 1 phishing triage process**, combining automation, analysis, and incident documentation.

---

## ⚙️ Workflow Architecture

The pipeline processes emails through multiple stages:

1. **Ingest Emails** – Collect incoming email data
2. **Parse Fields** – Extract relevant attributes
3. **Analyze Email Content** – Detect phishing indicators using logic/AI
4. **Display Results** – Structure analysis output
5. **Append to Google Sheets** – Log incident data

---

## 📊 Screenshots

### 🔹 n8n Workflow Pipeline

![Workflow](screenshots/1-N8N%20workflow.png)

---

### 🔹 Google Sheets Incident Log Output

![Sheet Output](screenshots/2-google%20sheet%20results.png)

---

### 🔹 Append Node Mapping (Data Integration)

![Mapping](screenshots/3-append%20node%20mapping.png)

---

## 🧠 Features

* Automated phishing detection and classification
* Structured incident logging
* Real-time data pipeline execution
* Google Sheets used as a lightweight SIEM/logging system
* JSON field mapping into a tabular data store

---

## 📌 Logged Data Fields

Each processed email generates a structured record:

* **email** – Subject/sender identifier
* **is_suspicious** – Boolean classification (true/false)
* **summary** – Human-readable analysis of the email
* **reasons** – Detailed justification for classification

---

## 🛠️ Tech Stack

* **n8n** – Workflow automation
* **Google Sheets API** – Data storage/logging
* **JSON Processing** – Data transformation and mapping

---

## 🚀 How to Use

1. Import the workflow JSON into n8n
2. Configure Google Sheets OAuth2 credentials
3. Ensure sheet headers match:

   * `email`
   * `is_suspicious`
   * `summary`
   * `reasons`
4. Execute the workflow with email input

---

## 🎯 Use Case

This project replicates a simplified **Security Operations Center (SOC)** workflow:

* Email triage automation
* Threat classification
* Incident documentation
* Centralized tracking for analysis and reporting

---

## 💡 Key Takeaways

* Built an end-to-end automated phishing analysis pipeline
* Integrated external APIs (Google Sheets) for data persistence
* Implemented structured logging aligned with SOC workflows
* Demonstrated ability to design, debug, and deploy automation pipelines

---

## 🔮 Future Improvements

* Add severity scoring (High / Medium / Low)
* Include timestamps for incident tracking
* Integrate alerting (Slack / Email notifications)
* Expand detection logic for attachments and URLs

---

## 👤 Author

Arnold Luna
Cybersecurity | Cloud Security | SOC Analyst Path
