#!/usr/bin/env bash

# Need gum to query for input
yay -S --noconfirm --needed gum

# Configure identification
echo -e "\nEnter identification for git and autocomplete..."
CTXOS_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export CTXOS_USER_NAME
CTXOS_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")
export CTXOS_USER_EMAIL
