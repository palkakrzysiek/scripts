if [ "$(id -u)" != "0" ]; then
   echo ">You Must Run As Root<" 1>&2
   exit 1
fi

mkdir temp
cd temp

# mate desktop environment (Ubu 12.10)
sudo add-apt-repository "deb http://packages.mate-desktop.org/repo/ubuntu quantal main"
sudo apt-get update
sudo apt-get install mate-archive-keyring
sudo apt-get update
sudo apt-get install mate-core mate-desktop-environment

#bumblebee
sudo add-apt-repository ppa:bumblebee/stable
sudo apt-get update
sudo apt-get install bumblebee bumblebee-nvidia linux-headers-generic

# /etc/fstab
# /dev/sda6	/media/dokumenty	ntfs	defaults	0	0

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
sudo dpkg -i google-chrome-stable_current_i386.deb

#indicators
# indicator-keylock indicator-multiload
sudo add-apt-repository ppa:tsbarnes/indicator-keylock-daily && sudo apt-get update
sudo apt-get install indicator-keylock

sudo apt-get install gnote audacious mc cheese-common dixygen doxygen-latex git gnote gnuplot goldendict gparted guake inkscape k3b libk3b6-extracodecs sox manpages-pl manpages-pl-dev manpages-posix manpages-posix-dev mplayer okular openjdk-7-jre php5-cli php5-common rhino ruby pidgin samba skype virtualbox vlc wine exuberant-ctags

# vim
git clone https://github.com/palkakrzysiek/vim-startup.git
cd vim-startup 
chmod +x ./vim-startup.sh && ./vim-startup.sh


echo "http://ankisrs.net/anki2.html"
echo "Zeitgeist"

