# Email Authentication Assessment (SPF, DKIM, DMARC)

## Overview
This lab documents the evaluation of email authentication controls to identify misconfigurations that could enable phishing, spoofing, or business email compromise (BEC).

## Incident Context
Weak or improperly enforced SPF, DKIM, and DMARC policies are commonly exploited during phishing campaigns and email-based attacks.

## Tools Used
- MXToolbox
- DNS record analysis

## Methodology
- Collected MX, SPF, DKIM, and DMARC records
- Analyzed policy enforcement and alignment
- Identified gaps impacting spoofing prevention
- Documented findings and remediation steps

## Key Findings
- SPF SoftFail configuration identified
- DKIM signing missing or misconfigured
- DMARC policy set to monitoring mode (`p=none`)

## Impact
Misconfigured email authentication increases the likelihood of:
- Domain spoofing
- Credential harvesting
- Business Email Compromise

## Outcome
This assessment demonstrates how email authentication weaknesses are identified, analyzed, and remediated as part of an incident response workflow.
