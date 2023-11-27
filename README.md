# gh-actions-workflow-test

my feature.2

## release-please and github_token

if release-please github action runs with a personal access token instead of the $GITHUB_TOKEN (github-actions bot):

- the release PR will trigger workflows
- the created GitHub release will trigger workflows

## renovate: private oci/docker registry (ghcr.io)

**These steps are for use with the Github hosted Renovate App!**

create a classic personal access token with permissions to read:packages.
This token is the value in the below password.
To encrypt the value, go to https://app.renovatebot.com/encrypt

\# `renovate.json`
```json
  "hostRules": [
    {
      "hostType": "docker",
      "matchHost": "https://ghcr.io/thomasstxyz/my/private-oci-repository",
      "username": "thomasstxyz",
      "encrypted": {
        "password": "wcFMA/xDdHCJBTolAQ//RoOn1Jpnej8UPHFmcHAfxkZs..."
      }
    }
  ]
```
> **NOTE:** Even though it is a `oci://` repository, we need to specify `https://`, because Renovate only checks for full paths (e.g. `.../thomasstxyz/my/private-oci-repository`) if the `https://` protocol is prefixed.

E.g. for use with regexManager:

```yaml
# renovate: datasource=docker depName=ghcr.io/thomasstxyz/my/private-oci-repository
PRIVATE_OCI_CHART_VERSION: 0.1.3
```

Further Resources:
- https://docs.renovatebot.com/getting-started/private-packages/#github-packages
- https://github.com/renovatebot/renovate/discussions/22347
- https://dille.name/blog/2022/11/27/using-private-container-registries-with-renovate/

## Direnv

Create `.envrc` file with the following content:
```
export TF_VAR_EXOSCALE_API_KEY=$(op item get jgn5q7ysbus2hsxa26sojgzxyq --fields label=username)
export TF_VAR_EXOSCALE_API_SECRET=$(op item get jgn5q7ysbus2hsxa26sojgzxyq --fields label=password)
```

> Replace the id `jgn5q7ysbus2hsxa26sojgzxyq` with the id of your vault item containing the credentials.

## Taskfile & Devcontainer

Open the devcontainer:

```
task devcontainer:open
```

Inside the devcontainer's shell:

```
task terraform:init
```
The autocompletion works by hitting <kbd>Tab</kbd> twice after writing `task` and one blank character.

```
vscode ➜ /workspaces/gh-actions-workflow-test (main) $ task terraform:
apply    destroy  init     plan     
```
