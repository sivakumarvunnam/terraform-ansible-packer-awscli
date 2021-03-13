FROM ubuntu:bionic-20210222

ARG TERRAFORM_VERSION="0.14.8"

LABEL maintainer="Sivakumar Vunnam <sivakumarvunnam1@gmail.com>"
LABEL terraform_version=${TERRAFORM_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}
RUN apt-get update \
    && apt-get install -y ansible curl python3 python3-pip python3-boto unzip  \
    && curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip '*.zip' -d /usr/local/bin \
    && rm *.zip

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
