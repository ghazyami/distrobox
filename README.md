# Distrobox  environments

## Usage
- Create environment (container)
```bash
cd [environment name]
distrobox assemble create
```

- Create environment menu entry
```bash
distrobox generate-entry [environment name]
```

- Enter enironment from start menu or by running
```bash
distrobox enter java-dev
```

- Find exported binaries at
```bash
~/.local/bin
```

- Optionally update font cache on host
```bash
fc-cache -rfv
```


## Environments
- [Java Development Environment](./java-dev)

