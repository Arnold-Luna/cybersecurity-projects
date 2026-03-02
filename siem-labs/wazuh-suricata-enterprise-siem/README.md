# 🚨 Enterprise SIEM Lab – Wazuh + Suricata + Kali Linux Attack Simulation

## 📌 Overview

This project demonstrates the deployment of an enterprise-style SIEM environment using:

- Wazuh (SIEM / XDR platform)
- Suricata (Network IDS)
- OpenSearch (Indexer)
- Kali Linux (Attacker machine)
- Ubuntu Server 24.04 (Target + SIEM host)

The objective was to simulate real-world attack activity and validate detection, ingestion, and alert visibility within a centralized monitoring platform.

---

## 🏗 Lab Architecture

Attacker (Kali Linux)
↓
Brute Force + Network Scanning
↓
Suricata IDS (EVE JSON logs)
↓
Wazuh Manager
↓
OpenSearch Indexer
↓
Wazuh Dashboard

---

## ⚙️ Technologies Used

- Ubuntu Server 24.04 LTS  
- Kali Linux  
- Wazuh 4.x  
- Suricata 7.x  
- OpenSearch  
- Emerging Threats (ET) rules  
- TLS-secured services  

---

## 🛠 Implementation Steps

### 1️⃣ Deployed Wazuh Stack

- Installed Wazuh manager, indexer, and dashboard
- Configured TLS certificates
- Verified backend connectivity with curl
- Validated service status using systemctl and journalctl

---

### 2️⃣ Installed & Configured Suricata

- Enabled AF_PACKET packet capture
- Activated Emerging Threats rule set
- Enabled EVE JSON logging

Example configuration:

```yaml
eve-log:
  enabled: yes
  filetype: regular
  filename: eve.json
```

Monitored log file:

/var/log/suricata/eve.json

---

### 3️⃣ Attack Simulation from Kali Linux

From the Kali attacker machine:

- Performed Nmap reconnaissance scanning
- Simulated brute force login attempts
- Generated suspicious traffic patterns

Examples:

• Nmap TCP SYN scan  
• SSH brute force attempts  
• Aggressive service enumeration  

---

### 4️⃣ Detection & Alert Validation

Suricata generated alerts including:

- ET SCAN Possible Nmap User-Agent Observed
- Brute Force related connection attempts
- Protocol mismatches
- TLS anomalies

Wazuh successfully ingested and indexed alerts for dashboard visibility and investigation.

---

## 🔍 Detection Scenarios Demonstrated

### 🔐 Brute Force Activity
Multiple failed authentication attempts detected and logged.

### 🌐 Network Reconnaissance
Nmap scanning activity flagged by Emerging Threats rules.

### 📊 SIEM Validation
Confirmed ingestion pipeline integrity from IDS → Wazuh → OpenSearch → Dashboard.

---

## 🧠 Skills Demonstrated

- SIEM deployment and configuration
- IDS tuning and rule management
- Attack simulation using Kali Linux
- Brute force detection analysis
- Log ingestion troubleshooting
- TLS configuration debugging
- IPv4 vs IPv6 binding validation
- Service management with systemctl
- Security event validation workflow

---

## 🎯 SOC-Relevant Capabilities

This lab demonstrates hands-on blue team capabilities including:

- Monitoring IDS alerts
- Investigating brute force attempts
- Validating detection pipelines
- Analyzing reconnaissance activity
- Troubleshooting SIEM integrations
- Simulating adversary techniques in controlled environment

---

## 📈 Outcome

Successfully built and validated an enterprise-style monitoring stack capable of detecting reconnaissance and brute force activity in a centralized SIEM environment using real attack simulation.
