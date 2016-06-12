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

# remove crash reports
sudo rm /var/crash/*
sudo vim /etc/default/apport #enabled=0
sudo restart apport

mkdir temp
cd temp



# bumblebee
sudo add-apt-repository ppa:bumblebee/stable
sudo apt-get update
sudo apt-get install bumblebee bumblebee-nvidia linux-headers-generic


# sudo fdisk -l
echo "/dev/sdb1	/media/dokumenty	ntfs	defaults	0	0" >> /etc/fstab



echo "/etc/apt/sources.list"
echo "Uncomment two lines to add software from Canonical's"
echo "'partner' repository."
echo "/etc/default/apport -- change enabled to 0"

echo "tray: dconf: Com > Canonical > Desktop > Unity > Panel to ['all']"

echo -n "press <enter> to continue"
read continue

# Calibre
sudo -v && wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

sudo add-apt-repository -y ppa:webupd8team/java

sudo apt-get update

sudo apt-get install -yV \
tree \
nemo \
anki \
audacity \
cheese-common \
vnstat \
mc \
zsh \
git \
gnuplot-x11 \
nethogs \
goldendict \
gparted \
terminator \
inkscape \
sozi \
gimp \
gmic gimp-gmic \
k3b libk3b6-extracodecs sox \
kile \
bookletimposer \
okular \
skype \
virtualbox \
vlc vlc-plugin-fluidsynth \
ffmpeg \
exuberant-ctags \
vim-gnome \
whois \
build-essential \
ppa-purge \
imagemagick \
qnapi \
subdownloader \
gconf-editor \
unity-tweak-tool \
easytag \
ripperx \
unetbootin \
clementine \
maven2 \
soundconverter \
keepass2 \
mono-complete \
htop \
gpick \
gscan2pdf tesseract-ocr-pol tesseract-ocr-deu \
compizconfig-settings-manager \
apt-file \
indicator-keylock \
indicator-multiload \
python-pygments \
python-pip python3-pip \
sqlitebrowser \
playonlinux \
bumblebee-nvidia \
fonts-inconsolata \
libreoffice-l10n-pl myspell-pl aspell-pl \
libreoffice-l10n-de aspell-de hunspell-de-de \
libreoffice-l10n-fr aspell-fr hunspell-fr-comprehensive \
hunspell hunspell-tools \
ubuntu-restricted-extras \
oracle-java8-set-default \
mplayer2 \
ttf-mscorefonts-installer

sudo apt-get -yV remove rhythmbox

sudo apt-file update

sudo npm install -g jshint

winetricks allfonts
winetricks settings fontsmooth=rgb

# indicator-multiload:
# indicator-items -> ⇓$(speed(net.down)) ⇑$(speed(net.up)) ┇ $(frequency(cpufreq.cur))

xdiagnose # disable automatic crash reporting

gsettings set com.canonical.Unity always-show-menus true
gsettings get org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ panel-opacity
gsettings get org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ overcome-pressure
gsettings get org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ stop-velocity
gsettings get org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ panel-opacity-maximized-toggle
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ overcome-pressure 1
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ stop-velocity 20
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ panel-opacity 0.8
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ panel-opacity-maximized-toggle true
gsettings set org.gnome.desktop.media-handling automount-open false
gconftool --set /apps/compiz-1/plugins/unityshell/screen0/options/devices_option  --type=int 1
gsettings set com.canonical.indicator.datetime time-format "'custom'"
gsettings set com.canonical.indicator.datetime custom-time-format "'%a, %d. %h  %H:%M'"


sudo adduser "$(whoami)" vboxusers

wget -c -P ~/.vim/spell \
    http://ftp.vim.org/vim/runtime/spell/en.ascii.spl \
    http://ftp.vim.org/vim/runtime/spell/en.ascii.sug \
    http://ftp.vim.org/vim/runtime/spell/en.latin1.spl \
    http://ftp.vim.org/vim/runtime/spell/en.latin1.sug \
    http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl \
    http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug \
    http://ftp.vim.org/vim/runtime/spell/pl.cp1250.spl \
    http://ftp.vim.org/vim/runtime/spell/pl.iso-8859-2.spl \
    http://ftp.vim.org/vim/runtime/spell/pl.utf-8.spl \
    http://ftp.vim.org/vim/runtime/spell/de.latin1.spl \
    http://ftp.vim.org/vim/runtime/spell/de.latin1.sug \
    http://ftp.vim.org/vim/runtime/spell/de.utf-8.spl \
    http://ftp.vim.org/vim/runtime/spell/de.utf-8.sug

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/


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

echo "alias ccat='pygmentize -g'" >> ~/.zshrc

curl http://j.mp/spf13-vim3 -L -o - | sh
echo "set spell spelllang=en_us,pl" >> ~/.vimrc.local

echo "setxkbmap 'pl(intl)'" > pl && chmod +x pl && sudo mv pl /usr/bin/pl

# vim
git clone https://github.com/palkakrzysiek/vim-startup.git
cd vim-startup
chmod +x ./vim-startup.sh && ./vim-startup.sh
