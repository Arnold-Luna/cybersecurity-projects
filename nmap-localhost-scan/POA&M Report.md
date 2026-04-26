# PLAN OF ACTION & MILESTONES (POA&M)
**POA&M ID:** POA&M-2026-001
**Finding:** Exposed SMB Ports (445/tcp, 135/tcp)
**Risk Level:** HIGH

---

## 1. POA&M Summary

| Field                  | Value                                                                 |
|------------------------|-----------------------------------------------------------------------|
| POA&M ID               | POA&M-2026-001                                                        |
| Title                  | Open SMB Ports Identified on Network Host                            |
| System / Asset         | [TARGET-HOST]                                                         |
| Finding Source         | Nmap Quick Scan — Port 445/tcp, 135/tcp                               |
| Date Identified        | [DATE REDACTED]                                                       |
| Submitted By           | [ANALYST]                                                             |
| Assigned To            | [SYSTEM OWNER / IT SECURITY TEAM]                                    |
| Risk Level             | HIGH                                                                  |
| Overall Status         | Open — Remediation Not Yet Begun                                     |
| Scheduled Completion   | [TARGET COMPLETION DATE + 30 DAYS]                                   |
| Regulatory Reference   | NIST SP 800-53 Rev 5: SC-7, CM-7, SI-3, RA-5; NIST CSF: PR.AC-3, DE.CM-1 |

---

## 2. Weakness Description

A network port scan of the target host identified two TCP ports open and accepting connections:

- **Port 445/tcp — SMB (Server Message Block):** Windows file-sharing protocol with a long history of critical, wormable remote code execution vulnerabilities. Highest-priority finding.
- **Port 135/tcp — MSRPC (Microsoft Remote Procedure Call):** Windows RPC endpoint mapper. Exposes the host to service enumeration, DCOM exploitation, and NTLM relay attacks.

Neither port was filtered at the host firewall. SMBv1 status was not confirmed by the quick scan; a follow-up authenticated version scan is recommended.

---

## 3. Risk Assessment

### 3.1 Risk Rating

| Likelihood | Impact | Overall Risk |
|---|---|---|
| High — SMB widely attacked; exploit code publicly available | High — RCE, ransomware, lateral movement, data exfiltration | **HIGH** |

### 3.2 Threat Scenarios

- **Ransomware deployment:** EternalBlue (CVE-2017-0144) enables unauthenticated RCE; used by WannaCry & NotPetya.
- **Lateral movement:** SMB allows attackers to pivot across the network, access shares, and harvest credentials.
- **NTLM relay:** Open SMB/MSRPC enables PetitPotam and Responder relay attacks leading to domain compromise.
- **Wormable RCE:** SMBGhost (CVE-2020-0796) is pre-auth, zero-click, no user interaction required.
- **Service enumeration:** Port 135 allows unauthenticated mapping of running RPC services.

---

## 4. Impact Analysis

### Confidentiality — HIGH
- Unauthorized access to file shares may expose sensitive data, credentials, or PII.
- NTLM relay captures password hashes reusable across the environment.

### Integrity — HIGH
- RCE allows modification, corruption, encryption, or deletion of files and configs.
- Ransomware encryption is a direct, demonstrated integrity impact.
- Attackers may install persistent backdoors surviving reboots and patch cycles.

### Availability — HIGH
- Ransomware via SMB has caused network-wide outages lasting days to weeks.
- Wormable exploits (EternalBlue, SMBGhost) cause cascading availability failures.
- DoS conditions may be triggered even without full code execution.

### Blast Radius
- All hosts reachable via SMB on the same network segment.
- Shared file system data accessible from this host.
- Domain accounts authenticated to this host.
- Connected cloud storage or backup systems mounted via SMB.

---

## 5. CVE Reference Table

| CVE ID           | Name            | CVSS  | Description                                                            |
|------------------|-----------------|-------|------------------------------------------------------------------------|
| CVE-2017-0144    | EternalBlue     | 9.3   | Unauthenticated RCE via SMBv1; exploited by WannaCry & NotPetya        |
| CVE-2020-0796    | SMBGhost        | 10.0  | Pre-auth RCE in SMBv3; wormable, no user interaction required          |
| CVE-2021-34527   | PrintNightmare  | 8.8   | RCE and LPE via Windows Print Spooler over SMB                         |
| CVE-2017-0145    | EternalRomance  | 9.3   | SMBv1 unauthenticated RCE; used in NotPetya and BadRabbit              |
| CVE-2021-36942   | PetitPotam      | 9.8   | NTLM relay via SMB; allows domain takeover without credentials         |

---

