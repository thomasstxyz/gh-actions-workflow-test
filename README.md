# gh-actions-workflow-test

my feature.

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
      "matchHost": "ghcr.io",
      "username": "thomasstxyz",
      "encrypted": {
        "password": "wcFMA/xDdHCJBTolAQ//RoOn1Jpnej8UPHFmcHAfxkZs..."
      }
    }
  ]
```

E.g. for use with regexManager:

```yaml
# renovate: datasource=docker depName=ghcr.io/thomasstxyz/my/private-oci-repository
PRIVATE_OCI_CHART_VERSION: 0.1.3
```

Further Resources:
- https://docs.renovatebot.com/getting-started/private-packages/#github-packages
- https://github.com/renovatebot/renovate/discussions/22347
- https://dille.name/blog/2022/11/27/using-private-container-registries-with-renovate/
