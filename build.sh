#!/usr/bin/env bash

docker-terraform ()
{
  docker run --rm \
             -w /opt \
             -v $(pwd):/opt/ \
             -v ~/.aws:/root/.aws \
             -v ~/.ssh:/root/.ssh \
             sivakumarvunnam/terraform-ansible-packer-awscli terraform $@
}

docker-ansible ()
{
  docker run --rm \
             -w /opt \
             -v $(pwd):/opt/ \
             -v ~/.aws:/root/.aws \
             -v ~/.ssh:/root/.ssh \
             sivakumarvunnam/terraform-ansible-packer-awscli ansible $@
}

docker-packer ()
{
  docker run --rm \
             -w /opt \
             -v $(pwd):/opt/ \
             -v ~/.aws:/root/.aws \
             -v ~/.ssh:/root/.ssh \
             sivakumarvunnam/terraform-ansible-packer-awscli packer $@
}

docker-aws ()
{
  docker run --rm \
             -w /opt \
             -v $(pwd):/opt/ \
             -v ~/.aws:/root/.aws \
             -v ~/.ssh:/root/.ssh \
             sivakumarvunnam/terraform-ansible-packer-awscli aws $@
}
