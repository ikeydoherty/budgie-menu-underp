#!/bin/bash
valac --save-temps -g --enable-checking -X -DGMENU_I_KNOW_THIS_IS_UNSTABLE --pkg gtk+-3.0  --pkg libgnome-menu-3.0 --pkg gio-unix-2.0 *.vala -o CruftTest


