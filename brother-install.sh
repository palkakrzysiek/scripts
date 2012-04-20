# installation script of Brother DCP-J125 printer and scanner driver for Ubuntu, Debian, Mint Linux etc.

#printer
apt-get install lpr cups
wget http://www.brother.com/pub/bsc/linux/dlf/dcpj125lpr-1.1.3-1.i386.deb
wget http://www.brother.com/pub/bsc/linux/dlf/dcpj125cupswrapper-1.1.3-1.i386.deb
dpkg  -i  --force-all dcpj125lpr-1.1.3-1.i386.deb
dpkg  -i  --force-all dcpj125cupswrapper-1.1.3-1.i386.deb
#firefox http://localhost:631/printers
#scanner
wget http://www.brother.com/pub/bsc/linux/dlf/brscan3-0.2.11-4.i386.deb
wget http://www.brother.com/pub/bsc/linux/dlf/brscan-skey-0.2.3-0.i386.deb
dpkg  -i  --force-all brscan3-0.2.11-4.i386.deb
dpkg  -i  --force-all brscan-skey-0.2.3-0.i386.deb
echo "" >> /lib/udev/rules.d/40-libsane.rules
echo "# Brother scanners" >> /lib/udev/rules.d/40-libsane.rules
echo "ATTRS{idVendor}==\"04f9\", ENV{libsane_matched}=\"yes\"" >> /lib/udev/rules.d/40-libsane.rules
echo "Restart the OS."
echo "You can remove downloaded packages by typing:"
echo "rm dcpj125lpr-1.1.3-1.i386.deb  dcpj125cupswrapper-1.1.3-1.i386.deb  brscan3-0.2.11-4.i386.deb brscan-skey-0.2.3-0.i386.deb"


