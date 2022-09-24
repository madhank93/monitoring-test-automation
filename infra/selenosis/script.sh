#!/bin/bash

cd infra/selenosis/

kubectl apply -f 01-namespace.yaml

kubectl apply -f 06-coredns.yaml

kubectl apply -f 07-pre-pull-images.yml

if [ $DEBUG ]
then
    kubectl create cm selenosis-config --from-file=browsers.yaml=vnc-browsers.yaml -n selenosis
    kubectl apply -f 04-selenoid-ui.yaml
else
    kubectl create cm selenosis-config --from-file=browsers.yaml=browsers.yaml -n selenosis
fi

kubectl apply -f 02-service.yaml

kubectl apply -f 03-selenosis.yaml

kubectl apply -f 05-selenosis-hpa.yaml