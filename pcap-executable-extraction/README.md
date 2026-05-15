# Extracting An Executable From A PCAP

## Overview

This project documents how I analyzed a packet capture in Wireshark and extracted a downloaded Windows executable from HTTP traffic. The goal was to understand how file downloads appear at the packet level and how an analyst can safely recover an object for further malware analysis.

## Scenario

The lab PCAP, `nimda.download.pcap`, contained traffic related to a malware download. The task was to:

- Inspect the HTTP request
- Follow the TCP stream
- Understand binary content in the stream
- Export the downloaded file
- Confirm the recovered file type
- Recommend safe next steps for malware analysis

## Tools Used

- Wireshark
- Linux terminal
- `file`
- TCP stream analysis
- HTTP object export

## Investigation Workflow

### 1. Opened The PCAP In Wireshark

The PCAP was opened from the lab support directory:

```bash
wireshark nimda.download.pcap &
```

Packets one through three represented the TCP handshake. The fourth packet showed the HTTP GET request for the downloaded file.

Observed connection:

| Field | Value |
| --- | --- |
| Source | `209.165.200.235` |
| Destination | `209.165.202.133` |
| Protocol | HTTP |
| Requested file | `W32.Nimda.Amm.exe` |

### 2. Followed The TCP Stream

Using Wireshark's Follow TCP Stream feature, I reviewed the full conversation. Most of the stream appeared as unreadable symbols because the file content was binary data, not normal text.

Important distinction:

- The symbols were not random connection noise.
- They represented the raw executable bytes.
- Some readable ASCII strings appeared because executables often contain embedded strings.

The readable fragments suggested the file was actually `wget.exe`, even though it was named `W32.Nimda.Amm.exe` in the lab.

### 3. Exported The HTTP Object

Wireshark's HTTP object export feature showed one downloadable object:

```text
W32.Nimda.Amm.exe
```

It was the only file in the capture because the PCAP contained the traffic for that specific download session.

After exporting the file, the lab directory showed a recovered executable of approximately `345088` bytes.

### 4. Confirmed The File Type

The `file` command identified the exported object as a Windows executable:

```bash
file W32.Nimda.Amm.exe
```

Observed result:

```text
W32.Nimda.Amm.exe: PE32+ executable (console) x86-64, for MS Windows
```

This confirmed that the HTTP object export produced a valid Windows PE executable.

## Key Findings

| Question | Finding |
| --- | --- |
| Was an executable downloaded? | Yes |
| Protocol used | HTTP |
| File name in PCAP | `W32.Nimda.Amm.exe` |
| Actual clue from strings | `wget.exe` |
| File type | PE32+ Windows executable |
| Safe next step | Hash and analyze in a sandbox |

## Safe Malware-Analysis Next Steps

After extracting a suspicious executable, a security analyst should not run it on a normal workstation. Safer next steps include:

- Generate cryptographic hashes such as SHA256.
- Run `strings` to identify readable indicators.
- Inspect PE headers with static-analysis tools.
- Submit the hash, not the file, to reputation services when possible.
- Analyze behavior inside an isolated malware sandbox.
- Preserve chain of custody if the artifact is part of an incident.

Example hash workflow:

```bash
sha256sum W32.Nimda.Amm.exe
```

## MITRE ATT&CK Mapping

| Tactic | Technique | Why It Applies |
| --- | --- | --- |
| Command and Control/Delivery | `T1105 - Ingress Tool Transfer` | A Windows executable was transferred over HTTP |
| Defense Evasion | `T1036 - Masquerading` | The file name did not clearly match the executable clue found in the stream |

## Defensive Recommendations

- Monitor HTTP downloads of executable file types.
- Alert on PE files transferred over unencrypted HTTP.
- Use web proxy controls to block suspicious executable downloads.
- Store PCAPs and HTTP logs long enough for retrospective analysis.
- Detonate suspicious binaries only in an isolated malware-analysis environment.

## Skills Demonstrated

- PCAP analysis
- Wireshark TCP stream reconstruction
- HTTP object extraction
- File signature interpretation
- Windows PE identification
- Malware-handling safety awareness
- Analyst documentation
