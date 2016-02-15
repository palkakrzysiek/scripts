if [ "$(id -u)" != "0" ]; then
   echo ">You Must Run As Root<" 1>&2
   exit 1
fi

# docs:
# - convert jpeg to pdf:
#   [patch]$ convert *.jpeg name.pdf
# - combine multiple pdf files
#   gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=finished.pdf file1 file2
# - trim margins:
#   pdfcrop

mkdir temp
cd temp


# bumblebee
sudo add-apt-repository ppa:bumblebee/stable
sudo apt-get update
sudo apt-get install bumblebee bumblebee-nvidia linux-headers-generic

# feedly
sudo add-apt-repository ppa:unity-webapps-feedly/stable
sudo apt-get update
sudo apt-get install unity-webapps-feedly

# sudo fdisk -l
echo "/dev/sda6	/media/dokumenty	ntfs	defaults	0	0" >> /etc/fstab



echo "/etc/apt/sources.list"
echo "Uncomment two lines to add software from Canonical's"
echo "'partner' repository."
echo "tray: dconf: Com > Canonical > Desktop > Unity > Panel to ['all']"

echo -n "press <enter> to continue"
read continue

sudo add-apt-repository "deb http://archive.canonical.com/ precise partner"


# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
sudo dpkg -i google-chrome-stable_current_i386.deb

# Ubuntu tweek
sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-get update && sudo apt-get install ubuntu-tweak

#Jdownloader
sudo add-apt-repository ppa:jd-team/jdownloader
sudo apt-get update && sudo apt-get install jdownloader
echo "run 'jdownloader' separately"
echo -n "press <enter> to continue"
read continue

# Calibre
sudo python -c "import sys; py3 = sys.version_info[0] > 2; u = __import__('urllib.request' if py3 else 'urllib', fromlist=1); exec(u.urlopen('http://status.calibre-ebook.com/linux_installer').read()); main(install_dir='/opt')"
# Apprentice Alf plugin

#indicators
# indicator-keylock indicator-multiload
sudo add-apt-repository ppa:tsbarnes/indicator-keylock-daily
sudo add-apt-repository ppa:indicator-multiload/stable-daily
sudo apt-get update
sudo apt-get install indicator-multiload indicator-keylock

sudo add-apt-repository ppa:tsbarnes/indicator-keylock-daily
sudo add-apt-repository ppa:indicator-multiload/stable-daily
sudo add-apt-repository ppa:jd-team/jdownloader
sudo add-apt-repository ppa:freefilesync/ffs
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/icons
sudo apt-get install indicator-multiload indicator-keylock freefilesync

sudo apt-get install gnote anki audacious audacity mc cheese-common doxygen \
doxygen-latex kile texlive-lang-polish git gnote gnuplot-x14 goldendict \
gparted guake inkscape k3b libk3b6-extracodecs sox manpages-pl \
manpages-pl-dev manpages-posix manpages-posix-dev mplayer okular openjdk-7-jre \
php5-cli php5-common rhino ruby pidgin samba skype virtualbox vlc \
exuberant-ctags account-plugin-gadugadu compizconfig-settings-manager gimp \
gimp-plugin-registry touchegg vim-gnome whois build-essential imagemagick \
wammu wine filezilla kdenlive p7zip qnapi gconf-editor easytag unetbootin \
sound-juicer acidrip icedtea-7-plugin clementine gscan2pdf unity-tweak-tool \
openjdk-7-jdk subtitleeditor eclipse qtcreator xbacklight maven2 nrg2iso \
soundconverter keepass2 mono-complete bless ttf-inconsolata ibus-m17n \
acpi htop dstat iftop gnome-tweak-tool pandoc gnome-do texlive-xetex gpick \
chntpw

sudo apt-get remove rhythmbox

sudo apt-get install apt-file
sudo apt-file update

winetricks allfonts
winetricks settings fontsmooth=rgb

wget -c https://raw.github.com/pfn/keepasshttp/master/KeePassHttp.plgx
sudo mkdir /usr/lib/keepass2/plugins
sudo mv KeePassHttp.plgx /usr/lib/keepass2/plugins/

wget -c https://raw.github.com/SmeegeSec/HashTag/master/HashTag.py
sudo mv HashTag.py /usr/bin/

echo 'http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz'

echo 'git config --global user.name "Your Name"'
echo "git config --global user.email you@example.com"
git config --global alias.lola "log --graph --decorate \
--pretty=oneline --abbrev-commit --all"
git config --global color.ui auto
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.his "log --pretty=format:'%h %Cgreen%cD %Cblue%cn %C(yellow)<%ce> %Creset %s'"





# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

export PS1=$IBlack$Time12h$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$BYellow$PathShort$Color_Off'\$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Yellow$PathShort$Color_Off'\$ "; \
fi)'













echo -n "press <enter> to continue"
read continue

echo "setxkbmap 'pl(intl)'" > pl && chmod +x pl && sudo mv pl /usr/bin/pl

# vim
git clone https://github.com/palkakrzysiek/vim-startup.git
cd vim-startup
chmod +x ./vim-startup.sh && ./vim-startup.sh
