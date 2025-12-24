🚀 AWS Continuous Integration and Continuous Deployment Demo

This project demonstrates how to set up Continuous Integration (CI) for a simple Python application using AWS CodePipeline and AWS CodeBuild, with GitHub as the source repository.

📌 1. Set Up GitHub Repository

To get started, create a GitHub repository to store your application's source code.

Steps

Go to github.com and sign in.

Click the “+” button in the top-right corner → select New repository.

Enter a repository name and an (optional) description.

Choose Public or Private, depending on your needs.

Select “Initialize this repository with a README”.

Click Create repository.

Your repository is now ready!

📌 2. Create an AWS CodePipeline

In this step, we will create an automated CI pipeline using AWS CodePipeline.

Steps

Open the AWS Management Console → search for AWS CodePipeline.

Click Create pipeline.

Enter a pipeline name → click Next.

Source Stage

Choose GitHub as the source provider.

Connect your GitHub account.

Select your repository and branch.

Build Stage

Choose AWS CodeBuild as the build provider.

Click Create project to configure a new CodeBuild project.

After creating the CodeBuild project, return to the pipeline flow.

(Optional) Add Deployment Stage, for example:

AWS Elastic Beanstalk

Amazon EC2

Amazon S3 static hosting

Review and click Create pipeline.

Your CI pipeline is now set up!

📌 3. Configure AWS CodeBuild

AWS CodeBuild will compile, test, and package your Python application.

Steps

Go to the AWS CodeBuild console.

Click Create build project.

Enter a project name.

Choose AWS CodePipeline as the source provider.

Link the pipeline you created earlier.

Configure the environment:

Operating system

Runtime (Python)

Compute size

Add build commands in the buildspec.yml file or directly in the console.
Example commands:

version: 0.2
phases:
  install:
    commands:
      - pip install -r requirements.txt
  build:
    commands:
      - python -m py_compile app.py
artifacts:
  files:
    - '**/*'


Save the project by clicking Create build project.

📌 4. Trigger the CI Process

After setup, triggering the CI pipeline is simple.

Steps

Go to your GitHub repository.

Make any code change — new feature, bug fix, etc.

Commit and push your changes to the tracked branch.

Go to AWS CodePipeline.

The pipeline will automatically detect the change and start:

Source stage: fetch latest GitHub code

Build stage: CodeBuild runs your build process

Deploy stage: (if configured)

Sit back and watch AWS perform your CI workflow! 🚀
