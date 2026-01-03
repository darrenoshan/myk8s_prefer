#!/usr/bin/bash

SRCDIR="/root/myk8s_prefer/files"
DSTDIR="/root/kubespray"

mkdir -p "$DSTDIR/inventory/labcluster/group_vars/"{all,k8s_cluster}
mkdir -p "$DSTDIR/inventory/labcluster/host_vars/"
mkdir -p "$DSTDIR/inventory/labcluster/k8s_cluster/"

cp "$SRCDIR/inventory.ini" "$DSTDIR/inventory/labcluster/"
cp "$SRCDIR/all.yml" "$DSTDIR/inventory/labcluster/group_vars/all/all.yml"
cp "$SRCDIR/setup_hostnames.yml" "$DSTDIR/playbooks/setup_hostnames.yml"
cp "$SRCDIR/lb1.yml" "$SRCDIR/lb2.yml" "$DSTDIR/inventory/labcluster/host_vars/"
cp "$SRCDIR/lb.yml"     "$DSTDIR/playbooks/lb.yml"
cp "$SRCDIR/dnf.yml"    "$DSTDIR/playbooks/dnf.yml"
cp "$SRCDIR/pre-ks.yml" "$DSTDIR/playbooks/pre-ks.yml"
cp "$SRCDIR/addons.yml"    "$DSTDIR/inventory/labcluster/group_vars/k8s_cluster/addons.yml"
cp "$SRCDIR/k8s-cluster.yml" "$DSTDIR/inventory/labcluster/group_vars/k8s_cluster/k8s-cluster.yml"
cp -r "$SRCDIR/haproxy" "$SRCDIR/keepalived" "$DSTDIR/roles/"
