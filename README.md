Provision a new server with ssh to root and without any default user:
  ansible-playbook -i IP, provision.yml

Set up login user with my personal preferences:
  ansible-playbook -u user -i user@IP, userprovision.yml

Set up local machine as developer workstation with personal preferences:
  ansible-playbook -c local -i localhost, devbox.yml


