# 🚀 Self-Hosted AI-Powered DISA STIG CKL → POA&M Automation Pipeline using n8n + Ollama

## 📌 Project Overview
This project automates the transformation of **DISA STIG CKL/XML checklist findings into POA&M-ready CSV artifacts** using a **self-hosted n8n workflow enhanced with local Ollama AI**.

The workflow ingests raw STIG checklist evidence, normalizes XML data into structured JSON, applies remediation logic, and uses a **local LLM (Ollama)** to generate:
- finding summaries
- remediation recommendations
- closure validation guidance

All AI processing occurs **locally on-host**, ensuring sensitive compliance evidence never leaves the environment.

This simulates a real-world **RMF / ISSO / FedRAMP continuous monitoring workflow** used for vulnerability governance and audit preparation.

---

## 🧠 Key Features
- ✅ CKL/XML evidence ingestion
- ✅ XML → JSON normalization
- ✅ JavaScript-based transformation logic
- ✅ CAT I / II / III risk prioritization
- ✅ POA&M row generation
- ✅ milestone and ownership mapping
- ✅ **local Ollama AI enrichment**
- ✅ finding_summary generation
- ✅ recommended_fix generation
- ✅ closure_validation generation
- ✅ CSV export for audit-ready artifacts
- ✅ self-hosted secure workflow orchestration

---

## ⚙️ Workflow Architecture
The workflow follows this transformation lifecycle:

```text
CKL/XML Import
   ↓
Extract from File
   ↓
XML to JSON
   ↓
POA&M Logic
   ↓
Limit (AI Demo Finding)
   ↓
Basic LLM Chain
   ↓
Local Ollama Model
   ↓
Build POA&M Rows
   ↓
Convert JSON to CSV
```

This architecture demonstrates how **workflow automation and local AI enrichment can accelerate RMF evidence production** while preserving data sovereignty.

---

## 🔍 Compliance Automation Evidence Walkthrough
A full screenshot-based evidence walkthrough is included in:

```text
Screenshots/README.md
```

This documents:
- workflow orchestration
- AI enrichment layer
- POA&M row generation
- CSV validation output
- audit-ready spreadsheet evidence

---

## 🧠 Local AI Enrichment Layer
The workflow now integrates **self-hosted Ollama LLM inference** to enrich representative DISA STIG findings with:

- `finding_summary`
- `recommended_fix`
- `closure_validation`

This AI layer is designed to:
- accelerate remediation documentation
- reduce manual analyst effort
- improve POA&M evidence consistency
- keep sensitive compliance data private
- enable scalable future enrichment across full CKL datasets

For lab efficiency, the AI enrichment currently processes a **single representative finding**, while the architecture supports scaling across full datasets.

---

## 📸 Screenshots
Key evidence screenshots are stored in:

```text
Screenshots/
```

Recommended captures:
- full n8n workflow pipeline
- local Ollama AI chain
- AI-enriched POA&M row
- final CSV output
- sanitized spreadsheet evidence

---

## 💼 Real-World Use Cases
This workflow supports:
- RMF evidence generation
- ISSO remediation tracking
- vulnerability governance
- DISA STIG audit preparation
- POA&M management
- FedRAMP continuous monitoring
- compliance workflow automation
- private local AI remediation support

---

## 🎯 Why This Matters
Manual CKL-to-POA&M workflows are often:
- repetitive
- spreadsheet-heavy
- inconsistent
- difficult to scale

By combining:
- workflow orchestration
- transformation logic
- local AI enrichment
- secure self-hosted execution

this project demonstrates how cybersecurity teams can modernize compliance operations while maintaining control of sensitive evidence.

---

## 🚀 Future Enhancements
Planned upgrades:
- AI enrichment at full CKL scale
- executive risk summaries
- automated POA&M ticket creation
- ServiceNow integration
- SharePoint evidence sync
- FedRAMP package automation
- Splunk / SIEM finding correlation
- automated POA&M closure validation

---

## 🛠️ Tech Stack
- **n8n**
- **Ollama**
- **Llama 3**
- **JavaScript**
- **XML**
- **CSV**
- **DISA STIG**
- **RMF / NIST**
- **POA&M**
- **Self-hosted Docker**

---

## 🔐 Security Design Principle
A key design goal was ensuring:

> **sensitive compliance evidence remains local to the host environment**

This mirrors real-world security requirements for:
- federal systems
- regulated environments
- compliance evidence handling
- private cyber workflows
- air-gapped or restricted enclaves
