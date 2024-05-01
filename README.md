# Dev Container Features

## Neovim

Build Neovim from source and installs

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/duduribeiro/devcontainer-features/neovim:1": {
            "version": "stable"
        }
    }
}
```