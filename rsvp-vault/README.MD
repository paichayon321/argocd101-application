For Demo have two difference image to use


image: paichayon/rsvp:nginx-rewrite is normal image

image: paichayon/rsvp:loadconfig is customize image to read data from secret file in volume /vault/secrets




##  kustomization file for Vaultt Agent Injection
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
