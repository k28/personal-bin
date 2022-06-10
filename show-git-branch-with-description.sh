#!/bin/bash

git for-each-ref --format='%(refname)' | grep remotes | sed 's/.*origin\///' | grep -v HEAD | xargs -I@ bash -c "printf '%s  ' @ ; git config branch.@.description | tr -d '\n'; echo ''"

