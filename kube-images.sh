#!/usr/bin/env bash
version=v1.13.3
pauseVersion=3.1
etcdVersion=3.2.24
corednsVersion=1.2.6

docker rmi k8s.gcr.io/kube-apiserver-amd64:$version
docker rmi k8s.gcr.io/kube-controller-manager-amd64:$version
docker rmi k8s.gcr.io/kube-scheduler-amd64:$version
docker rmi k8s.gcr.io/kube-proxy-amd64:$version
docker rmi k8s.gcr.io/pause:$pauseVersion
docker rmi k8s.gcr.io/etcd-amd64:$etcdVersion
docker rmi k8s.gcr.io/coredns:$corednsVersion

docker mirrorsgooglecontainers/kube-apiserver-amd64:$version
docker mirrorsgooglecontainers/kube-controller-manager-amd64:$version
docker mirrorsgooglecontainers/kube-scheduler-amd64:$version
docker mirrorsgooglecontainers/kube-proxy-amd64:$version
docker mirrorsgooglecontainers/pause:$pauseVersion
docker mirrorsgooglecontainers/etcd-amd64:$etcdVersion
docker coredns/coredns:$corednsVersion

docker pull mirrorgooglecontainers/kube-apiserver-amd64:$version &&
docker pull mirrorgooglecontainers/kube-controller-manager-amd64:$version &&
docker pull mirrorgooglecontainers/kube-scheduler-amd64:$version &&
docker pull mirrorgooglecontainers/kube-proxy-amd64:$version &&
docker pull mirrorgooglecontainers/pause:$pauseVersion &&
docker pull mirrorgooglecontainers/etcd-amd64:$etcdVersion &&
docker pull coredns/coredns:$corednsVersion &&


docker tag docker.io/mirrorgooglecontainers/kube-proxy-amd64:$version k8s.gcr.io/kube-proxy:$version &&
docker tag docker.io/mirrorgooglecontainers/kube-scheduler-amd64:$version k8s.gcr.io/kube-scheduler:$version &&
docker tag docker.io/mirrorgooglecontainers/kube-apiserver-amd64:$version k8s.gcr.io/kube-apiserver:$version &&
docker tag docker.io/mirrorgooglecontainers/kube-controller-manager-amd64:$version k8s.gcr.io/kube-controller-manager:$version &&
docker tag docker.io/mirrorgooglecontainers/etcd-amd64:$etcdVersion  k8s.gcr.io/etcd:$etcdVersion &&
docker tag docker.io/mirrorgooglecontainers/pause:$pauseVersion  k8s.gcr.io/pause:$pauseVersion &&
docker tag docker.io/coredns/coredns:$corednsVersion  k8s.gcr.io/coredns:$corednsVersion
