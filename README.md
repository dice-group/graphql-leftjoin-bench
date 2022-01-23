# GraphQL / Left Join (SPARQL OPTIONAL) Benchmark
## Based on the repository: https://github.com/dice-group/tentris-paper-benchmarks

# Ansible
Installation: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# Before running the playbook
 - Replace ```<ip_of_host>``` in ```ansible_playbook/inventory.yaml``` with the IP of the managed node (i.e., the server that will run the experiments).
 - Replace ```<target_dir>``` in ```ansible_playbook/roles/base/defaults/main.yaml``` with the path to the directory of the managed node that will store the experiments' required files.
 - Replace ```<user>``` in ```ansible_playbook/roles/base/defaults/main.yaml``` with the username that will be used to login with to the managed node.

# GraphDB
In order to run the playbook, a free GraphDB license is required. Replace ```<path-to-graphdb-zip>``` in ```ansible_playbook/roles/graphdb/tasks/install.yaml``` with the path to your local copy of GraphDB 9.8.

Alternatively, you can use the playbook of the branch ```no-graphdb```, which omits GraphDB from the experiments.

# Execution
You can execute the playbook by issuing the following command: ```ansible-playbook -kKi inventory.yaml playbook.yaml```.