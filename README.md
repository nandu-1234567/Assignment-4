<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Assignment-4 | Steps to Deploy Strapi using Terraform</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9fafb;
      color: #111827;
      margin: 40px;
      line-height: 1.8;
    }
    h1, h2 {
      color: #020617;
    }
    .step {
      background: #ffffff;
      border: 1px solid #e5e7eb;
      border-radius: 10px;
      padding: 20px;
      margin-bottom: 25px;
    }
    .note {
      background: #eff6ff;
      border-left: 5px solid #2563eb;
      padding: 12px;
      margin-top: 10px;
    }
    ul {
      margin-left: 20px;
    }
  </style>
</head>

<body>

<h1>🚀 Assignment-4: Step-by-Step Procedure</h1>

<div class="step">
  <h2>Step 1: Prepare the Environment</h2>
  <ul>
    <li>Install Terraform on your system</li>
    <li>Create an AWS account (if not already available)</li>
    <li>Configure AWS credentials on your machine</li>
    <li>Ensure IAM user has EC2, VPC, ELB, and IAM permissions</li>
  </ul>
</div>

<div class="step">
  <h2>Step 2: Create Project Folder</h2>
  <ul>
    <li>Create a folder named <strong>assignment-4</strong></li>
    <li>Inside the folder, create all required Terraform files</li>
    <li>Keep file naming consistent for better management</li>
  </ul>
</div>

<div class="step">
  <h2>Step 3: Configure Provider</h2>
  <ul>
    <li>Define AWS as the cloud provider</li>
    <li>Select the AWS region using variables</li>
    <li>Ensure provider version compatibility</li>
  </ul>
</div>

<div class="step">
  <h2>Step 4: Define Input Variables</h2>
  <ul>
    <li>Declare variables for region, environment, and CIDR blocks</li>
    <li>Define instance type and key pair name</li>
    <li>Keep variables reusable across environments</li>
  </ul>
</div>

<div class="step">
  <h2>Step 5: Configure Environment Values</h2>
  <ul>
    <li>Store all environment-specific values in <strong>terraform.tfvars</strong></li>
    <li>Avoid hardcoding values inside Terraform files</li>
    <li>This allows easy switching between dev, test, and prod</li>
  </ul>
</div>

<div class="step">
  <h2>Step 6: Create Networking</h2>
  <ul>
    <li>Create a VPC with a custom CIDR block</li>
    <li>Create a public subnet for the Load Balancer</li>
    <li>Create a private subnet for the EC2 instance</li>
    <li>Attach an Internet Gateway to the VPC</li>
    <li>Create a NAT Gateway for outbound internet access</li>
  </ul>
</div>

<div class="step">
  <h2>Step 7: Configure Security Groups</h2>
  <ul>
    <li>Create one security group for the Load Balancer</li>
    <li>Allow HTTP access from the internet</li>
    <li>Create another security group for the EC2 instance</li>
    <li>Allow application traffic only from the Load Balancer</li>
  </ul>
</div>

<div class="step">
  <h2>Step 8: Prepare User Data Script</h2>
  <ul>
    <li>Create a startup script for EC2</li>
    <li>Install Docker automatically on instance launch</li>
    <li>Run Strapi application using Docker</li>
  </ul>
  <div class="note">
    The EC2 instance must be in a private subnet and uses NAT Gateway to access the internet.
  </div>
</div>

<div class="step">
  <h2>Step 9: Launch Private EC2 Instance</h2>
  <ul>
    <li>Launch EC2 inside the private subnet</li>
    <li>Attach the EC2 security group</li>
    <li>Attach the key pair for SSH access</li>
    <li>Attach the user data script</li>
  </ul>
</div>

<div class="step">
  <h2>Step 10: Configure Application Load Balancer</h2>
  <ul>
    <li>Create an Application Load Balancer in the public subnet</li>
    <li>Attach ALB security group</li>
    <li>Create a target group pointing to the EC2 instance</li>
    <li>Configure listener on port 80</li>
  </ul>
</div>

<div class="step">
  <h2>Step 11: Output Important Values</h2>
  <ul>
    <li>Output the Load Balancer DNS name</li>
    <li>Use this DNS to access the Strapi application</li>
  </ul>
</div>

<div class="step">
  <h2>Step 12: Initialize Terraform</h2>
  <ul>
    <li>Run Terraform initialization</li>
    <li>Download required provider plugins</li>
  </ul>
</div>

<div class="step">
  <h2>Step 13: Validate and Apply</h2>
  <ul>
    <li>Validate Terraform configuration</li>
    <li>Apply the configuration to create AWS resources</li>
    <li>Approve when prompted</li>
  </ul>
</div>

<div class="step">
  <h2>Step 14: Access the Application</h2>
  <ul>
    <li>Copy the Load Balancer DNS name</li>
    <li>Open it in a browser</li>
    <li>Verify Strapi application is running</li>
  </ul>
</div>

<div class="step">
  <h2>Step 15: Clean Up Resources</h2>
  <ul>
    <li>Destroy Terraform-managed resources when not needed</li>
    <li>This avoids unnecessary AWS charges</li>
  </ul>
</div>

<hr>
<p><strong>Assignment:</strong> 4</p>
<p><strong>Technology:</strong> Terraform | AWS | Docker | Strapi</p>

</body>
</html>

    



