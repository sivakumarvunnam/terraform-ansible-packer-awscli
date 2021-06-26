# terraform-ansible-packer-awscli

Builds a docker image containing:

  * terraform v0.15.5
  * ansible   v2.10.6
  * awscli    v1.19.27
  * packer    v1.7.3

## Building Docker Image
```bash
docker build -t sivakumarvunnam/terraform-ansible-packer-awscli:v1 .
```

## Bash Functions
Add build.sh script to your profile (.bashrc or .bash_profile).  This creates shortcuts to quicly run commands with your current directory mapped as working directory in the docker image.  It also maps your .ssh and .aws folders to share keys and configs that the command might need.

I'm adding the prefix docker to the beginning of the command to indicate its a docker image version of the command.  If you do not have these command on your host, you can easily drop the docker.

```bash
docker-terraform ()
{
  docker run --rm \
             -w /opt \
             -v $(pwd):/opt/ \
             -v ~/.aws:/root/.aws \
             -v ~/.ssh:/root/.ssh \
             sivakumarvunnam/terraform-ansible-packer-awscli:v1 terraform $@
}

docker-ansible ()
{
  docker run --rm \
             -w /opt \
             -v $(pwd):/opt/ \
             -v ~/.aws:/root/.aws \
             -v ~/.ssh:/root/.ssh \
             sivakumarvunnam/terraform-ansible-packer-awscli:v1 ansible $@
}

docker-packer ()
{
  docker run --rm \
             -w /opt \
             -v $(pwd):/opt/ \
             -v ~/.aws:/root/.aws \
             -v ~/.ssh:/root/.ssh \
             sivakumarvunnam/terraform-ansible-packer-awscli:v1 packer $@
}

docker-aws ()
{
  docker run --rm \
             -w /opt \
             -v $(pwd):/opt/ \
             -v ~/.aws:/root/.aws \
             -v ~/.ssh:/root/.ssh \
             sivakumarvunnam/terraform-ansible-packer-awscli:v1 aws $@
}
```

Example usage:
```
vagrant@sivakumarvunnam:~/terraform-ansible-packer-awscli$ source build.sh
vagrant@sivakumarvunnam:~/terraform-ansible-packer-awscli$ docker-terraform --version
Terraform v0.15.5
vagrant@sivakumarvunnam:~/terraform-ansible-packer-awscli$ docker-ansible --version
ansible 2.5.1
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/root/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python2.7/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 2.7.17 (default, Feb 27 2021, 15:10:58) [GCC 7.5.0]
vagrant@sivakumarvunnam:~/terraform-ansible-packer-awscli$ docker-packer --version
1.7.3
vagrant@sivakumarvunnam:~/terraform-ansible-packer-awscli$ docker-aws --version
aws-cli/1.19.27 Python/3.6.9 Linux/4.19.130-boot2docker botocore/1.20.27
```
