# DISA STIG CKL to POA&M Automation Engine

Automated DISA STIG checklist processing workflow built in **n8n** that converts **CKL XML findings into POA&M-ready CSV outputs** for remediation tracking, RMF evidence management, and compliance operations.

This workflow ingests **Windows 11 SCC / CKL checklist files**, parses XML findings, normalizes vulnerability metadata, applies **risk and priority logic**, and exports a structured **POA&M spreadsheet** ready for engineering teams, ISSOs, and audit stakeholders.

---

## 🚀 Business Problem
Manual CKL-to-POA&M creation is repetitive, slow, and error-prone.

Security and compliance teams often spend hours manually:
- reviewing STIG findings
- extracting failed controls
- assigning ownership
- defining milestones
- creating remediation timelines
- formatting spreadsheets for closure tracking

This workflow automates that process end-to-end.

---

## ⚙️ Workflow Pipeline
```text
CKL File
   ↓
Read from Disk
   ↓
Extract Text
   ↓
XML → JSON
   ↓
Normalize Vulnerability Data
   ↓
POA&M Logic Engine
   ↓
Build POA&M Rows
   ↓
CSV Export
```

---

## 🧩 Core Features
- ✅ Imports full SCC / CKL checklist files
- ✅ Parses DISA STIG XML structure
- ✅ Supports Windows 11 STIG findings
- ✅ Extracts V-ID, Rule ID, STIG ID, severity, and finding details
- ✅ Converts CAT I / II / III to risk priority
- ✅ Generates POA&M IDs automatically
- ✅ Assigns remediation owners
- ✅ Creates milestones and completion dates
- ✅ Produces Excel-ready CSV output
- ✅ Designed for RMF, ISSO, and GRC workflows

---

## 📊 Final Output Schema
```text
poam_id
source
framework
weakness_id
control_id
rule_id
weakness_name
finding_summary
technical_evidence
recommended_fix
closure_validation
affected_asset
asset_ip
asset_type
severity
risk_level
poam_priority
discovery_date
status
responsible_team
milestone
scheduled_completion_date
resources_required
benchmark_title
```

---

## 🖼️ Screenshots

### Full n8n Workflow
Add screenshot:
`images/01-full-workflow-pipeline.png`

### Final CSV POA&M Output
Add screenshot:
`images/02-poam-csv-output.png`

---

## 💼 Real-World Use Cases
This workflow supports:
- RMF evidence generation
- ISSO remediation tracking
- vulnerability governance
- DISA STIG audit preparation
- POA&M lifecycle management
- SCC validation review
- engineering handoff reporting
- FedRAMP / NIST 800-53 control remediation support

---

## 🛠️ Tech Stack
- **n8n**
- **XML parsing**
- **JavaScript data transformation**
- **CSV export**
- **DISA STIG / SCC / CKL**
- **RMF / POA&M workflows**

---

## 🎯 Example Outcome
Processed:
- **163 Windows 11 STIG findings**
- auto-prioritized CAT I / II issues
- generated ownership and milestone tracking
- exported audit-ready CSV in seconds

---

## 📈 Why This Project Matters
This project demonstrates practical skills in:
- compliance automation
- workflow engineering
- XML parsing
- vulnerability management
- RMF operations
- GRC process optimization
- POA&M lifecycle design
- security engineering reporting

---

## 🔮 Planned V3 Enhancements
- multi-asset CKL support
- SCC XCCDF ingestion
- POA&M deduplication
- ServiceNow / JIRA ticket creation
- dashboard reporting
- Splunk remediation metrics
- historical trend analysis

---

## 👤 Author
**Arnold Luna**  
Cybersecurity | RMF | GRC | SIEM | Cloud Security | Workflow Automation
