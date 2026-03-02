# 🚨 Enterprise SIEM Lab – Wazuh + Suricata Integration

## 📌 Overview

This project demonstrates the deployment and integration of a Security Information and Event Management (SIEM) platform using:

- Wazuh (SIEM / XDR platform)
- Suricata (Network IDS)
- OpenSearch (Data indexing engine)
- Ubuntu Server 24.04
- Virtualized lab environment

The objective was to simulate enterprise SOC monitoring capabilities by ingesting IDS alerts into a centralized SIEM for analysis and investigation.

---

## 🏗 Architecture

Data Flow:

Network Traffic  
↓  
Suricata IDS (EVE JSON logs)  
↓  
Wazuh Log Collection  
↓  
Wazuh Manager  
↓  
OpenSearch Indexer  
↓  
Wazuh Dashboard  

---

## ⚙️ Technologies Used

- Ubuntu Server 24.04 LTS  
- Wazuh 4.x  
- Suricata 7.x  
- OpenSearch  
- TLS-secured services  
- Emerging Threats (ET) rules  

---

## 🛠 Implementation Summary

### 1. Deployed Wazuh Stack
- Installed Wazuh manager, indexer, and dashboard
- Configured TLS certificates
- Verified backend connectivity using curl

### 2. Installed and Configured Suricata
- Enabled AF_PACKET capture
- Activated Emerging Threats rules
- Enabled EVE JSON logging

Example:

```yaml
eve-log:
  enabled: yes
  filetype: regular
  filename: eve.json
```

### 3. Generated Detection Events
Simulated malicious and suspicious activity:

- Nmap scanning activity
- Suspicious user-agent detection
- Protocol mismatches
- TLS anomalies

Example Alert:

ET SCAN Possible Nmap User-Agent Observed  
Classification: Web Application Attack  
Priority: 1  

### 4. Integrated Suricata Logs into Wazuh

Configured Wazuh to monitor:

/var/log/suricata/eve.json

Enabled structured JSON log ingestion for centralized detection.

---

## 🔍 Detection Examples

- ET SCAN Possible Nmap User-Agent
- TLS Invalid Record Type
- Protocol Mismatch Events
- Benign application detections validating ingestion pipeline

---

## 🧠 Skills Demonstrated

- SIEM deployment and configuration
- IDS rule management
- Log ingestion pipeline configuration
- TLS troubleshooting
- IPv4 vs IPv6 binding analysis
- Service debugging using systemctl and journalctl
- Detection validation and alert analysis

---

## 🎯 SOC Relevance

This project demonstrates practical experience in:

- Monitoring IDS alerts
- Investigating network-based threats
- Validating SIEM ingestion pipelines
- Troubleshooting security platform integrations
- Supporting blue team detection workflows

---

## 📈 Outcome

Successfully deployed an enterprise-style monitoring stack capable of detecting and visualizing network-based threats in a centralized dashboard environment.
