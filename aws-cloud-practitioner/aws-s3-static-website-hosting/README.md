# AWS S3 Static Website Hosting

Hands-on AWS Cloud Quest lab demonstrating how to migrate a simple static website to **Amazon S3** and serve it directly from an S3 website endpoint.

## Scenario

The goal of the mission was to improve the reliability of a city web portal by moving a static website to Amazon S3.

The site contains static assets such as:

- `index.html`
- `styles.css`
- `main.js`
- `target-file.csv`
- a custom error page

## Architecture

```text
Users
  |
  v
City Web Portal
  |
  | HTTP GET
  v
Amazon S3 Bucket
  |
  +--> index.html
  +--> styles.css
  +--> main.js
  +--> CSV data
  +--> error.html
  |
  +--> Bucket policy controls read access
```

## What We Did

### 1. Reviewed the S3 bucket contents

The lab provided an S3 bucket containing the website files.

We verified the objects stored in the bucket and confirmed that the website was made up entirely of static files.

### 2. Renamed the custom error page

The original object `text.html` was renamed to:

```text
error.html
```

This allowed it to be used as the website's custom error document.

### 3. Enabled S3 static website hosting

We enabled **Static website hosting** on the S3 bucket and selected:

```text
Host a static website
```

We configured:

```text
Index document: index.html
Error document: error.html
```

### 4. Configured access for the website

For users to retrieve objects from an S3 static website endpoint, the website content must be readable according to the bucket's public-access settings and bucket policy.

The lab architecture uses an S3 bucket policy with `s3:GetObject` permission to allow the website files to be retrieved.

### 5. Verified the website

After the configuration was completed, the website endpoint successfully loaded the **Beach Wave Conditions** page.

This confirmed that S3 was serving the HTML, CSS, JavaScript, and data files correctly.

## Why This Is Useful in Production

Amazon S3 is a strong option for hosting **static websites** because there is no web server to manage.

Instead of maintaining an EC2 instance with Apache or Nginx, the architecture can be simplified to:

```text
Traditional approach

Users
  |
  v
EC2 Web Server
  |
  +--> OS maintenance
  +--> Web server patches
  +--> Scaling
  +--> Storage
```

versus:

```text
Static S3 approach

Users
  |
  v
Amazon S3
  |
  +--> HTML
  +--> CSS
  +--> JavaScript
  +--> Images / data files
```

Benefits include:

- no server administration;
- high durability;
- automatic scalability;
- low operational overhead;
- pay-for-what-you-use pricing;
- easy integration with other AWS services.

## Production Improvement: CloudFront

For a real production website, a common architecture is:

```text
Users
  |
  v
Amazon CloudFront
  |
  v
Amazon S3
```

CloudFront can provide:

- HTTPS;
- global caching;
- lower latency;
- custom domain support;
- reduced direct exposure of the S3 origin.

A more secure production design normally keeps the S3 bucket private and allows access through CloudFront rather than exposing the bucket publicly.

## Key AWS Concepts

| AWS Service / Feature | Purpose |
|---|---|
| Amazon S3 | Object storage |
| S3 Bucket | Container for website files |
| S3 Object | Individual file stored in the bucket |
| Static Website Hosting | Serves static web content from S3 |
| Bucket Policy | Resource-based permissions for the bucket and its objects |
| `s3:GetObject` | Permission used to retrieve an object |
| Index document | Default page returned for the website root |
| Error document | Custom page returned when an error occurs |

## Cloud Practitioner Takeaways

Remember:

- **S3 is object storage**, not a traditional file system.
- S3 can host **static** websites.
- Static means the website is based on client-side files such as HTML, CSS, JavaScript, images, and data files.
- S3 does not run server-side application code like PHP or a traditional application server.
- Access to S3 objects is controlled using mechanisms such as bucket policies and public-access settings.
- CloudFront is commonly placed in front of S3 for a production-grade public website.

## Screenshots

The `screenshots/` folder contains selected evidence from the lab:

1. Cloud Quest mission and architecture
2. Initial S3 bucket objects
3. Renaming the custom error document
4. Static website hosting configuration
5. Successful hosting configuration
6. Final working static website

## Training Context

Completed in AWS Cloud Quest / AWS Skill Builder as part of AWS Certified Cloud Practitioner hands-on training.
