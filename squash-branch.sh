#!/usr/bin/env bash
# Squash current branch to its merge base, and commit using provided commit message.
#
# Usage:
#   squash-branch [base-branch] "commit-message"
#
# If base-branch is not provided, master is used.
#

set -e

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Error - Wrong number of arguments"
    exit 1
fi

current_branch=$(git rev-parse --abbrev-ref HEAD)

if [[ $# -eq 1 ]]; then
    base_branch=master
    message=$1
fi

if [[ $# -eq 2 ]]; then
    base_branch=$1
    message=$2
fi

echo "Current branch: $current_branch"
echo "Base branch:    $base_branch"

git reset $(git merge-base $base_branch $current_branch)
git add -A
git commit -m "$message"
