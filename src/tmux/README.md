
# Tmux (from source) (tmux)

A feature to install Tmux building from source

## Example Usage

```json
"features": {
    "ghcr.io/duduribeiro/devcontainer-features/tmux:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | The version of Tmux to be installed (latest, or a specific version (see versions at https://github.com/tmux/tmux/releases)) | string | latest |

## OS Support

This Feature should work on recent versions of Debian/Ubuntu with the `apt` package manager installed.

`bash` is required to execute the `install.sh` script.

---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/duduribeiro/devcontainer-features/blob/main/src/tmux/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
