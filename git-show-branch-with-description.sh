#!/bin/bash

git for-each-ref --format='%(refname)' | grep heads | sed 's/.*heads\///' | xargs -I@ bash -c "printf '%s  ' @ ; git config branch.@.description | tr -d '\n'; echo ''"

