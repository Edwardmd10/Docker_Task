# This is a docker file 

FROM  centos:7
    # below code installs telnet & elinks
RUN yum update -y && \
    yum install telnet httpd -y  && \
    yum -y install elinks
    # below code installs terraform
RUN yum install curl wget unzip -y && \
    curl -O https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip && \
    unzip terraform_1.0.0_linux_amd64.zip && \
    mv terraform /usr/bin/
    # below code installs packer
RUN mv /usr/sbin/packer  /tmp && \
    yum install -y yum-utils  && \
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
    yum -y install packer

LABEL appname="sharedtools" 