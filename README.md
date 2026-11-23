# dev-tools-updater

Updates these macOS dev tools to their latest stable release:

| Tool | Installed via | Update command |
|---|---|---|
| [spec-kit](https://github.com/github/spec-kit) (`specify`) | `uv tool` | `specify self upgrade` |
| [Trail-Code](https://github.com/trailhq/Trail-Code) (`trail`) | npm global | `trail upgrade` |
| [TokenEconomizer](https://github.com/microsoft/TokenEconomizer) | Claude Code plugin | `claude plugin marketplace update` + `claude plugin update` |

## Usage

```bash
./update-tools.sh
```

Each step runs even if an earlier step fails. The exit code is 1 if any step failed. Restart Claude Code after a plugin update.
