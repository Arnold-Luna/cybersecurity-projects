# Email Security Assessment – SPF, DKIM, DMARC

## Overview
This project demonstrates hands-on experience evaluating email security controls by testing SPF, DKIM, and DMARC records using MXToolbox. The assessment focuses on identifying misconfigurations that could enable spoofing, phishing, or email delivery failures.

## Objectives
- Evaluate domain email security posture
- Identify SPF, DKIM, and DMARC misconfigurations
- Assess risk of spoofing and phishing attacks
- Provide remediation recommendations aligned with best practices

## Tools Used
- MXToolbox
- Public DNS record analysis
- Email authentication standards (SPF, DKIM, DMARC)

## Methodology
1. Selected target domain for assessment
2. Collected MX, SPF, DKIM, and DMARC records using MXToolbox
3. Analyzed authentication results and error states
4. Documented findings and assessed security impact
5. Provided actionable remediation guidance

## Key Findings
- SPF record misalignment identified
- DMARC policy set to `p=none`, allowing spoofed emails to pass monitoring-only mode
- DKIM selector missing or improperly configured

## Outcome
This assessment highlights how improper email authentication configuration can increase phishing and spoofing risk and demonstrates a repeatable methodology for evaluating email security controls.

## Disclaimer
All testing was performed on domains owned by the author or publicly available test domains. No unauthorized testing was conducted.
