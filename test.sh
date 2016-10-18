#!/bin/bash

sudo cp /usr/share/applications/firefox.desktop /usr/share/applications/__nuke1.desktop
sudo cp /usr/share/applications/firefox.desktop /usr/share/applications/__nuke2.desktop
sudo cp /usr/share/applications/firefox.desktop /usr/share/applications/__nuke3.desktop
sudo /usr/bin/update-desktop-database
sudo /usr/bin/update-desktop-database
sudo /usr/bin/update-desktop-database
sudo /usr/bin/update-desktop-database

sudo rm /usr/share/applications/__nuke1.desktop
sudo rm /usr/share/applications/__nuke2.desktop
sudo rm /usr/share/applications/__nuke3.desktop
sudo /usr/bin/update-desktop-database
sudo /usr/bin/update-desktop-database
sudo /usr/bin/update-desktop-database
