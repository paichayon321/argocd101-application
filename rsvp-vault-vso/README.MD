For Demo have two difference image to use


image: paichayon/rsvp:nginx-rewrite is normal image

image: paichayon/rsvp:loadconfig is customize image to read data from secret file in volume /vault/secrets

image: paichayon/rsvp:readsecret is customize image to read map secret to volume in volume /vault/secrets


##  kustomization file for Vault Agent Injection
```
resources:
- ../../base

patches:
- path: patch-rsvp-web-deployment-vault-file.yaml
- path: patch-rsvp-ingress-nginx.yaml
```



## kustomization file for Vault Secret Operator
```
resources:
- ../../base
- rsvp-VaultAuth.yaml
- rsvp-VaultStaticSecret.yaml

patches:
- path: patch-rsvp-web-deployment-vault-env.yaml
- path: patch-rsvp-ingress-nginx.yaml
```


## kustomization file for Vault Secret Operator and Map secret to file
```
resources:
- ../../base
- rsvp-VaultAuth.yaml
- rsvp-VaultStaticSecret.yaml

patches:
- path: patch-rsvp-web-deployment-vault-env-file.yaml
- path: patch-rsvp-ingress-nginx.yaml
```
