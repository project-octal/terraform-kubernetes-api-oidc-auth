# terraform-kubernetes-api-oidc-auth
Simplifies the configuration of OIDC authentication for the Kubernetes API server.

---
**TODO**

- Create configuration guides for various cloud providers.

--- 

## Pre-requisites
- A public OIDC auth application that doesn't require a client secret (otherwise known as a public application). 
- The Kubernetes API Server needs to be configured to use OIDC authentication: [More Information](https://kubernetes.io/docs/reference/access-authn-authz/authentication/#openid-connect-tokens)
```
# example kube-api-server arguments
--oidc-issuer-url https://{ISSUER_URL}/
--oidc-client-id {CLIENT_ID}
--oidc-username-claim email
--oidc-groups-claim {GROUP_CLAIM}
--oidc-groups-prefix oidc:
```
- [kubelogin](https://github.com/int128/kubelogin) is required.
```shell script
# Homebrew (macOS and Linux)
brew install int128/kubelogin/kubelogin

# Krew (macOS, Linux, Windows and ARM)
kubectl krew install oidc-login

# Chocolatey (Windows)
choco install kubelogin
```
- The kubeconfig will need a user configured to leverage the OIDC credentials.
```yaml
- name: oidc
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: kubectl
      args:
      - oidc-login
      - get-token
      - --oidc-issuer-url=https://{ISSUER_URL}/
      - --oidc-client-id={CLIENT_ID}
      - --oidc-extra-scope=email
      - --oidc-extra-scope={GROUP_CLAIM}
```
