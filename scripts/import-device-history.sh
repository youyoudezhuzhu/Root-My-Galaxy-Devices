#!/usr/bin/env bash
set -euo pipefail

mode="${1:---dry-run}"
case "$mode" in --dry-run|--push) ;; *) echo "Usage: bash scripts/import-device-history.sh --dry-run|--push" >&2; exit 2;; esac
[[ -z "$(git status --porcelain)" ]] || { echo "Refusing dirty worktree" >&2; exit 1; }
git config user.name "${GIT_AUTHOR_NAME:-Device History Import}"
git config user.email "${GIT_AUTHOR_EMAIL:-41898282+github-actions[bot]@users.noreply.github.com}"

for model in f731u t870; do
  branch="device/$model"
  source_repo="rmg-$model"
  remote="source-$model"
  prefix="legacy-source/$model/"
  git fetch origin "refs/heads/$branch:refs/remotes/origin/$branch"
  git remote remove "$remote" 2>/dev/null || true
  git remote add "$remote" "https://github.com/youyoudezhuzhu/$source_repo.git"
  git fetch "$remote" main
  source_sha="$(git rev-parse "$remote/main")"
  destination_sha="$(git rev-parse "origin/$branch")"
  echo "SOURCE $source_repo $source_sha -> $branch $destination_sha"

  if git merge-base --is-ancestor "$source_sha" "$destination_sha"; then
    echo "ALREADY_IMPORTED $branch"
    continue
  fi

  if git ls-tree -r --name-only "origin/$branch" | grep -q "^$prefix"; then
    echo "ERROR: destination $prefix already exists; abort" >&2
    exit 1
  fi
  if [[ "$mode" == "--dry-run" ]]; then
    echo "DRY_RUN $branch: would import $(git ls-tree -r --name-only "$source_sha" | wc -l) source files"
    continue
  fi

  git switch --detach "$destination_sha"
  # This is a real two-parent merge: source commit ancestry is retained.
  # The source tree is staged under a namespace to avoid collisions.
  git merge --allow-unrelated-histories --no-commit -s ours "$source_sha"
  git read-tree --prefix="$prefix" -u "$source_sha"
  git commit -m "migration: import $source_repo history and snapshot under $prefix"
  # Never force-push; reject if someone changed the destination branch.
  git push origin "HEAD:refs/heads/$branch"
  echo "IMPORTED $branch: $(git rev-parse HEAD)"
done

echo "Done ($mode). No source repositories, tags, or Releases modified."
