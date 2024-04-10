#/bin/bash
# root 권한으로 실행

OS_CHECK="$(cat /proc/version)"
GPU_CHECK="$()"

if [[ "$OS_CHECK" =~ "ubuntu" ]] || [[ "$OS_CHECK" =~ "Ubuntu" ]]; then
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER
    sudo service docker restart
    echo "Docker for Ubuntu download complete!"
elif [[ "$OS_CHECK" =~ "centos" ]]; then
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker
    sudo usermod -aG docker $USER
    sudo service docker restart
    echo "Docker for CentOS download complete!"
else
    echo "check OS version is ubuntu or centos"
fi

if [[ "$OS_CHECK" =~ "ubuntu" ]] || [[ "$OS_CHECK" =~ "Ubuntu" ]]; then
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER
    sudo service docker restart
    echo "Docker for Ubuntu download complete!"
elif [[ "$OS_CHECK" =~ "centos" ]]; then
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker
    sudo usermod -aG docker $USER
    sudo service docker restart
    echo "Docker for CentOS download complete!"
else
    echo "check OS version is ubuntu or centos"
fi
