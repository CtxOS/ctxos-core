echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/ctxos/themes/osaka-jade ]]; then
  rm -rf ~/.config/ctxos/themes/osaka-jade
  git -C ~/.local/share/ctxos checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/ctxos/themes/osaka-jade ~/.config/ctxos/themes/osaka-jade
fi
