# HTTP SQL Injection And DNS Exfiltration Analysis

## Overview

This project documents a Security Onion/Kibana investigation of two related data-exposure patterns: SQL injection over HTTP and data exfiltration through DNS queries. The goal was to identify the attacker activity, determine what was accessed, and explain why DNS can be abused as an exfiltration channel.

This write-up is based on a controlled Cisco/NetAcad lab. No Cisco worksheets, raw lab data, or copyrighted lab screenshots are included in this repository.

## Scenario

Security personnel determined that an exploit occurred during June 2020 and that sensitive data may have been exposed. The investigation focused on:

- HTTP traffic related to SQL injection
- Evidence of unauthorized database access
- DNS queries with suspicious long subdomains
- Decoding exfiltrated data from DNS query strings

## Tools Used

- Security Onion
- Kibana
- Zeek HTTP logs
- Zeek DNS logs
- CapME transcript pivot
- Linux command line
- `xxd`

## Investigation Workflow

### 1. Set The Time Range

The Kibana time range was expanded to cover June 2020. The HTTP dashboard was then used to focus on web traffic related to the suspected attack.

Initial HTTP evidence:

| Field | Value |
| --- | --- |
| Source IP | `209.165.200.235` |
| Destination IP | `209.165.200.227` |
| Destination port | `80` |
| First relevant timestamp | `2020-06-12 21:30:09.483` |

### 2. Identified SQL Injection In The HTTP URI

The HTTP message included a suspicious URI containing SQL keywords and database field names. The request attempted to use `UNION SELECT` logic to retrieve data from a `credit_cards` table.

Sanitized example of the observed pattern:

```text
username='+union+select+ccid,ccnumber,ccv,expiration,null+from+credit_cards+--+&password=
```

This is strong evidence of SQL injection because the input field is being used to inject database query syntax rather than a normal username.

### 3. Pivoted To CapME Transcript

Using the alert ID pivot, I opened the HTTP transcript in CapME. The transcript showed the client request and server response. Searching for `username` helped reveal that the traffic was not simply loading a web form. Later transcript content showed actual user-related values and payment-card related fields being returned.

I intentionally did not publish the exposed values in this repository. For a public write-up, it is enough to document that sensitive fields were exposed and show sanitized evidence.

### 4. Investigated Suspicious DNS Queries

The DNS dashboard showed unusual, long subdomains associated with:

```text
ns.example.com
```

The subdomains appeared to contain hex-encoded data instead of normal hostnames. The DNS client and server observed in the lab notes were:

| Role | IP |
| --- | --- |
| DNS client | `192.168.0.11` |
| DNS server | `209.165.200.235` |

### 5. Decoded The DNS Exfiltration Data

The DNS query data was exported from Kibana, cleaned so only the hexadecimal strings remained, and decoded with `xxd`:

```bash
xxd -r -p ./Downloads/"DNS - Queries.csv" > secret.txt
cat secret.txt
```

The decoded result showed that the long DNS labels were not normal subdomains. They represented encoded data being moved through DNS.

## Key Findings

| Area | Finding |
| --- | --- |
| HTTP attack | SQL injection attempt against a web application |
| SQL behavior | `UNION SELECT` used to request sensitive database fields |
| Data at risk | User and payment-card related fields |
| DNS anomaly | Long hex-like subdomains under `ns.example.com` |
| Exfiltration method | Encoded data carried inside DNS queries |
| Larger risk | DNS often leaves networks freely, making it attractive for covert exfiltration |

## MITRE ATT&CK Mapping

| Tactic | Technique | Why It Applies |
| --- | --- | --- |
| Initial Access | `T1190 - Exploit Public-Facing Application` | The web application was attacked through SQL injection |
| Collection | `T1005 - Data from Local System` | Sensitive application/database data was targeted |
| Exfiltration | `T1048 - Exfiltration Over Alternative Protocol` | Data was encoded into DNS queries |
| Command and Control | `T1071.004 - DNS` | DNS was used as the communication channel |

## Defensive Recommendations

- Use parameterized queries and input validation to prevent SQL injection.
- Monitor HTTP logs for SQL keywords in request parameters, especially `union`, `select`, and comment operators such as `--`.
- Alert on unusually long DNS query labels and high-entropy subdomains.
- Restrict outbound DNS so clients use approved internal resolvers only.
- Log DNS queries centrally and retain enough history for exfiltration investigations.
- Treat DNS as a security telemetry source, not just basic network plumbing.

## Screenshots To Add Before Publishing

- Kibana HTTP dashboard showing the filtered June 2020 event.
- Sanitized HTTP log detail showing the SQL injection pattern.
- CapME transcript with sensitive values redacted.
- Kibana DNS dashboard showing long suspicious subdomains.
- Terminal output showing `xxd` decode workflow with decoded content redacted.

## Skills Demonstrated

- Web attack log analysis
- SQL injection recognition
- Kibana filtering and pivoting
- DNS anomaly investigation
- Hex decoding
- Sensitive-data redaction
- Exfiltration analysis
- SOC-style finding documentation

## Safety Note

Do not publish exposed usernames, passwords, credit card values, or raw private data in a public repository. Public write-ups should use sanitized examples and explain the impact without leaking sensitive content.
