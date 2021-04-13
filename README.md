# Clasp Action

This action uses [clasp](https://github.com/google/clasp) to push or deploy to [Google Apps Script](https://developers.google.com/apps-script/). This action is running `clasp push -f` regardless of whether you select `push` or `deploy` as the command. This will force the remote manifest to be overwritten.

## Inputs

### `accessToken`

**Required** `access_token` written in `.clasprc.json`.

### `idToken`

**Required** `id_token` written in `.clasprc.json`.

### `refreshToken`

**Required** `refresh_token` written in `.clasprc.json`.

### `clientId`

**Required** `refresh_token` written in `.clasprc.json`.

### `clientSecret`

**Required** `clientSecret` written in `.clasprc.json`.

### `scriptId`

**Required** `scriptId` written in `.clasp.json`.

### `rootDir`

Directory where scripts are stored.

### `command`

**Required** Command to execute(`push` or `deploy`).

If `deploy` is selected, this action is running `clasp push -f` just before.

### `description`

Description of the deployment.

## Example usage

### Case to push

```yaml
- uses: daikikatsuragawa/clasp-action@v1
  with:
    accessToken: ${{ secrets.ACCESS_TOKEN }}
    idToken: ${{ secrets.ID_TOKEN }}
    refreshToken: ${{ secrets.REFRESH_TOKEN }}
    clientId: ${{ secrets.CLIENT_ID }}
    clientSecret: ${{ secrets.CLIENT_SECRET }}
    scriptId: ${{ secrets.SCRIPT_ID }}
    command: 'push'
```

### Case to deploy

```yaml
- uses: daikikatsuragawa/clasp-action@v1
  with:
    accessToken: ${{ secrets.ACCESS_TOKEN }}
    idToken: ${{ secrets.ID_TOKEN }}
    refreshToken: ${{ secrets.REFRESH_TOKEN }}
    clientId: ${{ secrets.CLIENT_ID }}
    clientSecret: ${{ secrets.CLIENT_SECRET }}
    scriptId: ${{ secrets.SCRIPT_ID }}
    command: 'deploy'
```

### Case to deploy with description

```yaml
- uses: daikikatsuragawa/clasp-action@v1
  with:
    accessToken: ${{ secrets.ACCESS_TOKEN }}
    idToken: ${{ secrets.ID_TOKEN }}
    refreshToken: ${{ secrets.REFRESH_TOKEN }}
    clientId: ${{ secrets.CLIENT_ID }}
    clientSecret: ${{ secrets.CLIENT_SECRET }}
    scriptId: ${{ secrets.SCRIPT_ID }}
    command: 'deploy'
    description: 'Sample description'
```

### Case to specify the directory where scripts are stored

```yaml
- uses: daikikatsuragawa/clasp-action@v1
  with:
    accessToken: ${{ secrets.ACCESS_TOKEN }}
    idToken: ${{ secrets.ID_TOKEN }}
    refreshToken: ${{ secrets.REFRESH_TOKEN }}
    clientId: ${{ secrets.CLIENT_ID }}     
    clientSecret: ${{ secrets.CLIENT_SECRET }}
    scriptId: ${{ secrets.SCRIPT_ID }}
    rootDir: 'src'
    command: 'push'
```

## License summary

This code is made available under the MIT license.
