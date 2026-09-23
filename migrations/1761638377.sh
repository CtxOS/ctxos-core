echo "Turn off fcitx5 clipboard that is interferring with other applications"

mkdir -p ~/.config/fcitx5/conf
cp $CTXOS_PATH/config/fcitx5/conf/clipboard.conf ~/.config/fcitx5/conf/

ctxos-restart-xcompose
