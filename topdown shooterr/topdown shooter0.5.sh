#!/bin/sh
echo -ne '\033c\033]0;topdown shooter\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/topdown shooter0.5.x86_64" "$@"
