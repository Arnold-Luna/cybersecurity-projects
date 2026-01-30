# Remediation Recommendations

## SPF
- Replace SoftFail with HardFail (`-all`) after validation
- Reduce DNS lookup count to below 10

## DKIM
- Implement DKIM signing for all outbound mail servers
- Rotate keys periodically

## DMARC
- Move from `p=none` to `p=quarantine`
- Eventually enforce `p=reject`
- Enable aggregate and forensic reporting

## Security Impact
Proper implementation significantly reduces phishing, spoofing, and BEC risk.
