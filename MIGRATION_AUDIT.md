# Migration audit — 2026-11-03

## Verified
- `device/f731u`: source commit `021677b850cfbcc40e2bbd5583e7829337a26ffe` is an ancestor of the destination branch (GitHub compare: ahead 2, behind 0). Compared with `main`, 42 commits ahead and 68 changed files.
- `device/t870`: source commit `b93b7880fcf12031f86ee6743abe7fb14d2f1b75` is an ancestor (ahead 2, behind 0). Compared with `main`, 18 commits ahead and 57 changed files.
- Source snapshot directories are `legacy-source/f731u/` and `legacy-source/t870/`, respectively.
- Source repositories remain untouched.

## Open items — do not delete sources yet
1. Compare the entire original and imported Git trees and binary SHA-256 hashes (Git ancestry verified, but no independent byte-level audit yet).
2. Inventory original tags, GitHub Releases and their assets; these do not transfer with Git history.
3. Refactor APK workflows from the legacy root paths and `main` triggers into each new device branch.
4. Review F731U updater and raw GitHub URLs for old-repository dependencies.
5. Investigate why T870 source snapshot contains an asset named `ksud-f731u-kdp`; do not delete until confirmed.
6. Build F731U APK and compare to known-good release; T870 remains unverified on hardware.
7. Remove erroneous branches from upstream Payloads separately; this audit does not modify that repository.

## Safety
The imported `legacy-source` directories are preservation snapshots, not yet normalized application project roots. Do not archive or delete `rmg-f731u` or `rmg-t870` before the above checks.
