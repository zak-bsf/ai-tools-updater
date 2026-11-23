#!/usr/bin/env bash
# Aktualisiert speckit (specify-cli, uv tool), Trail-Code (npm global) und TokenEconomizer (Claude-Code-Plugin).
set -uo pipefail

fail=0
run() { echo; echo "==> $*"; "$@" || { echo "!! fehlgeschlagen: $*"; fail=1; }; }

# speckit: specify erkennt die uv-tool-Installation selbst und zieht das letzte Release
run specify self upgrade

# Trail-Code: installiert @trailhq/trail-code@latest (npm dist-tag latest = stabil)
run trail upgrade

# TokenEconomizer: Marketplace-Katalog auffrischen, dann Plugin aktualisieren
run claude plugin marketplace update tokeneconomizer
run claude plugin update tokeneconomizer@tokeneconomizer --scope user

echo
echo "==> Versionen"
specify --version
echo "trail $(trail --version)"
claude plugin list 2>/dev/null | grep -i -A2 tokeneconomizer
echo "Hinweis: Claude Code neu starten, damit das Plugin-Update greift."

exit $fail
