# AWS IAM Threat Detection & Automated Alerting Pipeline

A cloud-native security monitoring project that detects **high-risk IAM activity in AWS**, enriches events with severity context, stores incident evidence in **DynamoDB**, and sends **real-time email alerts** using a serverless response pipeline.

This project simulates a lightweight **SOC detection engineering workflow** using AWS-native services and demonstrates how suspicious IAM changes can be transformed into actionable alerts for incident response.

---

## 🚀 Project Overview

This pipeline monitors CloudTrail management events for dangerous IAM actions such as:

* `CreateUser`
* `AttachUserPolicy`
* `AttachRolePolicy`
* `CreateAccessKey`
* `PutUserPolicy`
* `CreatePolicyVersion`
* `SetDefaultPolicyVersion`

When a risky action occurs:

1. **CloudTrail** captures the management event
2. **EventBridge** filters for high-risk IAM actions
3. **Lambda** enriches the event with severity and metadata
4. **DynamoDB** stores the incident record
5. **SNS** sends an email alert
6. **CloudWatch** tracks Lambda performance and invocations

---

## 🏗️ Architecture

```text
CloudTrail → EventBridge Rule → Lambda Enrichment → DynamoDB → SNS Email Alert
                                              ↓
                                        CloudWatch Metrics
```

---

## 📸 Detection Pipeline Screenshots

These screenshots document the **full detection lifecycle**, from event ingestion to alert delivery and evidence retention.

### 1) EventBridge High-Risk IAM Detection Rule

Shows the event pattern used to detect dangerous IAM management actions from CloudTrail, including policy attachment and identity changes.

![EventBridge Rule](sandbox:/mnt/data/01_eventbridge_detection_rule.png)

### 2) Lambda Monitoring & Execution Metrics

Highlights successful serverless processing, invocation counts, duration, concurrency, and throttling visibility through CloudWatch metrics.

![Lambda Monitor](sandbox:/mnt/data/02_lambda_monitor_metrics.png)

### 3) DynamoDB Incident Evidence Record

Displays a **HIGH severity incident record** enriched by Lambda and persisted for investigation, including actor, event name, timestamp, region, severity, and raw event evidence.

![DynamoDB Incident Record](sandbox:/m

### 4) SNS High-Severity Email Alert

Demonstrates real-time alert delivery containing threat context, severity classification, source IP, actor ARN, and incident correlation ID.

![SNS Email Alert](./screenshots/04_high_severity_email_alert.png)

### 5) CloudTrail Logging Pipeline Reference

Validates that CloudTrail successfully captured and delivered IAM management events into the detection pipeline.

![CloudTrail Reference](./screenshots/05_detection_pipeline_reference.png)

---

## 🔍 Detection Logic

### Medium Severity

* `CreateUser`
* `DeleteUser`
* `CreateAccessKey`

### High Severity

* `AttachUserPolicy`
* `AttachRolePolicy`
* `PutUserPolicy`
* `PutRolePolicy`
* `CreatePolicyVersion`
* `SetDefaultPolicyVersion`

### Critical Severity (Planned Enhancement)

* `CreateLoginProfile`
* `DeactivateMFADevice`
* `DeleteVirtualMFADevice`
* `ConsoleLogin` without MFA

---

## 🛠️ AWS Services Used

* **AWS Lambda**
* **Amazon EventBridge**
* **AWS CloudTrail**
* **Amazon DynamoDB**
* **Amazon SNS**
* **Amazon CloudWatch**
* **IAM**

---

## 🎯 Security Outcomes

This project demonstrates:

* Detection engineering with event-driven logic
* Serverless incident enrichment
* Real-time alert automation
* Severity-based threat triage
* Evidence retention for investigations
* Cloud-native SOC workflows
* AWS monitoring and observability

---

## 💼 Resume Impact

* Built a serverless AWS IAM threat detection pipeline using CloudTrail, EventBridge, Lambda, DynamoDB, and SNS to identify risky IAM modifications and automate real-time alerting.
* Engineered severity-based detection logic that classified IAM activity into Medium and High risk tiers, stored enriched evidence for investigations, and improved response visibility through CloudWatch monitoring.

---

## 🔮 Future Improvements

* Add **critical-risk detections** for MFA tampering and console abuse
* Push alerts into **Slack / Microsoft Teams**
* Add **GeoIP enrichment** for source IP analysis
* Integrate **GuardDuty findings correlation**
* Export incidents to **Security Lake / SIEM**
* Add automated response playbooks with Step Functions

---

## 👨‍💻 Author

Built by a cybersecurity professional focused on:

* Security Operations
* Cloud Security
* Detection Engineering
* Incident Response
* AWS Security Automation

If this project aligns with your team’s needs, I’d love to connect.
