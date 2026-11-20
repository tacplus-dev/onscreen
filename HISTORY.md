# History: onscreen

Append-only: add entries at the end, never edit or remove one (the planning-files build gate enforces it, once the build pipeline has it: tacplus-dev/looper#18). One line each:
`- <YYYY-MM-DD> <who: looper|agent|jody> <kind: issue|decision|release|deploy> <one line> (<links>)`

- 2026-11-13 looper issue CI: the planning-files check is missing (HISTORY.md append-only not enforced) (#3, 85d7f5d)
