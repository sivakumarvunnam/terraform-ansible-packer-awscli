FROM ubuntu:bionic-20210222

ARG TERRAFORM_VERSION="0.15.5"
ARG ANSIBLE_VERSION="2.10.6"
ARG PACKER_VERSION="1.7.3"
ARG AWSCLI_VERSION="1.19.27"

LABEL maintainer="Sivakumar Vunnam <sivakumarvunnam1@gmail.com>"
LABEL terraform_version=${TERRAFORM_VERSION}
LABEL ansible_version=${ANSIBLE_VERSION}
LABEL packer_version=${PACKER_VERSIONE}
LABEL aws_cli_version=${AWSCLI_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}
ENV PACKER_VERSION=${PACKER_VERSION}
ENV AWSCLI_VERSION=${AWSCLI_VERSION}
RUN apt-get update \
    && apt-get install -y ansible curl python3 python3-pip python3-boto unzip  \
    && pip3 install --upgrade awscli==${AWSCLI_VERSION} \
    && curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && curl -LO https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip '*.zip' -d /usr/local/bin \
    && rm *.zip

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/app

VOLUME ["/opt/app"]

CMD ["/bin/bash"]
