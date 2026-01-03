############# STEP 1 CLONING REPOS
```bash
cd /root
# rm -rf /root/myk8s_prefer;
# git clone https://github.com/darrenoshan/myk8s_prefer

rm -rf /root/kubespray
git clone https://github.com/kubernetes-sigs/kubespray.git

cd /root/kubespray
git checkout release-2.29
```

############# STEP 2 SETTING ENVIRONMET
```bash
python -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt
```

############# STEP 3 MAKING MY LAB CLUSTER PREFERS
```bash

bash /root/myk8s_prefer/update_files.sh

```

############# STEP 5 - RUNNING PLAYBOOKS
```bash
cd /root/kubespray
ansible -i inventory/labcluster/inventory.ini all -m ping

ansible-playbook -i inventory/labcluster/inventory.ini playbooks/setup_hostnames.yml

ansible-playbook -i inventory/labcluster/inventory.ini playbooks/pre-ks.yml
ansible-playbook -i inventory/labcluster/inventory.ini playbooks/dnf.yml
ansible-playbook -i inventory/labcluster/inventory.ini playbooks/lb.yml

ansible-playbook -i inventory/labcluster/inventory.ini cluster.yml

```


check the results
```bash

kubectl cluster-info
kubectl version
kubectl get pods -n kube-system | grep -v "Running"

kubectl get pods -n kube-system | grep -E "calico|cilium|flannel"
kubectl get ds -n kube-system kube-proxy
kubectl get pods -n kube-system | grep coredns

```


# ON ETCD Node 1
```
ETCDCTL_API=3 etcdctl -w table \
--endpoints=https://127.0.0.1:2379 \
--cacert=/etc/ssl/etcd/ssl/ca.pem \
--cert=/etc/ssl/etcd/ssl/admin-etcd1.pem \
--key=/etc/ssl/etcd/ssl/admin-etcd1-key.pem \
member list

ETCDCTL_API=3 etcdctl -w table \
--endpoints=https://10.16.1.11:2379,https://10.16.1.12:2379,https://10.16.1.13:2379 \
--cacert=/etc/ssl/etcd/ssl/ca.pem \
--cert=/etc/ssl/etcd/ssl/admin-etcd1.pem \
--key=/etc/ssl/etcd/ssl/admin-etcd1-key.pem \
endpoint status

```
