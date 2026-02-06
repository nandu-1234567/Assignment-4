<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Assignment-4 | Terraform Private EC2 with Strapi</title>
  <style>
    body {
      font-family: "Segoe UI", Arial, sans-serif;
      background-color: #f8fafc;
      color: #0f172a;
      margin: 40px;
      line-height: 1.7;
    }
    h1, h2, h3 {
      color: #020617;
    }
    pre {
      background: #020617;
      color: #e5e7eb;
      padding: 16px;
      border-radius: 8px;
      overflow-x: auto;
    }
    code {
      background: #e5e7eb;
      padding: 3px 6px;
      border-radius: 4px;
    }
    .card {
      background: #ffffff;
      border: 1px solid #e5e7eb;
      border-radius: 12px;
      padding: 22px;
      margin-bottom: 30px;
    }
    ul {
      margin-left: 20px;
    }
    .highlight {
      background: #eff6ff;
      border-left: 5px solid #2563eb;
      padding: 14px;
      margin: 18px 0;
    }
  </style>
</head>

<body>

<h1>🚀 Assignment-4: Terraform Private EC2 with Strapi</h1>

<div class="card">
  <h2>📌 Project Overview</h2>
  <p>
    This project provisions an AWS infrastructure using <strong>Terraform</strong>
    where a <strong>Strapi application</strong> runs on a
    <strong>private EC2 instance</strong>.
    The application is accessed securely via an
    <strong>Application Load Balancer (ALB)</strong>
    deployed in a public subnet.
  </p>
</div>

<div class="card">
  <h2>🏗 Architecture</h2>
  <ul>
    <li>Custom VPC</li>
    <li>Public Subnet (ALB)</li>
    <li>Private Subnet (EC2)</li>
    <li>NAT Gateway for outbound internet</li>
    <li>Private EC2 running Strapi in Docker</li>
    <li>Application Load Balancer</li>
    <li>Security Groups for controlled access</li>
  </ul>

  <pre>
User → ALB (Public Subnet)
           ↓
      EC2 (Private Subnet)
           ↓
        NAT Gateway
           ↓
         Internet
  </pre>
</div>

<div class="card">
  <h2>📁 Folder Structure</h2>
  <pre>
assignment-4/
│
├── main.tf
├── provider.tf
├── variable.tf
├── terraform.tfvars
│
├── security.tf
├── ec2.tf
├── lb.tf
├── output.tf
│
├── user_data.sh
└── README.html
  </pre>
</div>

<div class="card">
  <h2>📄 File Responsibilities</h2>

  <h3>provider.tf</h3>
  <p>Defines AWS provider and region.</p>

  <h3>variable.tf</h3>
  <p>Declares all Terraform input variables.</p>

  <h3>terraform.tfvars</h3>
  <p>Stores environment-specific values such as CIDR blocks, instance type, and key pair.</p>

  <h3>main.tf</h3>
  <p>Creates VPC, subnets, route tables, internet gateway, and NAT gateway.</p>

  <h3>security.tf</h3>
  <p>Defines security groups for:</p>
  <ul>
    <li>ALB (HTTP access from internet)</li>
    <li>EC2 (Strapi port access from ALB only)</li>
  </ul>

  <h3>ec2.tf</h3>
  <p>Creates the private EC2 instance and attaches <code>user_data.sh</code>.</p>

  <h3>lb.tf</h3>
  <p>Creates Application Load Balancer, target group, and listener.</p>

  <h3>output.tf</h3>
  <p>Outputs ALB DNS name and EC2 details.</p>
</div>

<div class="card">
  <h2>🐳 user_data.sh – Strapi Auto Setup</h2>
  <p>
    This script installs Docker and runs Strapi automatically
    when the EC2 instance launches.
  </p>

  <pre>
#!/bin/bash
yum update -y
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

docker run -d \
  -p 1337:1337 \
  --name strapi \
  strapi/strapi
  </pre>

  <div class="highlight">
    EC2 requires a NAT Gateway to download Docker images because it is in a private subnet.
  </div>
</div>

<div class="card">
  <h2>🌍 terraform.tfvars Example</h2>
  <pre>
region           = "ap-south-1"
environment      = "dev"
vpc_cidr         = "10.0.0.0/16"
public_subnet    = "10.0.1.0/24"
private_subnet   = "10.0.2.0/24"
instance_type    = "t3.micro"
key_name         = "assignment4-key"
  </pre>
</div>

<div class="card">
  <h2>🚦 Deployment Steps</h2>
  <ol>
    <li>Configure AWS credentials</li>
    <li>Initialize Terraform
      <pre>terraform init</pre>
    </li>
    <li>Validate configuration
      <pre>terraform validate</pre>
    </li>
    <li>Apply infrastructure
      <pre>terraform apply</pre>
    </li>
  </ol>
</div>

<div class="card">
  <h2>🌐 Accessing Strapi</h2>
  <p>
    After deployment, Terraform outputs the ALB DNS name.
  </p>
  <pre>
http://&lt;ALB_DNS_NAME&gt;
  </pre>
  <p>
    The ALB forwards traffic to the private EC2 instance
    running Strapi on port <code>1337</code>.
  </p>
</div>

<div class="card">
  <h2>🧹 Cleanup</h2>
  <pre>terraform destroy</pre>
</div>

<div class="card">
  <h2>✅ Key Highlights</h2>
  <ul>
    <li>Private EC2 for better security</li>
    <li>Public access only via ALB</li>
    <li>NAT Gateway for outbound internet</li>
    <li>Automated Strapi deployment</li>
    <li>Environment controlled via tfvars</li>
  </ul>
</div>

<hr>
<p><strong>Project:</strong> Assignment-4</p>
<p><strong>Technology:</strong> Terraform | AWS | Docker | Strapi</p>

</body>
</html>
