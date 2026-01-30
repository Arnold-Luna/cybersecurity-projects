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

## Evidence
See `/findings/screenshots/`
