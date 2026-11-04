# OnScreen

A wall display of everything going on across tacplus-dev: what waits on Jody, what is running, what is pending and what
each thing waits for, what closed and released, and security. It runs full screen on a Mac display, live, read-only,
with drill-down.

Two parts, one tacplus project (`tacplus-dev/roadmap:decisions/onscreen-2026-11-04.md`):

- **The backend**, a tacplus service in Rust, deployed in the cluster. It polls GitHub and GitLab, reads the cluster,
  builds one model with a dependency graph of what waits on what, and serves it through a generated Watch stream.
- **The Mac app**, SwiftUI on the generated tacplus Swift client. It talks to the backend only, through the gateway,
  signed in with OIDC.

Nothing is built yet: see ROADMAP.md.
