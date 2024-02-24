# Distrobox  environments

## Usage
- Create environment (container)
```bash
distrobox assemble create --file [environment name].ini
```

- Create environment menu entry
```bash
distrobox generate-entry [environment name]
```

- Apps will be under
```bash
~/.local/bin
```

## Environments

### java-dev.ini
- Base
  - openSUSE Tumbleweed
- Apps
  - IntelliJ IDEA Ultimate
  - Apache NetBeans
- SDKMAN
  - Java
  - Maven
  - Maven Daemon
  - Quarkus CLI
  - JBang
- Packages
  - git
  - tmux
  - vim
  - nano
  - htop
  - cnf
  - fzf
  - fish
  - aria2
  - Kubernetes client
