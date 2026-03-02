# 🚨 Enterprise SIEM Lab – Wazuh + Suricata + Kali Linux + Fail2Ban

## 📌 Overview

This project demonstrates the deployment of an enterprise-style SIEM environment and validation of detection + response capabilities using:

- Wazuh (SIEM / XDR platform)
- Suricata (Network IDS)
- OpenSearch (Indexer)
- Kali Linux (Attacker machine)
- Fail2Ban (Automated IP blocking)
- Ubuntu Server 24.04 (Target + SIEM host)

The objective was to simulate real-world attack activity, detect malicious behavior, and implement automated containment controls.

---

## 🏗 Lab Architecture

Kali Linux (Attacker)
↓
Reconnaissance + Brute Force
↓
Suricata IDS (EVE JSON logs)
↓
Wazuh Manager
↓
OpenSearch Indexer
↓
Wazuh Dashboard

Parallel Defensive Control:
Fail2Ban → Detects repeated failed logins → Blocks malicious IP via firewall rule

---

## ⚙️ Technologies Used

- Ubuntu Server 24.04 LTS  
- Kali Linux  
- Wazuh 4.x  
- Suricata 7.x  
- OpenSearch  
- Fail2Ban  
- Emerging Threats (ET) rules  
- iptables firewall  

---

## 🛠 Implementation Steps

### 1️⃣ Deployed Wazuh Stack

- Installed Wazuh manager, indexer, and dashboard
- Configured TLS certificates
- Validated backend connectivity
- Verified services using systemctl and journalctl

---

### 2️⃣ Installed & Configured Suricata

- Enabled AF_PACKET packet capture
- Activated Emerging Threats rule set
- Enabled EVE JSON logging

Monitored:

/var/log/suricata/eve.json

---

### 3️⃣ Attack Simulation from Kali Linux

From the Kali attacker machine:

- Performed Nmap reconnaissance scans
- Executed SSH brute force attempts
- Generated repeated failed login attempts

Observed behavior:

- Multiple authentication failures
- Suspicious user-agent detections
- Port scanning patterns

---

### 4️⃣ Detection Validation

Suricata triggered alerts including:

- ET SCAN Possible Nmap User-Agent Observed
- SSH brute force related traffic
- Protocol anomalies

Wazuh successfully ingested and indexed alerts for centralized visibility.

---

### 5️⃣ Automated Containment with Fail2Ban

Installed and configured Fail2Ban to monitor:

/var/log/auth.log

Configured jail for SSH protection:

- Max retry threshold defined
- Ban time enforced
- Firewall rule automatically applied

After repeated brute force attempts:

- Attacker IP was identified
- Fail2Ban triggered
- Malicious IP was added to iptables block list

Verification performed using:

fail2ban-client status
iptables -L

Confirmed attacker IP was successfully blocked.

---

## 🔍 Detection & Response Demonstrated

### 🔐 Brute Force Detection
Repeated failed SSH authentication attempts detected via logs and IDS alerts.

### 🌐 Reconnaissance Detection
Nmap scanning activity flagged by Emerging Threats rules.

### 🚫 Automated Response
Fail2Ban dynamically blocked the malicious IP after threshold exceeded.

### 📊 SIEM Pipeline Validation
Confirmed ingestion flow from IDS → Wazuh → OpenSearch → Dashboard.

---

## 🧠 Skills Demonstrated

- SIEM deployment and integration
- IDS configuration and tuning
- Attack simulation using Kali Linux
- Brute force detection analysis
- Log ingestion troubleshooting
- TLS configuration debugging
- IPv4 vs IPv6 binding validation
- Automated response implementation (Fail2Ban)
- Firewall rule verification
- Blue team incident workflow (detect → analyze → contain)

---

## 🎯 SOC-Relevant Capabilities

This lab demonstrates hands-on blue team proficiency in:

- Monitoring IDS alerts
- Investigating authentication abuse
- Detecting reconnaissance activity
- Implementing automated containment controls
- Validating security control effectiveness
- Simulating adversary techniques in a controlled environment

---

## 📈 Outcome

Successfully deployed and validated an enterprise-style monitoring and response stack capable of detecting and automatically blocking brute force attacks while maintaining centralized visibility through a SIEM platform.
