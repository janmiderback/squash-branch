#!/usr/bin/env bash
# Squash a branch to its merge base, and commit using provided commit message.
#
# Usage:
#   squash-branch [base-branch] [squash-branch] "commit-message"
#
# If base-branch is not provided, master is used.
# If squash-branch is not provided, the current branch is used.
# The squash-branch is always checked out before squashing it.
#

set -e

if [[ $# -lt 1 || $# -gt 3 ]]; then
    echo "Error - Wrong number of arguments"
    exit 1
fi

if [[ $# -eq 1 ]]; then
    base_branch=master
    squash_branch=$(git rev-parse --abbrev-ref HEAD)
    message=$1
fi

if [[ $# -eq 2 ]]; then
    base_branch=master
    squash_branch=$1
    message=$2
fi

if [[ $# -eq 3 ]]; then
    base_branch=$1
    squash_branch=$2
    message=$3
fi

echo "Squashing branch: $squash_branch"
echo "Base branch:      $base_branch"

echo "Checking out $squash_branch..."
git checkout $squash_branch

git reset $(git merge-base $base_branch $squash_branch)
git add -A
git commit -m "$message"
