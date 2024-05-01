
# Neovim (neovim)

A feature to install Neovim

## Example Usage

```json
"features": {
    "ghcr.io/duduribeiro/devcontainer-features/neovim:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | The version of Neovim to be installed (stable, nightly or a specific version in the format 'MAJOR.MINOR.PATCH' e.g. '0.9.5) | string | stable |

## OS Support

This Feature should work on recent versions of Debian/Ubuntu with the `apt` package manager installed.

`bash` is required to execute the `install.sh` script.

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/duduribeiro/devcontainer-features/blob/main/src/neovim/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
