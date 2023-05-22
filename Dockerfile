# Start from an Alpine image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache python3 py3-pip openssl ca-certificates sshpass openssh-client rsync && \
    apk add --no-cache --virtual .build-deps python3-dev libffi-dev openssl-dev build-base && \
    pip3 install --upgrade pip cffi && \
    pip3 install ansible && \
    apk del .build-deps

# Check ansible version
RUN ansible --version

# Default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
