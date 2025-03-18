#!/bin/sh

# Verify that two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <commit1> <commit2>"
    exit 1
fi

# Get patch IDs for both commits
patch_id1=$(git show "$1" | git patch-id 2>&1 | awk '{print $1}')
patch_id2=$(git show "$2" | git patch-id 2>&1 | awk '{print $1}')

# Check if either command failed
if [ -z "$patch_id1" ] || [ -z "$patch_id2" ]; then
    echo "Error: Invalid commit(s)"
    exit 1
fi

# Compare patch IDs
if [ "$patch_id1" = "$patch_id2" ]; then
    echo "Commits $1 and $2 are identical (same patch ID: $patch_id1)"
    exit 0
else
    echo "Commits are different"
    echo "Commit $1: $patch_id1"
    echo "Commit $2: $patch_id2"
    exit 1
fi