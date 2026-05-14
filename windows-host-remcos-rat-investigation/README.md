# Windows Host Remcos RAT Investigation

## Overview

This project documents an investigation of a Windows host infection using Security Onion, Sguil, Kibana, Wireshark, and file reputation analysis. The case centered on identifying the infected host, downloaded executables, and command-and-control behavior related to Remcos RAT.

This write-up is based on a controlled Cisco/NetAcad lab derived from malware-traffic-analysis.net training material. No malware samples, PCAPs, Cisco worksheets, or copyrighted lab screenshots are included in this repository.

## Scenario

Network security monitoring tools alerted on suspicious traffic from a Windows host on `2019-03-19`. The investigation needed to determine:

- The time range of the attack
- The infected Windows host
- The user or host identity
- The downloaded executable files
- The malware family involved

## Tools Used

- Security Onion
- Sguil
- Kibana
- Wireshark
- Zeek HTTP and DNS logs
- Cisco Talos file reputation lookup
- SHA256 hashing

## Investigation Workflow

### 1. Located The Alert Cluster

In Sguil, the alert activity occurred in bursts on `2019-03-19`, roughly from `01:01` through `04:53`. The clustered timing suggested automated malware behavior rather than a single manual event.

The first alert showed suspicious DNS update activity:

| Field | Value |
| --- | --- |
| Source | `10.0.90.215:52609` |
| Destination | `10.0.20.9:53` |
| Protocol | DNS |
| Alert | `ET POLICY DNS Update From External net` |
| Hostname | `Bobby-Tiger-PC` |
| Domain | `littletigers.info` |

The DNS update was treated as suspicious because it came from a source that did not appear to belong to an expected DNS administration workflow.

### 2. Identified The First Executable Download

The second alert showed an HTTP request from the same internal host:

```text
GET /test1.exe HTTP/1.1
```

Connection details:

| Field | Value |
| --- | --- |
| Source | `10.0.90.215:49204` |
| Destination | `209.141.34.8:80` |
| Requested file | `/test1.exe` |
| File signature | `MZ` |

The `MZ` file signature indicated a Windows Portable Executable.

I exported the object from Wireshark and generated a SHA256 hash:

```bash
sha256sum test1.exe
```

Observed hash:

```text
2a9b0ed40f1f0bc0c13ff35d304689e9cadd633781cbcad1c2d2b92ced3f1c85
```

Cisco Talos recognized the file as malware associated with Remcos RAT activity.

### 3. Confirmed Remcos RAT Check-In Behavior

Another alert was associated with:

```text
Remcos RAT Checkin 23
```

Observed details:

| Field | Value |
| --- | --- |
| Destination port | `2404` |
| Communication | Encrypted or unreadable |
| Malware family | Remcos RAT |
| Meaning of Remcos | Remote Control and Surveillance |
| Likely purpose | Command-and-control communication |

The encrypted traffic and RAT check-in signature supported the conclusion that the host was infected and attempting to communicate with external infrastructure.

### 4. Found A Second Executable Download

Additional alerts pointed to a second executable:

| Field | Value |
| --- | --- |
| Alert reference | `5497` in the lab notes |
| Server | `217.23.14.81:80` |
| Downloaded file | `alphanumeric.exe` |

This supported a broader infection chain with multiple payloads or stages.

### 5. Reviewed Kibana HTTP And DNS Evidence

Kibana showed related HTTP URIs:

```text
/f4.exe
/ncsi.txt
/pki/crl/products/CSPCA.crl
/test1.exe
```

Some observed URIs, such as `CSPCA.crl` and `ncsi.txt`, can be legitimate Windows or certificate-validation traffic. This matters because SOC analysis should separate malicious artifacts from normal operating-system background noise.

DNS evidence also surfaced a suspicious domain:

```text
toptoptop1[.]online
```

## Key Findings

| Question | Finding |
| --- | --- |
| Infected host | `Bobby-Tiger-PC` |
| Internal IP | `10.0.90.215` |
| Domain | `littletigers.info` |
| First malware download | `/test1.exe` |
| File type | Windows executable |
| Hash | `2a9b0ed40f1f0bc0c13ff35d304689e9cadd633781cbcad1c2d2b92ced3f1c85` |
| Malware family | Remcos RAT |
| C2 indicator | Encrypted traffic on destination port `2404` |
| Second executable | `alphanumeric.exe` |

## MITRE ATT&CK Mapping

| Tactic | Technique | Why It Applies |
| --- | --- | --- |
| Command and Control | `T1105 - Ingress Tool Transfer` | Executables were downloaded to the internal Windows host |
| Command and Control | `T1071 - Application Layer Protocol` | External communications were observed after infection |
| Command and Control | `T1573 - Encrypted Channel` | Check-in traffic was unreadable/encrypted |
| Command and Control | `T1219 - Remote Access Software` | Remcos RAT provides remote control capability |

## Recommended Response

- Isolate `10.0.90.215` from the network.
- Preserve memory, disk, and relevant network logs before remediation.
- Block known malicious domains, IPs, and hashes at network and endpoint controls.
- Reset credentials associated with the infected host and user.
- Review DNS and HTTP logs for other hosts contacting the same infrastructure.
- Reimage the host if malware persistence cannot be confidently removed.

## Screenshots To Add Before Publishing

- Sguil alert list for `2019-03-19`.
- Wireshark HTTP object export showing `test1.exe`.
- Terminal screenshot of the SHA256 hash.
- Talos result for the file hash.
- Kibana HTTP dashboard showing suspicious URIs.
- DNS dashboard showing suspicious query activity.

## Skills Demonstrated

- Windows malware triage
- IDS alert analysis
- Host identification from DNS telemetry
- HTTP object extraction
- Hash-based malware reputation lookup
- Distinguishing suspicious traffic from normal OS background traffic
- Incident response recommendation writing

## Safety Note

Do not publish recovered executables or active malware samples. A public portfolio post should include hashes, screenshots, and written analysis rather than dangerous binaries.
