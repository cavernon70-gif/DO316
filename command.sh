#!/bin/bash
cd /home/student
lab start virtualization-deploy
lab start accessing-clicreate
lab start replicating-clone
lab start advanced-import
lab start multihomed-nmstate
oc login -uadmin -predhatocp https://api.ocp4.example.com:6443
sleep 30
oc extract secret/htpasswd-secret -n openshift-config --to /tmp --confirm
sleep 30
htpasswd -b -B /tmp/htpasswd verance-ii redhat
htpasswd -b -B /tmp/htpasswd moist redhat
sleep 30
oc set data secret/htpasswd-secret --from-file htpasswd=/tmp/htpasswd -n openshift-config
oc adm policy add-cluster-role-to-user cluster-admin verance-ii
oc adm policy add-cluster-role-to-user cluster-admin moist
sleep 30
oc new-project lonely
oc apply -f dwalin-template
oc apply -f filli-template
oc new-project vt100cineme

