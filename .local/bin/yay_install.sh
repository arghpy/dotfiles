#!/usr/bin/env bash


NAME="$USER"
REPODIR="/home/$NAME/.local/src"

#Install yay: script taken from Luke Smith
yay_install() {
	sudo -u "$NAME" mkdir -p "$REPODIR/yay"
	sudo -u "$NAME" git -C "$REPODIR" clone --depth 1 --single-branch \
		--no-tags -q "https://aur.archlinux.org/yay.git" "$REPODIR/yay" ||
		{
			cd "$REPODIR/yay" || return 1
			sudo -u "$NAME" git pull --force origin master
		}
	cd "$REPODIR/yay" || exit 1
	sudo -u "$NAME" -D "$REPODIR/yay" makepkg --noconfirm -si || return 1
}

yay_install
