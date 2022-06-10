#!/bin/bash

if [[ $# < 1 ]]; then
    echo "Usagde: $0 <branch-name>"
    exit -1
fi

branch_name=$1
git branch --edit-description "${branch_name}"

