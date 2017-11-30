#!/bin/bash

# preparation
yum update

# install additional packages (for centos7 minimal)   
sudo yum -y install curl git core gcc make zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel python-virtualenv 
sudo yum -y openssl-devel ncurses-devel tk-devel gdbm-devel db4-devel libpcap-devel expat-devel

# install environment 
sudo cat << EOF >> ~/.bash_profile
export PATH="/home/student/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF

# download environment
source ~/.bash_profile

# install 
curl -L https://raw.github.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# install python v.2.7 and 3.5.5
pyenv install 2.7.14
pyenv install 3.5.4

## create virtualenv for python v.2.7
pyenv virtualenv venv2.7
# activate virtualenv with python v.2.7
pyenv activate venv2.7
# set python v2.7 as default
pyenv global 2.7.14
# check current python version
python --version
# deactivate virtualenv with python v.2.7
pyenv deactivate

## create virtualenv for python v.3.5
pyenv virtualenv venv3.5
# activate virtualenv with python v.3.5
pyenv activate venv3.5
# set python as default
pyenv global 3.5.4
# check current python version
python --version
# deactivate virtualenv with python v.3.5
pyenv deactivate