## 6. Remediation Plan

### 6.1 Immediate Actions (0–7 Days) — CRITICAL
1. Apply Windows Firewall rules to block inbound port 445 and 135 from all unauthorized sources.
2. Disable SMBv1: `Set-SmbServerConfiguration -EnableSMB1Protocol $false`
3. Apply all outstanding Windows patches — prioritize MS17-010, KB4012212, CVE-2020-0796, CVE-2021-34527.
4. Run authenticated follow-up scan (`nmap -sV`) and Nessus/OpenVAS scan to confirm SMBv1 status.

### 6.2 Short-Term Actions (7–30 Days) — HIGH
5. Enable SMB signing: `Set-SmbServerConfiguration -RequireSecuritySignature $true`
6. Audit all SMB shares — remove excessive permissions, apply least-privilege access controls.
7. Restrict MSRPC (port 135) to authorized management IPs; disable DCOM if not required.
8. Enable SMB/RPC audit logging (Event IDs 5140, 5145, 4656, 4663) and forward to SIEM.
9. Review security event logs for unauthorized SMB access since the finding date.

### 6.3 Long-Term Actions (30–90 Days) — MEDIUM
10. Implement network segmentation — block SMB (445, 139) at perimeter and inter-VLAN firewall rules.
11. Deploy HIDS/HIPS (e.g., Wazuh, Microsoft Defender for Endpoint) with SMB detection rules.
12. Establish formal vulnerability management: weekly scans, 30-day remediation SLA for HIGH/CRITICAL.
13. Conduct environment-wide SMB exposure sweep; create POA&M entries for all affected hosts.
14. Deploy Microsoft LAPS to prevent credential reuse via SMB lateral movement.

---

## 7. Milestones & Tracking

| # | Milestone                                                       | Owner             | Due     | Status |
|---|-----------------------------------------------------------------|-------------------|---------|--------|
| 1 | Apply host firewall rules — block inbound 445 and 135           | [IT Security]     | Day 1   | Open   |
| 2 | Disable SMBv1 and verify configuration                          | [IT Security]     | Day 2   | Open   |
| 3 | Apply all pending Windows security patches                      | [Sys Admin]       | Day 7   | Open   |
| 4 | Run authenticated follow-up vulnerability scan                  | [Security Ops]    | Day 7   | Open   |
| 5 | Enable SMB signing across all hosts                             | [IT Security]     | Day 14  | Open   |
| 6 | Audit and remediate SMB share permissions                       | [Sys Admin]       | Day 14  | Open   |
| 7 | Restrict MSRPC to authorized management IPs                     | [IT Security]     | Day 21  | Open   |
| 8 | Enable SMB/RPC audit logging and forward to SIEM                | [Security Ops]    | Day 21  | Open   |
| 9 | Review logs for signs of unauthorized SMB access                | [Security Ops]    | Day 30  | Open   |
| 10| Implement network segmentation — block SMB at VLAN boundaries   | [Network Eng]     | Day 60  | Open   |
| 11| Deploy HIDS/HIPS with SMB threat detection rules                | [Security Ops]    | Day 60  | Open   |
| 12| Environment-wide SMB exposure sweep and bulk POA&M creation     | [Security Ops]    | Day 90  | Open   |
| 13| POA&M closure review — verify all milestones complete           | [CISO / Owner]    | Day 90  | Open   |

---

## 8. Residual Risk

| Field              | Value                                                                                  |
|--------------------|----------------------------------------------------------------------------------------|
| Residual Likelihood| Low — firewall rules, patching, and SMBv1 disabled eliminate primary attack vectors    |
| Residual Impact    | Medium — SMB still required for operations; some risk remains from zero-days           |
| Residual Risk Level| LOW                                                                                    |
| Accepted By        | [SYSTEM OWNER / AUTHORIZING OFFICIAL]                                                  |
| Acceptance Date    | [DATE]                                                                                 |
| Review Date        | [90 DAYS AFTER CLOSURE]                                                                |

---

## 9. Sign-Off & Approval

| Role                        | Name & Signature                              | Date        |
|-----------------------------|-----------------------------------------------|-------------|
| Prepared By                 | [ANALYST NAME]                                | ___________  |
| Reviewed By                 | [IT SECURITY MANAGER]                         | ___________  |
| Approved By                 | [CISO / AUTHORIZING OFFICIAL]                 | ___________  |
| System Owner                | [SYSTEM OWNER NAME]                           | ___________  |

---
*Document ID: POA&M-2026-001 | Version: 1.0 | Classification: CONFIDENTIAL*
*All bracketed fields must be completed by the responsible security team before formal submission.*