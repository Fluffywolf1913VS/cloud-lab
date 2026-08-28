# AWS EC2, EBS, AMI and Snapshot Lifecycle

Hands-on AWS Cloud Practitioner lab demonstrating how **Amazon EC2, Amazon EBS, AMIs, and EBS snapshots** work together during the lifecycle of a virtual machine.

## Architecture

```text
User
  |
  v
Amazon EC2 instance
  |
  +--> Root EBS volume
  |
  +--> Additional EBS volume
  |
  v
Create AMI
  |
  +--> EBS snapshot(s)
  |
  v
Reusable EC2 image/template
```

## What We Built

1. Launched an Amazon Linux 2023 EC2 instance.
2. Used a `t2.micro` instance type for the guided practice.
3. Attached two 8 GiB EBS volumes: one root volume and one additional EBS volume.
4. Created an AMI from the configured EC2 instance.
5. Observed how the AMI is backed by EBS snapshots.
6. Terminated the original EC2 instance.
7. Deleted the remaining EBS resources and snapshots during cleanup.
8. In the DIY validation stage, launched a separate `t3.micro` EC2 instance and used its Instance ID for validation.

## Why This Matters in Production

This demonstrates a common production pattern: **build once, capture the server image, and reuse it**.

Instead of rebuilding a server manually every time, a team can configure an EC2 instance, create an AMI, and use that AMI as a repeatable template.

Typical production uses include:

- standardized server images;
- scaling identical application servers;
- disaster recovery and rebuilds;
- golden-image patching and redeployment;
- test and staging environments;
- preserving a known-good configuration;
- EBS backup through snapshots.

## Key Concepts

| AWS Service | Purpose |
|---|---|
| Amazon EC2 | Virtual machine / compute instance |
| Amazon EBS | Persistent block storage attached to EC2 |
| AMI | Reusable template used to launch EC2 instances |
| EBS Snapshot | Point-in-time copy of an EBS volume |

## EC2 and EBS

The guided practice instance used two EBS-backed volumes:

- 1 x 8 GiB root EBS volume
- 1 x 8 GiB additional EBS volume

This shows that compute and storage are separate AWS resources: EC2 provides compute, while EBS provides persistent block storage.

## AMI Creation

An AMI was created from the configured EC2 instance.

```text
Configured EC2 instance
        |
        v
      Create AMI
        |
        v
Reusable server template
        |
        +--> EC2 instance A
        +--> EC2 instance B
        +--> EC2 instance C
```

## AMI and Snapshots

For an EBS-backed AMI, AWS uses EBS snapshots to preserve the storage state required by the image.

```text
EC2
 |
 +--> EBS volume(s)
        |
        v
   EBS snapshot(s)
        |
        v
       AMI
```

An **AMI is not the same as a snapshot**:

- the AMI is the launchable server template;
- the snapshot is the point-in-time copy of EBS volume data.

## Instance Termination

After creating the AMI, the original EC2 instance was terminated.

The AMI can remain available after the source instance is gone, allowing new servers to be rebuilt from the saved image.

## Cleanup

Unused EBS resources and snapshots were deleted at the end of the lab.

Cleanup matters because storage resources can continue generating costs even after an EC2 instance has been terminated.

## Production Example

```text
Build EC2 server
      |
      v
Install software and security configuration
      |
      v
Create AMI
      |
      v
Launch standardized instances from the AMI
      |
      v
Replace the AMI when a new approved image is ready
```

This is commonly associated with a **golden image** approach.

## Key Takeaways

- EC2 provides compute.
- EBS provides persistent block storage.
- Snapshots are point-in-time copies of EBS volumes.
- AMIs are reusable templates for launching EC2 instances.
- AMIs and snapshots are related but are not the same thing.
- Terminating an EC2 instance does not necessarily remove every related storage resource.
- Cleanup is important for both cost management and good cloud hygiene.

## Screenshots

The `screenshots/` folder contains selected evidence from the lab:

1. Architecture overview
2. EC2 storage configuration with two EBS volumes
3. AMI creation
4. Snapshot cleanup

## Training Context

Completed in an AWS Skill Builder / SimuLearn environment as part of AWS Certified Cloud Practitioner (CLF-C02) hands-on training.
