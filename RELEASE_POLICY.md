# Release retention policy

## Final release target
- Keep **only one migrated Release**: F731U `v0.2.36`, as identified by the source README.
- Verify the live source Release page, its tag, APK assets, size and SHA-256 before publishing the migrated release.
- Do not recreate F731U `v0.2.34`, `v0.2.35`, or any older Release.
- Do not migrate any T870 Releases; T870 is research-only and not hardware-verified.
- Keep the full Git commit ancestry for both device branches, including commits corresponding to earlier versions.
- Do not delete or edit any original repository, original tag or original Release during migration.
- Only delete old releases in the new destination if they were created by mistake, after inventory and explicit confirmation of their identities.

## Publication prerequisites
1. Download original F731U v0.2.36 release asset(s) without rebuilding and record SHA-256.
2. Confirm tag points to the intended source commit.
3. Publish the identical APK asset(s) in this repository, with a model-qualified tag such as `f731u-v0.2.36` to avoid cross-device version collisions.
4. Verify download and checksum, and adjust updater endpoint in a separate tested change.
5. Do not label a newly rebuilt APK identical to the original unless its checksum matches.

**Status:** Policy recorded; GitHub Release and assets have NOT yet been migrated or deleted.
