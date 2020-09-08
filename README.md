# Creating multi-arch headless browsing (Puppeteer) Docker image
For building the multi-arch images, we are going to produce native build docker images using AWS CodeBuild, publish them to ECR, and then tie them together with a docker image manifest.

I referenced the following documentation to complete the solution:
https://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html
https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-multi-architecture-image.html

##CodeBuild Projects
Let's start with creating two CodeBuild projects, one for x86 and one for arm64. The projects should be boilerplate, reading source from your SCM or getting the it via the CodeBuild Jenkins Plugin. Each should be configured to run the standard image of your choice and ont he proper architecture (x86 or Arm).

![Image of ARM Project]
(https://github.com/AdamTylerLynch/puppeteer-multiarch/blob/main/images/Figure1.png)

![Image of x86 Project]
(https://github.com/AdamTylerLynch/puppeteer-multiarch/blob/main/images/Figure2.png)