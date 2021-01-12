#!/bin/bash
if [[ "$#" -ne 1 ]] || [[ ! $1 =~ ^v([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
    echo "Usage: $0 vX.Y.Z"
    exit 1
fi

branch=$(git branch --show-current)

if [[ "$branch" != "main" ]]; then
    echo "You're in the \"${branch}\" branch, you need to switch to main"
    exit 1
fi

major=v${BASH_REMATCH[1]}
minor=${major}.${BASH_REMATCH[2]}
patch=${minor}.${BASH_REMATCH[3]}

echo "HEAD is $(git log -1 --pretty="%h: %B")"
read -p "You are about to create the following tags: ${major}, ${minor} and ${patch}, continue? [y/n] " -r -n 1
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting..."
    exit 1
fi

echo "Creating tag ${major}"
git tag -f ${major}

echo "Creating tag ${minor}"
git tag -f ${minor}

echo "Creating tag ${patch}"
git tag -f ${patch}

read -p "Tags created, push? [y/n] " -r -n 1
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting..."
    exit 1
fi

git push
git push --tags -f
