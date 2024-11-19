# DEV-DBSecret 
- Deploy mongodb version 6.6 with initial database user and password
- Create vault secret database for dynamic renew database connection credential  
- Use custom rsvp application for read vault secret in path /vault/secrets
- Add vault Annotation
- Add ENV for rsvp application to read secret file 

```
  template:
    metadata:
      annotations:
        vault.hashicorp.com/agent-inject: "true"
        vault.hashicorp.com/template-static-secret-render-interval: 30s  
        vault.hashicorp.com/agent-inject-secret-mysecret: "secret/rsvp/mysecret"
        vault.hashicorp.com/agent-inject-template-mysecret: |
          {{- with secret "secret/rsvp/mysecret" -}}
          username={{ .Data.data.username }}
          password={{ .Data.data.password }}
          {{- end }}
        vault.hashicorp.com/role: "read-secret-role"
        vault.hashicorp.com/agent-inject-secret-mongo-creds: "database/creds/my-role"
      labels:
        app: rsvp-web
    spec:
      serviceAccountName: vault-serviceaccount
      containers: 
      - name: rsvpd-web
        image: paichayon/rsvp:loaddbsecret
        env:
        - name: MONGODB_HOST
          value: mongodb
        - name: VAULT_SECRET_NAME
          value: mysecret
        - name: VAULT_DB_CRED_NAME
          value: mongo-creds

```


* Next step maybe use sealed secret to protect user and password in yaml file






