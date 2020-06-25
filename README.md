# GitHub App installation token generator

GitHub Action that can be used to generate an installation token for a GitHub App. This token can for instance be used to clone repos, given the GitHub App has sufficient permissions to do so.

## Usage

```yaml
name: Checkout repos
on: push
jobs:
  checkout:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2

    - uses: navikt/github-app-token-generator@v1
      id: get-token
      with:
        private-key: ${{ secrets.PRIVATE_KEY }}
        app-id: ${{ secrets.APP_ID }}

    - name: Check out an other repo
      uses: actions/checkout@v2
      with:
        repository: owner/repo
        token: ${{ steps.get-token.outputs.token }}
```

## Requirements

The action needs two input parameters, `private-key` and `app-id`. To get these, simply create a GitHub App. The private key can be generated and downloaded, and should be added to the repos as a secret.