FROM debian:bullseye

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y python3-pip sshpass git openssh-client libhdf5-dev libssl-dev libffi-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN pip3 install --upgrade pip cffi && \
    pip install ansible jmespath && \
    pip install --upgrade pywinrm && \
    rm -rf /root/.cache/pip

RUN mkdir /ansible && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

WORKDIR /ansible

CMD [ "ansible-playbook", "--version" ]
