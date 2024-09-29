#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <namespace> <ingress-name>"
    exit 1
fi

# Assign parameters to variables
ns="$1"
ingressname="$2"

# Get the ingress rules and format the output
kubectl -n "$ns" get ingress "$ingressname" -o yaml | \
    ./yq '.spec.rules[] | "https://" + .host + .http.paths[].path' | \
    cut -d'(' -f1
