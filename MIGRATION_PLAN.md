# Migration and verification checklist

The independent destination is this repository, not `Root-My-Galaxy-Payloads`.

## Source repositories
- F731U: https://github.com/youyoudezhuzhu/rmg-f731u
- T870: https://github.com/youyoudezhuzhu/rmg-t870

## Execute
In GitHub Actions, select **Import device histories**. First run **dry-run**, review the output, then run **import**.
The script fetches each source `main` and merges its Git ancestry into `device/<model>`.
Its entire source snapshot is staged at `legacy-source/<model>/`. No existing branch is force-pushed.

## Verify before any deletion
- Confirm source tip is an ancestor of the destination branch.
- Compare source and imported tree entries and SHA-256 checksums of APK/payload binaries.
- Enumerate and back up all tags, GitHub Releases, and attached binaries separately.
- Review device-specific workflows, URLs, updater endpoints, and build reproducibility.
- F731U is verified only for the reported exact firmware. T870 is experimental.
- Source repositories remain untouched. Never delete or archive them without a separate approval.

## Git note
The merge preserves source commits through a second parent, while keeping the imported source files under `legacy-source/`. This is an archival first stage; subsequent refactoring into a clean layout requires review.
