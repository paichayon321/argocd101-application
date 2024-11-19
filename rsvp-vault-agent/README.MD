# For Demo rsvp application integrate with vault by use vault agent injection

There are two sample:

# Get kv secret from vault (static)
1. /overlays/dev

```
kubectl -n test apply -k /overlays/dev
```

# Get Database Credential from vault (dynamic)
2. /overlays/dev-dbsecret

```
kubectl -n test apply -k /overlays/dev-dbsecret
```

* Require customize rsvp application to read secret file in volume /vault/secrets








