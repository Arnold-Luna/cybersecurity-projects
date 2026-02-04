# Assessment Findings

## Domain Tested
exampledomain.com

## SPF Results
- SPF record present
- SoftFail (`~all`) detected
- Multiple third-party senders identified

**Risk:** Medium  
SoftFail allows unauthorized senders to deliver spoofed messages.

## DKIM Results
- DKIM record missing
- No active signing observed

**Risk:** High  
Unsigned emails increase spoofing and impersonation risk.

## DMARC Results
- Policy: p=none
- No enforcement configured

**Risk:** Medium  
DMARC is in monitoring mode only, allowing malicious emails to pass.

## Supporting Evidence
## Email Authentication Results (MXToolbox)

[![MXToolbox Email Authentication Results](screenshots/email%20redacted.png)](screenshots/email%20redacted.png)

*Figure: MXToolbox scan output showing SPF, DKIM, and DMARC authentication results used to support assessment findings.*
