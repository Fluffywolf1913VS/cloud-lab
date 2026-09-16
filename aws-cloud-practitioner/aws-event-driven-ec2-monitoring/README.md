# AWS Event-Driven EC2 Monitoring

Hands-on AWS Cloud Practitioner lab demonstrating an event-driven architecture using **Amazon EC2, Amazon EventBridge, AWS Lambda, and Amazon CloudWatch**.

## Architecture

```text
EC2 Instance
     |
     | State changes to "running"
     v
Amazon EventBridge
     |
     | Matching rule
     v
AWS Lambda
MonitorLabInstance
     |
     | Metrics and execution logs
     v
Amazon CloudWatch
