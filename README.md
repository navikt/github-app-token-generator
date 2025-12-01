# GitHub App installation access token generator

## :warning: Use the official action from GitHub here: https://github.com/actions/create-github-app-token



GitHub Action that can be used to generate an installation access token for a GitHub App. This token can for instance be used to clone repos, given the GitHub App has sufficient permissions to do so.

## Usage

```yaml
name: Checkout repos
on: push
jobs:
  checkout:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4

    - uses: navikt/github-app-token-generator@v1
      id: get-token
      with:
        private-key: "${{ secrets.PRIVATE_KEY }}"
        app-id: "${{ secrets.APP_ID }}"

    - name: Check out an other repo
      uses: actions/checkout@v4
      with:
        repository: owner/repo
        token: ${{ steps.get-token.outputs.token }}
```

## Requirements

The action needs two input parameters, `private-key` and `app-id`. To get these, simply create a GitHub App. The private key can be generated and downloaded, and should be added to the repos as a secret. Known supported private key formats are
* PKCS#1 RSAPrivateKey** (PEM header: BEGIN RSA PRIVATE KEY)
* PKCS#8 PrivateKeyInfo* (PEM header: BEGIN PRIVATE KEY)

The installation ID that is used during the creation of the access token is created against the repo running the action. If you need to create the installation ID for a different repo you can use the `repo` input:

```yaml
uses: navikt/github-app-token-generator@v1
id: get-token
with:
  private-key: "${{ secrets.PRIVATE_KEY }}"
  app-id: "${{ secrets.APP_ID }}"
  repo: some/repo
```
