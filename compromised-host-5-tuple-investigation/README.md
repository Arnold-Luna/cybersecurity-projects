# Compromised Host Investigation Using The 5-Tuple

## Overview

This project documents a Security Onion investigation that used the 5-tuple to isolate suspicious traffic, identify unauthorized access, and determine how a file named `confidential.txt` was accessed over FTP.

This write-up is based on a controlled Cisco/NetAcad lab. No Cisco worksheets, raw lab data, PCAPs, or copyrighted lab screenshots are included in this repository.

## Scenario

After an attack, users reported that `confidential.txt` was no longer accessible. The investigation used Sguil, Wireshark, and Kibana to answer:

- Which hosts communicated during the compromise?
- What protocol and ports were involved?
- Were credentials exposed or abused?
- Was FTP used to access the file?
- What should be done to stop further unauthorized access?

## Tools Used

- Security Onion
- Sguil
- Wireshark
- Kibana
- Zeek FTP logs
- Zeek file logs

## What Is The 5-Tuple?

The 5-tuple is a concise way to describe a network conversation:

1. Source IP address
2. Source port
3. Destination IP address
4. Destination port
5. Protocol

It is useful for incident response because it lets analysts tie alerts, logs, and packet captures back to the same flow.

## Investigation Workflow

### 1. Reviewed The Initial Sguil Alert

The initial Sguil alert indicated that root access may have been returned by a target host:

```text
GPL ATTACK_RESPONSE id check returned root
```

The transcript showed a threat actor issuing Linux commands on the target. In the TCP stream, the attacker appeared to have root access and was reading account-related data.

Key observations:

- The attacker issued `whoami`.
- The target responded as `root`.
- The attacker reviewed sensitive account and password-related data.

### 2. Pivoted To Wireshark

Wireshark was used to follow the TCP stream and view the conversation between attacker and target. The red and blue stream colors helped distinguish traffic directions, making it easier to separate commands from responses.

The stream evidence supported the conclusion that this was not simple scanning. It was an interactive compromise with command execution.

### 3. Pivoted To Kibana And Filtered FTP Logs

Because `confidential.txt` was no longer accessible, I used Kibana to filter for FTP-related Zeek logs. The FTP log evidence showed:

| 5-Tuple Field | Value |
| --- | --- |
| Source IP | `192.168.0.11` |
| Source port | `52776` |
| Destination IP | `209.165.200.235` |
| Destination port | `21` |
| Protocol | FTP |

The FTP argument referenced:

```text
ftp://209.165.200.235/./confidential.txt
```

This tied the missing file to FTP activity.

### 4. Reviewed Credentials And File Evidence

The transcript exposed FTP credentials used in the activity:

| Field | Value |
| --- | --- |
| Username | `analyst` |
| Password | `cyberops` |

The file transfer evidence showed:

| Field | Value |
| --- | --- |
| MIME type | `text/plain` |
| Source | `192.168.0.11` |
| Destination | `209.165.200.235` |
| Timestamp | `2020-06-11 03:53:09.088` |
| File source | `FTP_DATA` |

The lab notes indicated the transferred file content appeared blank when reviewed, but the FTP evidence still confirmed unauthorized access to the file path.

## Key Findings

| Question | Finding |
| --- | --- |
| Was there unauthorized access? | Yes, the transcript showed command execution and root-level response |
| Was FTP involved? | Yes, FTP logs referenced `confidential.txt` |
| Were credentials visible? | Yes, FTP credentials were exposed in the transcript |
| What protocol was used for file activity? | FTP |
| Was the file transfer encrypted? | No, FTP is cleartext by default |

## MITRE ATT&CK Mapping

| Tactic | Technique | Why It Applies |
| --- | --- | --- |
| Credential Access | `T1552.001 - Credentials In Files` | Account/password-related information was viewed |
| Lateral Movement/Access | `T1078 - Valid Accounts` | Valid FTP credentials were used |
| Collection | `T1005 - Data from Local System` | A named file was accessed after compromise |
| Exfiltration | `T1048.003 - Exfiltration Over Unencrypted Non-C2 Protocol` | FTP was used to transfer file data |

## Recommended Response

- Immediately isolate the compromised host from the network.
- Disable or restrict FTP access.
- Reset the exposed `analyst` credentials and any related accounts.
- Replace cleartext FTP with SFTP or another encrypted transfer method.
- Review logs for additional file access or deletion events.
- Patch the vulnerable service or system that allowed command execution.
- Block unauthorized ports and validate firewall rules.
- Perform a broader forensic review to confirm whether other hosts were affected.

## Skills Demonstrated

- 5-tuple network-flow analysis
- Sguil alert triage
- Wireshark stream reconstruction
- Kibana pivoting
- FTP log analysis
- Credential exposure identification
- Incident containment planning

## Safety Note

This public write-up intentionally avoids publishing raw PCAPs or unredacted credential screenshots. The credentials listed here are from a controlled lab environment and should not be reused anywhere.
