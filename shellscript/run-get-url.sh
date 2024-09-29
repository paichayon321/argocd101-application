kubectl get ingress --all-namespaces | awk 'NR>1 {print $1,$2}' | xargs -I {} sh -c './get-ingress-url.sh {}'

