#!/bin/bash
gcc -Wall `pkg-config --cflags --libs libgnome-menu-3.0` `pkg-config --cflags --libs gtk+-3.0` -g3 -DGMENU_I_KNOW_THIS_IS_UNSTABLE solus/*.c -o SolusTest
