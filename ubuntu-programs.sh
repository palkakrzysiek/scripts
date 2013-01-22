if [ "$(id -u)" != "0" ]; then
   echo ">You Must Run As Root<" 1>&2
   exit 1
fi

mkdir temp
cd temp


#bumblebee
sudo add-apt-repository ppa:bumblebee/stable
sudo apt-get update
sudo apt-get install bumblebee bumblebee-nvidia linux-headers-generic

echo "/dev/sda6	/media/dokumenty	ntfs	defaults	0	0" >> /etc/fstab



echo "/etc/apt/sources.list"
echo "Uncomment two lines to add software from Canonical's"
echo "'partner' repository."
echo "tray: dconf: Com > Canonical > Desktop > Unity > Panel to ['all']"

echo -n "press <enter> to continue"
read continue


# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
sudo dpkg -i google-chrome-stable_current_i386.deb

# Ubuntu tweek
sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-get update && sudo apt-get install ubuntu-tweak

#indicators
# indicator-keylock indicator-multiload
sudo add-apt-repository ppa:tsbarnes/indicator-keylock-daily
sudo add-apt-repository ppa:indicator-multiload/stable-daily 
sudo apt-get update
sudo apt-get install indicator-multiload indicator-keylock


sudo apt-get install gnote anki audacious audacity mc cheese-common doxygen doxygen-latex kile texlive-lang-polish git gnote gnuplot goldendict gparted guake inkscape k3b libk3b6-extracodecs sox manpages-pl manpages-pl-dev manpages-posix manpages-posix-dev mplayer okular openjdk-7-jre php5-cli php5-common rhino ruby pidgin samba skype virtualbox vlc wine exuberant-ctags account-plugin-gadugadu compizconfig-settings-manager gimp gimp-plugin-registry touchegg

sudo apt-get remove rhythmbox

# vim
git clone https://github.com/palkakrzysiek/vim-startup.git
cd vim-startup 
chmod +x ./vim-startup.sh && ./vim-startup.sh


echo "http://ankisrs.net/anki2.html"
echo "Zeitgeist"


