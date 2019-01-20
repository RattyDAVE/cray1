#!/bin/sh
PATH=$PATH:bin

mkdir dump
tmux new -s "cray" -d "cray_xmp_sim cos_117.cfg"

