# Set identification from install inputs
if [[ -n ${CTXOS_USER_NAME//[[:space:]]/} ]]; then
  git config --global user.name "$CTXOS_USER_NAME"
fi

if [[ -n ${CTXOS_USER_EMAIL//[[:space:]]/} ]]; then
  git config --global user.email "$CTXOS_USER_EMAIL"
fi
