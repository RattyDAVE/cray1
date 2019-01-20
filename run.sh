#!/bin/sh

/usr/sbin/sshd

PATH=$PATH:bin

mkdir dump
tmux new -s "cray" "cray_xmp_sim cos_117.cfg"

