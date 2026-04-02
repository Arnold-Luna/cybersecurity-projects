# Windows 11 DISA STIG Remediation Lab | CAT I SEHOP Compliance Fix

## 📌 Overview
This project documents the remediation of a **CAT I DISA Windows 11 STIG finding** on a personal Windows 11 workstation using a **risk-based hardening approach**.

The control was identified through **SCAP Compliance Checker**, analyzed in **STIG Viewer**, remediated through a **registry-based configuration change**, and validated through a **follow-up SCAP re-scan**.

This lab demonstrates a real-world compliance workflow:

> **Identify → Analyze → Remediate → Validate → Document**

The selected control was **Structured Exception Handling Overwrite Protection (SEHOP)**, a Windows exploit mitigation designed to reduce the likelihood of successful memory corruption and buffer overflow attacks.

---

## 🎯 Objective
Safely remediate a **single CAT I Windows 11 STIG finding** while preserving workstation usability.

### Control Information
- **Vulnerability ID:** V-253284
- **STIG ID:** WN11-00-000150
- **Rule Title:** Structured Exception Handling Overwrite Protection (SEHOP) must be enabled
- **Severity:** CAT I
- **CCI:** CCI-002824

---

## 🛠️ Tools Used
- SCAP Compliance Checker 5.14
- STIG Viewer 3.7
- Windows Registry Editor
- Microsoft Windows 11 Pro
- DISA Windows 11 STIG Benchmark
- Compliance evidence screenshots

---

## 🧪 Lab Workflow
This project follows a complete STIG remediation lifecycle:

1. Run baseline SCAP compliance assessment
2. Identify CAT I failed controls
3. Analyze detailed failed SEHOP finding
4. Validate DISA fix guidance in STIG Viewer
5. Perform registry-based remediation
6. Re-run SCAP benchmark
7. Validate PASS result
8. Document compliance evidence

---

# 📸 Evidence Walkthrough

---

## 1️⃣ Initial SCAP Baseline Score
The initial Windows 11 SCAP assessment returned a **36.41% compliance score**, confirming multiple CAT I and CAT II findings.

This establishes the **baseline security posture** before remediation.

![Initial SCAP Score](screenshots/01-initial-scap-score-fail.png)

### Key Takeaway
This screenshot demonstrates:
- baseline compliance score
- initial assessment evidence
- measurable improvement target

---

## 2️⃣ CAT I Finding Identification
The results page highlighted multiple **CAT I high-severity controls**, including the target finding:

> **V-253284 - Structured Exception Handling Overwrite Protection (SEHOP) must be enabled**

![CAT I Findings](screenshots/02-cat1-finding-list.png)

### Key Takeaway
This screenshot proves:
- CAT I triage process
- severity prioritization
- targeted remediation selection

---

## 3️⃣ Detailed Failed SEHOP Finding
The detailed SCAP report confirmed the failure condition:

- Registry value missing
- Automated rule failed
- required DWORD value not found

Required registry setting:

```text
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel
DisableExceptionChainValidation = 0
```

![Detailed Failed SEHOP Finding](screenshots/03-sehop-failed-detail.png)

### Root Cause
The registry value **`DisableExceptionChainValidation`** did not exist, causing the automated validation check to fail.

---

## 4️⃣ Registry-Based Remediation
The missing DWORD value was manually created in **Registry Editor**.

### Remediation Steps
1. Open `regedit`
2. Navigate to:

```text
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel
```

3. Create **DWORD (32-bit)**:
```text
DisableExceptionChainValidation
```

4. Set value to:
```text
0
```

5. Reboot the workstation
6. Re-run SCAP benchmark

![Registry Remediation](screenshots/04-registry-remediation.png)

### Key Takeaway
This demonstrates:
- safe registry-based hardening
- exploit mitigation enforcement
- production-safe remediation workflow

---

## ⚙️ 4A Alternate Remediation Method: PowerShell Script
In addition to manual remediation through Registry Editor, the same STIG control can be remediated using a PowerShell script.

This provides a more scalable approach for repeated testing and better reflects how security teams automate compliance tasks in enterprise environments.

### 🔗 Script Link
[View PowerShell Script](Scripts/enable-sehop-stig.ps1)

### Script Name
```text
enable-sehop-stig.ps1
```

### Script Function
The script performs the following actions:
1. Defines the target registry path for the SEHOP control
2. Checks whether the required registry value exists
3. Creates or updates the DWORD value if needed
4. Verifies the registry value after modification
5. Prompts for reboot and SCAP re-validation

### Target Registry Setting
```text
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel
DisableExceptionChainValidation = 0
```

### How to Run
Open PowerShell as Administrator and run:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\enable-sehop-stig.ps1
```

### Why This Matters
This alternate fix demonstrates:
- PowerShell-based compliance automation
- repeatable remediation workflow
- scalable registry hardening
- validation-focused security engineering
  
---

## 5️⃣ Post-Remediation Improved Score
After applying the registry fix and re-running the benchmark, the score increased from:

- **36.41% → 36.82%**

This proves measurable compliance improvement.

![Post Remediation Score](screenshots/05-post-remediation-score.png)

### Improvement Achieved
- **+0.41% compliance increase**
- 1 CAT I control successfully remediated
- improved endpoint exploit mitigation posture

---

## 6️⃣ Final PASS Validation
The final SCAP detailed report confirms the control changed from:

- **Before:** FAIL
- **After:** PASS

The registry object test now validates successfully.

![Final PASS Validation](screenshots/06-sehop-pass-validation.png)

### Validation Outcome
This is the strongest evidence in the project because it confirms:
- successful remediation
- validated registry state
- automated SCAP pass
- closed CAT I finding

---

# 🔍 Technical Explanation
SEHOP protects Windows systems against attacks that abuse **Structured Exception Handling overwrite chains**, commonly associated with memory corruption exploitation.

The required STIG setting ensures the following registry value exists:

```text
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel
DisableExceptionChainValidation = 0
```

A missing key causes the system to fail automated DISA validation.

---

# 📈 Results Summary
## Before
- Compliance score: **36.41%**
- CAT I finding: **FAIL**

## After
- Compliance score: **36.82%**
- CAT I finding: **PASS**

## Security Improvement
- improved exploit mitigation
- reduced memory corruption attack reliability
- strengthened Windows endpoint hardening
- validated DISA STIG compliance delta

---

# 🧠 Skills Demonstrated
- DISA STIG remediation
- SCAP benchmark analysis
- Windows endpoint hardening
- registry-based exploit mitigation
- CAT I vulnerability triage
- compliance evidence collection
- risk-based remediation
- validation through re-scan

---

# ⚠️ Disclaimer
This project was performed on a personal Windows 11 workstation for **educational, portfolio, and compliance workflow demonstration purposes**.

Only a **single low-risk CAT I control** was selected to preserve system stability while demonstrating a full remediation lifecycle.
