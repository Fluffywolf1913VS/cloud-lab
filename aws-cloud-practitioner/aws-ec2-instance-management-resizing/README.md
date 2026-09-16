# AWS EC2 Instance Management and Resizing

Hands-on AWS Cloud Practitioner / Cloud Quest lab demonstrating how to **select, access, inspect, stop, start, and resize an Amazon EC2 instance**.

## Mission Goal

The objective was to improve the capacity of an Amazon EC2 workload by selecting an appropriate instance type and resizing the instance from `t3.micro` to `m4.large`.

The lab covered:

- filtering EC2 instance types based on workload characteristics;
- connecting to an EC2 instance;
- viewing instance metadata;
- stopping and starting an EC2 instance;
- changing the EC2 instance type from `t3.micro` to `m4.large`.

## Architecture

```text
User
 |
 +-----------------------------+
 |                             |
 v                             v
Web Browser                AWS Systems Manager
 |                             |
 |                             v
 |                       Session Manager
 |                             |
 +-------------+---------------+
               |
               v
         Amazon EC2
          t3.micro
               |
               +--> Instance Metadata
               |
               v
          Stop Instance
               |
               v
      Change Instance Type
               |
               v
          m4.large
               |
               v
          Start Instance
```

## What We Did

### 1. Identified the EC2 workload

The lab started with an existing EC2 instance named:

```text
AWS Computing Solutions
```

The initial instance type was:

```text
t3.micro
```

This belongs to the T3 general-purpose burstable family.

### 2. Reviewed instance type information

We reviewed the instance type and family to understand how AWS groups EC2 resources according to workload needs.

The instance exposed information such as:

- Instance ID
- Instance Type
- Availability Zone
- Instance Family

Example:

```text
Instance Type: t3.micro
Instance Family: t3
Availability Zone: us-east-1a
```

### 3. Connected to the EC2 instance

The lab demonstrated EC2 connection options for Linux instances, including browser-based access and AWS-managed access methods.

Modern console options include:

- EC2 Instance Connect
- EC2 Instance Connect Endpoint
- AWS Systems Manager Session Manager
- EC2 Serial Console
- SSH client

A key production concept is **AWS Systems Manager Session Manager**, which can provide shell access without exposing inbound SSH access to the internet when IAM and the instance are configured correctly.

### 4. Inspected EC2 instance metadata

The lab demonstrated how instance metadata can provide environment-specific information such as:

- Instance ID
- Instance Type
- Availability Zone
- Instance Family

This is useful for automation and for applications that need to discover details about the EC2 environment in which they are running.

### 5. Stopped the EC2 instance

Before resizing the instance, we stopped it:

```text
Running
   |
   v
Stopping
   |
   v
Stopped
```

The instance must be fully stopped before changing many instance-type settings.

### 6. Changed the instance type

From the AWS console:

```text
Actions
  -> Instance settings
      -> Change instance type
```

we resized the instance from:

```text
t3.micro
```

to:

```text
m4.large
```

### 7. Started the resized instance

After the resize, we started the instance again:

```text
Stopped
   |
   v
Pending
   |
   v
Running
```

## Why This Matters in Production

This lab demonstrates **vertical scaling**.

```text
Smaller EC2
  t3.micro
     |
     | Resize
     v
Larger EC2
  m4.large
```

Vertical scaling is useful when:

- an application needs more memory;
- CPU demand increases;
- an instance is undersized;
- a workload moves from development to production;
- performance requirements change;
- administrators need to optimize cost versus performance.

## Vertical vs Horizontal Scaling

### Vertical Scaling

```text
1 small EC2
    |
    v
1 larger EC2
```

### Horizontal Scaling

```text
       Load Balancer
       /    |    \
     EC2   EC2   EC2
```

Horizontal scaling adds more instances instead of increasing the size of one instance. It is commonly combined with Elastic Load Balancing and EC2 Auto Scaling.

## Production Security Note

When correctly configured, **Session Manager** can reduce the need for:

- inbound TCP/22 from the internet;
- SSH key distribution;
- bastion hosts.

Access can instead be controlled with IAM and AWS Systems Manager.

## Key AWS Concepts

| AWS Feature | Purpose |
|---|---|
| Amazon EC2 | Virtual compute instance |
| EC2 Instance Type | Defines CPU, memory, networking, and other capabilities |
| Instance Family | Groups instance types by workload characteristics |
| EC2 Instance Connect | Managed connection method for EC2 |
| Systems Manager Session Manager | IAM-controlled shell access |
| Instance Metadata | Instance-specific environment information |
| Stop / Start | EC2 lifecycle operations |
| Change Instance Type | Resize an EC2 workload |
| Vertical Scaling | Increase or decrease resources on one server |

## Troubleshooting Performed

During the lab, we encountered an EC2 state-transition issue when attempting to restart the instance before it had completely stopped.

This reinforced the EC2 lifecycle sequence:

```text
Running
  -> Stopping
  -> Stopped
  -> Pending
  -> Running
```

AWS operations are state-dependent, so certain actions are unavailable while an instance is still transitioning.

## Key Takeaways

- EC2 instance families are optimized for different workload characteristics.
- Instance types determine the resources assigned to an EC2 instance.
- Session Manager can provide secure administrative access without traditional inbound SSH exposure.
- Instance metadata exposes information about the EC2 environment.
- EC2 instances can be stopped and restarted from the console.
- A stopped instance can be resized by changing its instance type.
- Changing `t3.micro` to `m4.large` is an example of vertical scaling.
- Highly available systems often combine right-sizing with horizontal scaling.

## Screenshots

The `screenshots/` folder contains:

```text
01-mission-architecture.png
```

This screenshot shows the mission architecture and the resize path from `t3.micro` to `m4.large`.

## Training Context

Completed in AWS Cloud Quest / AWS Skill Builder as part of AWS Certified Cloud Practitioner hands-on training.
