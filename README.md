# Cybersecurity Projects Portfolio

Hands-on cybersecurity + cloud security labs focused on SOC workflows, incident response, threat detection, vulnerability management, and system hardening.

Everything here is built to be repeatable, documented, and reviewable (screenshots, configs, commands, findings).

---

## 🏆 Highlights

- 🤖 **[AI-Assisted Web App Pentest - CAI Framework](https://github.com/Arnold-Luna/cybersecurity-projects/tree/main/AI-Assisted%20Web%20App%20Pentest%20-%20CAI%20Framework)**  
  Set up the CAI framework for an authorized web application security assessment, defined scope and rules of engagement, and documented sanitized evidence for public portfolio use.

- 🧠 **[Enterprise SIEM Lab - Wazuh + Suricata + Kali Linux + Fail2Ban](https://github.com/Arnold-Luna/cybersecurity-projects/tree/main/Enterprise%20SIEM%20Lab%20%E2%80%93%20Wazuh%20%2B%20Suricata%20%2B%20Kali%20Linux%20%2B%20Fail2Ban)**  
  End-to-end attack simulation, detection engineering, MITRE ATT&CK mapping (T1110 – Brute Force), and automated containment using Fail2Ban.

- ✉️ **[Email Authentication Assessment (SPF/DKIM/DMARC)](https://github.com/Arnold-Luna/cybersecurity-projects/tree/main/Email%20Security)**  
  Evidence-based review of email security posture with screenshots, DNS analysis, and remediation recommendations.

- ☁️ **[AWS Logging & Monitoring Setup](https://github.com/Arnold-Luna/cybersecurity-projects/tree/main/AWS%20Logging%20%26%20Monitoring)**  
  Built baseline logging and auditing posture, validated CloudTrail events, and documented security findings.

- 🔐 **[AWS KMS CloudTrail S3 Encryption Lab](https://github.com/Arnold-Luna/cybersecurity-projects/tree/main/cloud-projects/AWS%20KMS%20CloudTrail%20S3%20Encryption%20Lab)**  
  Encrypted an S3 object with a customer-managed KMS key, tested public access behavior, and documented sanitized CloudTrail evidence for key usage.

- 🌐 **[Network Recon & Service Enumeration Lab](https://github.com/Arnold-Luna/cybersecurity-projects/tree/main/Network%20Recon%20Lab)**  
  Conducted controlled Nmap scans, analyzed exposed services, mapped risks, and proposed mitigations.

- 📡 **[Packet Tracer Security Labs](Packet%20Tracer%20Security%20Labs/)**
  Documented Cisco Packet Tracer projects covering centralized logging, NetFlow, AAA accounting, FTP traffic exposure, syslog review, and ACL troubleshooting.

---

## 📌 Incident Response

- 🧠 **[Enterprise SIEM Lab](Enterprise%20SIEM%20Lab%20%E2%80%93%20Wazuh%20%2B%20Suricata%20%2B%20Kali%20Linux%20%2B%20Fail2Ban/)**

  Simulated SSH brute-force attack using Hydra from Kali Linux, analyzed authentication failures in Wazuh (Rule 5760), mapped activity to MITRE ATT&CK T1110, and implemented automated IP blocking with Fail2Ban.

- ✉️ **[Email Authentication Assessment](Incident%20Response/email-authentication-assessment/)**

  Reviewed SPF, DKIM, and DMARC configurations to assess spoofing risk and strengthen defensive posture.

---

## 🌐 Network Defense

- 🧠 **[Enterprise SIEM Lab](Enterprise%20SIEM%20Lab%20%E2%80%93%20Wazuh%20%2B%20Suricata%20%2B%20Kali%20Linux%20%2B%20Fail2Ban/)**

  Performed reconnaissance with Nmap, identified exposed SSH services, correlated brute-force attempts, and enforced host-based defensive controls.

- 🌐 **[Network Recon & Service Enumeration Lab](nmap-localhost-scan/)**

  Enumerated services, reviewed attack surface, and documented potential exploitation paths.

- 📡 **[Packet Tracer Security Labs](Packet%20Tracer%20Security%20Labs/)**

  Built public-ready writeups for network monitoring and access-control scenarios, including Syslog, NetFlow, AAA/TACACS+, plaintext FTP analysis, and ACL validation.

---

## 🕸️ Web Application Security

- 🤖 **[AI-Assisted Web App Pentest - CAI Framework](AI-Assisted%20Web%20App%20Pentest%20-%20CAI%20Framework/)**

  Documented an authorized AI-assisted web application assessment, including rules of engagement, endpoint review, and sanitized public evidence.

---

## 🔍 Threat Analysis

- 🧠 **[Enterprise SIEM Lab](Enterprise%20SIEM%20Lab%20%E2%80%93%20Wazuh%20%2B%20Suricata%20%2B%20Kali%20Linux%20%2B%20Fail2Ban/)**

  Investigated authentication failure events, reviewed Wazuh rule metadata, analyzed alert severity, and correlated attack behavior across logs.

- ☁️ **[AWS Logging & Monitoring Setup](cloud-projects/AWS%20IAM%20Threat%20Detection/)**

  Validated logging configurations and analyzed event visibility across AWS services.

- **[RIG Exploit Kit Malware Investigation](security-onion-rig-exploit-kit-investigation/)**

  Reconstructed a drive-by malware infection using Security Onion, Kibana, Sguil, CapME, Wireshark, NetworkMiner, and VirusTotal hash analysis.

- **[Windows Host Remcos RAT Investigation](windows-host-remcos-rat-investigation/)**

  Investigated a Windows host compromise, identified downloaded executables, tied activity to Remcos RAT, and documented containment recommendations.

- **[HTTP SQL Injection And DNS Exfiltration Analysis](http-dns-exfiltration-analysis/)**

  Analyzed HTTP SQL injection evidence and suspicious DNS queries carrying encoded data through allowed DNS traffic.

- **[Compromised Host Investigation Using The 5-Tuple](compromised-host-5-tuple-investigation/)**

  Used the 5-tuple, Sguil, Wireshark, Kibana, FTP logs, and file logs to isolate unauthorized file access.

- **[Extracting An Executable From A PCAP](pcap-executable-extraction/)**

  Practiced packet-level file recovery by extracting a Windows executable from HTTP traffic and identifying safe malware-analysis next steps.

---

## 🛠 Core Skills Demonstrated

- SIEM Monitoring (Wazuh)
- Log Analysis & Event Correlation
- MITRE ATT&CK Mapping
- SSH Hardening & Fail2Ban
- Network Reconnaissance (Nmap)
- Brute Force Simulation (Hydra)
- Cloud Logging & Monitoring (AWS)
- AWS KMS & S3 Encryption
- CloudTrail Audit Evidence Review
- AI-Assisted Security Testing
- Web Application Testing Scope & Rules of Engagement
- Incident Documentation & Reporting
- Security Onion Alert Triage
- Sguil, Kibana, CapME, and Wireshark Pivoting
- PCAP File Extraction
- DNS Exfiltration Analysis
- Malware Hash Reputation Checks
- Cisco Packet Tracer
- Syslog, NetFlow, and AAA Accounting
- Access Control List Troubleshooting
