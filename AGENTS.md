# Contexto Del Proyecto

## Propósito

Repositorio de configuraciones personales para Linux, WSL y Windows. Se organiza en paquetes GNU Stow y contiene los scripts y configuraciones del entorno de desarrollo.

## Paquetes

- `bash/`: `.bashrc` y aliases personales.
- `git/`: configuración de Git.
- `config/`: archivos bajo `~/.config/`, incluyendo Neovim, VSCodium, WezTerm y opencode.

Los paquetes se enlazan al directorio `$HOME` con `stow --target="$HOME" --restow`.

## Instalación

- Linux/WSL: ejecutar `bash ~/.runs/wsl-ubuntu.sh`.
- Windows: ejecutar `~/.runs/windows.ps1` con PowerShell 7+ y permisos adecuados.
- Instalación manual: clonar el repositorio y ejecutar Stow para `bash`, `git` y `config`.

El repositorio es la fuente de verdad. Los scripts reemplazan archivos regulares en conflicto por los enlaces del repositorio y no crean copias de respaldo.

## Opencode

`config/.config/opencode/` contiene `AGENTS.md`, `opencode.jsonc`, la configuración de la TUI y las skills personalizadas. El `AGENTS.md` de esa carpeta define las reglas globales del agente.

## Reglas de mantenimiento

- Mantener los paquetes compatibles con GNU Stow.
- Actualizar los scripts de instalación solo cuando se agregue un paquete nuevo o cambie el proceso de enlace.
- No incluir credenciales, tokens, sesiones ni secretos en el repositorio.
- Mantener documentación y comentarios en español neutro; usar nombres de archivos y comandos existentes sin traducir.
- Probar los scripts en el sistema operativo correspondiente antes de cambiar su comportamiento.
