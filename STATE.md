# State: onscreen

Overwritten to stay current (loopers and agents). Last updated: 2026-11-26 by looper (#6).

- **Version / line:** none released; no tacplus floor yet (no tacplus.yaml)
- **Works:** the planning files; the build pinned (`build.lock`: a tacplus build 2.6 image by digest, a patch or a dated line
  build the nightly relock moves it to, #6) with its gates (`gates.yaml`: the planning files check, the pin's check and
  its fixture tests), which run as build jobs (#4)
- **Released / deployed:** nothing
- **Known gaps:** nothing built yet: the backend (#1) and the Mac app (#2); the planning files check is a copy of
  looper's (PROPOSALS.md)
- **Blocked on:** the move to seabeam.net (tacplus-dev/cloud#15), per ROADMAP.md
