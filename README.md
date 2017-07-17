# bf2d-bf2ccd

Working on a "simple" shell script to automate installing a Linux based Battlefield 2 server with BF2CCD for easy admin.

Please note, this installs a VERY old version of mono, which may be terribly insecure at this point - 10+ years later. Beware.

Easy install: curl -s https://raw.githubusercontent.com/mauirixxx/bf2d-bf2ccd/master/install_bf2d_bf2ccd.sh | sudo bash

There's still issues with opening the firewall ports on line #9

If you don't trust the contents of a remote script with parts running as root, the script is basically a line by line representation of commands to run.
