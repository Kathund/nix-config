#!/usr/bin/env bash

system_before=/nix/var/nix/profiles/system-$(nixos-rebuild list-generations --json | jq -r '.[0].generation')-link
dix $system_before /run/current-system
