#! /usr/bin/bash

printf "
// ===== Bismillahir Rahmanir Rahim ===== //
AppImage installation: To integrate appimages successfully, icon file and .desktop file for the AppImage should be provided. These three files (.AppImage, .desktop, .png/.jpg/.svg) must have the same name (with different extensions).
Keep .deb and .AppImage files in the 'Applications' folder. To install from other folder, enter the path below. Press Enter to skip.\n
"

# Creating Necessary Directories
mkdir -p ./Applications $HOME/Applications $HOME/.fonts $HOME/.vpn-configs $HOME/.local/share/applications $HOME/.config/npm-packages

# Utility Functions
function reRunScript() {
  clear
  if [ "$1" == "auto" ]
    then
        mainMenu
    else
        read -p "Run Again? (y/n): " CHOICE
        case "$CHOICE" in 
        [yY] | [yY][eE][sS])
          mainMenu
          ;;
        *)
          echo "Script has been terminated!"
          ;;
        esac 
  fi
}

function setDir() {
  DEFAULTDIR="${1}"
  MAINDIR="${MAINDIR:-$DEFAULTDIR}"
  if [ -d "$MAINDIR" ]
    then
        cd "$MAINDIR"
        echo "// ===== Currently in: $MAINDIR ===== //"
    else 
        cd $HOME/Downloads
        echo "// ===== Currently in: $HOME/Downloads ===== //"
  fi
}

# Setting Manual Application Folder
read -p "Manual Path(press Enter to skip): " MAINDIR
APPDIR=$(realpath Applications)
DOWNLOADSDIR="$HOME/Downloads"
setDir "$APPDIR"

function vlcAutoplayer() {
mkdir -p $HOME/.config/vlc
cat << EOF > $HOME/.config/vlc/vlc.sh
#!/bin/bash
shopt -s extglob

# list of extensions for searching in current directory
extensions_video='avi|mp4|mkv|m4v|mov|mpg|mpeg|wmv|3gp'
extensions_audio='ogg|opus|flac|m4a|mp3|wav'
extensions="@(\${extensions_video}|\${extensions_audio})"

# kill other instances of vlc
killall vlc; sleep 0.1

# launch empty vlc if no argument provided
if [ -z "\$1" ]; then
	vlc; exit
fi

# parse argument
filename=\$(realpath -- "\$1")
dirname=\$(dirname "\$filename")
basename=\$(basename "\$filename")

# list files with matching extension
OLDIFS="\$IFS"
IFS='' list=\$(ls "\${dirname}"/*.\${extensions} -1 2>/dev/null)
IFS="\$OLDIFS"

# Fixing Numerical Sort
echo "\$list" > /tmp/vlc.m3u
list=\`sort -V /tmp/vlc.m3u\`

# get position of filename in current directory
pos=\$(echo "\$list" | grep -n -F -- "\${basename}" | cut -d: -f1)

# if the filename does not have one of the extension above, launch vlc with provided filename
if [ -z "\$pos" ]; then
	vlc -- "\${filename}"
	exit
fi

# change positions in playlist such as the first element is the opened file
n=\$(echo "\$list" | wc -l)
echo "\$list" | tail -n\$((\$n-\$pos+1)) >  /tmp/vlc.m3u
echo "\$list" | head -n\$((\$pos-1))    >> /tmp/vlc.m3u

# launch playlist
IFS=\$'\n'; read -d '' -r -a files < /tmp/vlc.m3u; vlc "\${files[@]}"
EOF
}

function appimageInstaller() {
  # FILENAME with path, without extension
  FILE="${1%.*}"
  
  # FILENAME without path, without extension
  FILENAME="${FILE##*/}"
  
  # Copying The FILE
  cp "$FILE.AppImage" $HOME/Applications/"$FILENAME.AppImage"
  
  # Copyting .desktop (if exists)
  [ -f "$FILE.desktop" ] && cp "$FILE.desktop" $HOME/.local/share/applications/"$FILENAME.desktop"
  
  # Copying icons (if exists)
  [ -f "$FILE.png" ] && cp "$FILE.png" $HOME/Applications/"$FILENAME.png"
  [ -f "$FILE.jpg" ] && cp "$FILE.jpg" $HOME/Applications/"$FILENAME.jpg"
  [ -f "$FILE.svg" ] && cp "$FILE.svg" $HOME/Applications/"$FILENAME.svg"
  
  # Add Execute permissions
  chmod +x $HOME/Applications/"$FILENAME.AppImage" && [ -f "$HOME/.local/share/applications/$FILENAME.desktop" ] && chmod +x "$HOME/.local/share/applications/$FILENAME.desktop"

  # Additional Configuration
  if [ "$FILENAME" == "Bootstrap Studio" ]
    then  
        find . -name "launcher.sh" -exec cp "{}" "$HOME/Applications/launcher.sh" ";" && chmod +x "$HOME/Applications/launcher.sh" && echo "$FILENAME installed"
    else
        echo "$FILENAME installed"
  fi
}

function composerInstaller() {
  # Adding php, mysql to path
  echo "export PATH=\$PATH:/opt/lampp/bin" >> ~/.profile && source ~/.profile
  
  # Creating symbolic link for php and mysql
  sudo ln -s /opt/lampp/bin/php /usr/local/bin/php && sudo ln -s /opt/lampp/bin/mysql /usr/local/bin/mysql
  
  # Installing composer
  find . -iname "composer*.phar" -type f -exec sudo cp "{}" /usr/local/bin/composer ";" && sudo chmod +x /usr/local/bin/composer && sudo chmod 777 /usr/local/bin/composer
  
  # Adding composer directory to path
  echo "export PATH=\$PATH:$HOME/.config/composer/vendor/bin" >> ~/.profile && source ~/.profile
}

function defragment() {
  DEFAULTPARTITION="/dev/sdb1"
  
  read -p "Check fragmentation or Defragment (c/d): " DEFRAGCHOICE
  read -p "Partition Path (default: /dev/sdb1): " PARTITION
  
  PARTITION="${PARTITION:-$DEFAULTPARTITION}"
  case "$DEFRAGCHOICE" in 
  [cC] | [cC][hH][eE][cC][kK])
    sudo e4defrag -c "$PARTITION"
    ;;
  [dD] | [dD][eE][fF][rR][aA][gG])
    sudo e4defrag "$PARTITION"
    ;;
  *)
    echo "Invalid choice! Please enter c/check or d/defrag"
    ;;
  esac
}

# Feature Functions

function appInstaller() {
  printf "
  // ===== App Installer ===== //
  0) Go Back
  1) Install Developer Applications from Repository
  2) Install .deb and .AppImage files
  3) Install 'Anaconda3***.sh' file
  4) Install 'xampp***.run' and 'composer.phar' files
  5) Install Node.JS
  6) Install MongoDB
  7) Install Virtualbox
  8) Install Virt manager (with KVM & QEMU)
  9) Install Arc and Numix theme/icons
  10) Install Steam
  11) Install Brave Browser
  12) Install Librewolf Browser from Flathub
  13) Install Ungoogled Chromium from Flathub
  14) Install GIMP from Flathub
  15) Install Inkscape from Flathub
  16) Install Heroku
  "
  read -p "Select Option: " APPINSTALLERCHOICE
   
  case "$APPINSTALLERCHOICE" in
    0)
      reRunScript "auto"
      ;;
    1)
      echo "// ===== Install Developer Applications from Repository ===== //"
      sudo apt install codeblocks dia filezilla git gpick putty
      
      # Rerun Appinstaller
      appInstaller
      ;;
    2)
      setDir "$APPDIR"

      echo "// ===== Install .deb packages ===== //"
      # find . -iname "*.deb" -type f -exec sudo gdebi "{}" ";"
      find . -iname "*.deb" -type f -exec sudo dpkg -i "{}" ";"
      sudo apt install -f

      echo "// ===== Install .AppImage files ===== //"
      find . -iname "*.AppImage" -type f -print0 | while read -d $'\0' FILEINPUT
      do
        appimageInstaller "$FILEINPUT"
      done
      
      cd "$HOME/Applications"
      [ -f "./figma-linux.AppImage" ] && sudo ./figma-linux.AppImage -i && sudo sed -i "s|Exec=AppRun --no-sandbox %U|Exec=figma-linux --no-sandbox %U|g" /usr/share/applications/figma-linux.desktop
      [ -f "./gimp-withplugins.AppImage" ] && ./gimp-withplugins.AppImage
      [ -f "./launcher.sh" ] && ./launcher.sh
      
      # Rerun Appinstaller
      appInstaller
      ;;
    3)
      setDir "$APPDIR"

      echo "// ===== Install 'Anaconda3***.sh' file ===== //"
      find . -iname "Anaconda*.sh" -type f -exec cp "{}" $HOME/Applications/anaconda.sh ";" && chmod +x $HOME/Applications/anaconda.sh && bash $HOME/Applications/anaconda.sh
      rm $HOME/Applications/anaconda.sh
      
      # Rerun Appinstaller
      appInstaller
      ;;
    4)
      setDir "$APPDIR"

      echo "// ===== Install 'xampp***.run' and 'composer.phar' files ===== //"
      # Initializing XAMPP installer
      find . -iname "xampp*.run" -type f -exec cp "{}" $HOME/Applications/xampp.run ";" && chmod +x $HOME/Applications/xampp.run && sudo $HOME/Applications/xampp.run
      rm $HOME/Applications/xampp.run
      
      # Adding to Start Menu
      find . -iname "xampp*.desktop" -type f -exec cp "{}" $HOME/.local/share/applications/xampp.desktop ";" && chmod +x $HOME/.local/share/applications/xampp.desktop
      
      # Changing htdocs folder location
      printf "// ===== Change Server folder Path ===== //\n"
      read -p "Enter Path(press Enter to skip): " HTDOCSDIR

      # Keeping default htdocs folder location
      HTDOCSDEFAULT="/opt/lampp/htdocs"
      HTDOCSDIR="${HTDOCSDIR:-$HTDOCSDEFAULT}"

      # Setting htdocs folder location
      echo "Replacing '/opt/lampp/htdocs' with $HTDOCSDIR"
      mkdir -p "$HTDOCSDIR" && sudo sed -i "s|/opt/lampp/htdocs|$HTDOCSDIR|g;s|User daemon|User $USER|g;s|Group daemon|Group $USER|g" /opt/lampp/etc/httpd.conf
      # fixing htdocs permission (optional)
      # sudo chmod 777 -R /opt/lampp/htdocs
      # Install Composer

      echo "// ===== Install Composer ===== //"
      composerInstaller

      # Rerun Appinstaller
      appInstaller
      ;;
    5)
      echo "// ===== Install Node.js ===== //"
      curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs && npm config set prefix $HOME/.config/npm-packages && echo "export PATH=\$PATH:$HOME/.config/npm-packages/bin" >> ~/.profile && source ~/.profile
      
      # Rerun Appinstaller
      appInstaller
      ;;
    6)
      echo "// ===== Install MongoDB ===== //"
      wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add - && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list && sudo apt-get update && sudo apt-get install -y mongodb-org && sudo systemctl start mongod && sudo systemctl enable mongod
      
      # Rerun Appinstaller
      appInstaller
      ;;
    7)
      echo "// ===== Install Virtualbox ===== //"
      sudo apt install virtualbox virtualbox-ext-pack
      
      # Rerun Appinstaller
      appInstaller
      ;;
    8)
      echo "// ===== Install Virt-manager (with KVM & QEMU) ===== //"
      sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager && sudo adduser $USER libvirt && sudo adduser $USER libvirt-qemu
      # sudo apt install libguestfs-tools libosinfo-bin genisoimage dnsmasq
      
      # Rerun Appinstaller
      appInstaller
      ;;
    9)
      echo "// ===== Install Arc and Numix theme/icons ===== //"
      sudo apt install arc-theme numix-gtk-theme numix-icon-theme-circle
      
      # Rerun Appinstaller
      appInstaller
      ;;
    10)
      echo "// ===== Install Steam ===== //"
      sudo apt install steam-installer
      
      # Rerun Appinstaller
      appInstaller
      ;;
    11)
      echo "// ===== Install Brave Browser ===== //"
      sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update && sudo apt install brave-browser
      
      # Rerun Appinstaller
      appInstaller
      ;;
    12)
      # Checking for Flatpak
      if ! command -v flatpak &> /dev/null
        then
          sudo apt install flatpak
      fi

      echo "// ===== Install Librewolf Browser from Flathub ===== //"
      flatpak install flathub io.gitlab.librewolf-community
      
      # Rerun Appinstaller
      appInstaller
      ;;
    13)
      # Checking for Flatpak
      if ! command -v flatpak &> /dev/null
        then
          sudo apt install flatpak
      fi

      echo "// ===== Install Ungoogled Chromium from Flathub ===== //"
      flatpak install flathub com.github.Eloston.UngoogledChromium
      
      # Rerun Appinstaller
      appInstaller
      ;;
    14)
      # Checking for Flatpak
      if ! command -v flatpak &> /dev/null
        then
          sudo apt install flatpak
      fi

      echo "// ===== Install GIMP from Flathub ===== //"
      flatpak install flathub org.gimp.GIMP
      
      # Rerun Appinstaller
      appInstaller
      ;;
    15)
      # Checking for Flatpak
      if ! command -v flatpak &> /dev/null
        then
          sudo apt install flatpak
      fi

      echo "// ===== Install Inkscape from Flathub ===== //"
      flatpak install flathub org.inkscape.Inkscape
      
      # Rerun Appinstaller
      appInstaller
      ;;
    16)
      echo "// ===== Install Heroku ===== //"
      curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
      # heroku login -i
      
      # Rerun Appinstaller
      appInstaller
      ;;
    *)
      echo "Invalid choice!"
      ;;
  esac
}

function updateManager() {
  printf "
  // ===== Update Manager ===== //
  0) Go Back
  1) Update and Upgrade all packages
  2) Hold update for a package
  3) Remove the hold for a package
  4) Show all packages on hold
  "
  read -p "Select Option: " UPDATEMANAGERCHOICE

  case "$UPDATEMANAGERCHOICE" in
    0)
      reRunScript "auto"
      ;;
    1)
      sudo apt update; sudo apt upgrade
      # Rerun updateManager
      updateManager
      ;;
    2)
      read -p "Enter Package Name: " PACKAGENAME
      sudo apt-mark hold "$PACKAGENAME"
      # Rerun updateManager
      updateManager
      ;;
    3)
      read -p "Enter Package Name: " PACKAGENAME
      sudo apt-mark unhold "$PACKAGENAME"
      # Rerun updateManager
      updateManager
      ;;
    4)
      sudo apt-mark showhold
      # Rerun updateManager
      updateManager
      ;;
    *)
      echo "Invalid choice!"
      ;;
  esac
}

function antivirusManager() {
  printf "
  // ===== Antivirus Manager ===== //
  0) Go back
  1) Install ClamAV
  2) Scan A Folder
  3) Update ClamAV Database
  "
  read -p "Select Option: " UPDATEMANAGERCHOICE
   
  case "$UPDATEMANAGERCHOICE" in
    0)
      reRunScript "auto"
      ;;
    1)
      sudo apt install clamav clamav-daemon && sudo service clamav-freshclam stop && sudo freshclam && sudo service clamav-freshclam start
      # Rerun antivirusManager
      antivirusManager
      ;;
    2)
      read -p "Enter Folder Path: " MAINDIR
      setDir "$DOWNLOADSDIR"
      clamscan -ri .
      # Rerun antivirusManager
      antivirusManager
      ;;
    3)
      sudo service clamav-freshclam stop && sudo freshclam && sudo service clamav-freshclam start
      # Rerun antivirusManager
      antivirusManager
      ;;
    *)
      echo "Invalid choice!"
      ;;
  esac
}

function extraConfig() {
  printf "
  // ===== Extra Config ===== //
  0) Go Back
  1) Reduce SSD Write
  2) Fix System Monitor
  3) VLC - Create Playlist from file
  4) Move Flatpak folder to Home
  5) Get global NodeJS and Composer packages
  6) Set Time and Date to rtc
  7) Reinstall MSfonts
  8) Remove Execute Permission from files
  9) Disable Anaconda auto activation
  10) Add Anaconda to environment path
  11) Restart or Stop Mongodb
  "
  read -p "Select Option: " EXTRACONFIGCHOICE
  
  case "$EXTRACONFIGCHOICE" in
    0)
      reRunScript "auto"
      ;;
    1)
      # echo "replace 'errors=remount-ro' with 'errors=remount-ro,noatime' only in the SSD mounted drives"
      # sudo xed /etc/fstab
      sudo sed -i "s|errors=remount-ro |errors=remount-ro,noatime |g" /etc/fstab && printf "\n ***** Reduced SSD Write ***** \n"
      # Rerun extraConfig
      extraConfig
      ;;
    2)
      sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop && printf "\n ***** Fixed System Monitor ***** \n"
      # Rerun extraConfig
      extraConfig
      ;;
    3)
      # Checking for VLC
      if ! command -v vlc &> /dev/null
        then
          echo "Install VLC Media player first"
          return
      fi

      # codes
      vlcAutoplayer
      chmod +x ~/.config/vlc/vlc.sh && sudo sed -i "s|Exec=/usr/bin/vlc --started-from-file %U|Exec=$HOME/.config/vlc/vlc.sh|g;s|TryExec=/usr/bin/vlc|TryExec=$HOME/.config/vlc/vlc.sh|g" /usr/share/applications/vlc.desktop && printf "\n ***** VLC improvement successful ***** \n"
      # Rerun extraConfig
      extraConfig
      ;;
    4)
      sudo cp -r /var/lib/flatpak/ ~/Applications/ && sudo mv /var/lib/flatpak/ /var/lib/flatpak.bak/ && sudo ln -s ~/Applications/flatpak /var/lib/flatpak && printf "\n ***** Moved flatpak installation folder to $HOME/Applications/flatpak ***** \n"
      # Rerun extraConfig
      extraConfig
      ;;
    5)
      # Checking for Node.js
      if ! command -v node &> /dev/null
        then
          echo "Install Node.js and Composer first"
          return
      fi

      npm install -g asar create-react-app create-next-app express-generator eslint live-server http-server nodemon prettier sass sass-migrator typescript uglify-js yarn && printf "\n ***** Node.js global packages installed ***** \n"
      composer global require laravel/installer friendsofphp/php-cs-fixer && printf "\n ***** Composer global packages installed ***** \n"
      # Rerun extraConfig
      extraConfig
      ;;
    6)
      sudo timedatectl set-local-rtc 1 --adjust-system-clock && printf "\n ***** Time and date set to RTC ***** \n"
      # Rerun extraConfig
      extraConfig
      ;;
    7)
      sudo apt-get install --reinstall msttcorefonts
      # Rerun extraConfig
      extraConfig
      ;;
    8)
      read -p "Enter Folder Path: " MAINDIR
      setDir "$APPDIR"
      chmod -R -x+X *
      if [ $? -eq 0 ]
      then
        echo "Execute permission removed to all files in this folder. Thank You!"
      else
        echo "Could not remove execute permission"
      fi
      # Rerun extraConfig
      extraConfig
      ;;
    9)
      conda config --set auto_activate_base false && printf "\n ***** Anaconda auto activation disabled ***** \n"
      # Rerun extraConfig
      extraConfig
      ;;
    10)
      [ -d "$HOME/Applications/anaconda3" ] && echo "export PATH=\$PATH:$HOME/Applications/anaconda3/bin" >> ~/.profile && source ~/.profile && printf "\n ***** Anaconda added to environment path ***** \n"
      # Rerun extraConfig
      extraConfig
      ;;
    11)
      # Checking for MongoDB
      if ! command -v mongosh &> /dev/null
        then
          printf "\nInstall MongoDB First!\n\n"
          return
      fi

      # Code
      read -p "Restart or Stop (r/s): " MONGOCTLCHOICE 
      
      case "$MONGOCTLCHOICE" in 
      [rR] | [rR][uU][nN])
        sudo systemctl restart mongod && printf "\n ***** Mongodb restarted ***** \n"
        ;;
      [sS] | [sS][tT][oO][pP])
        sudo systemctl stop mongod && printf "\n ***** MongoDB stopped ***** \n"
        ;;
      *)
        echo "Invalid choice! Please enter r/run or s/stop"
        ;;
      esac
      # Rerun extraConfig
      extraConfig
      ;;   
    *)
      echo "Invalid choice!"
      ;;
  esac
}

# Main Function
function mainMenu() {
  printf "
  // ===== Main Menu ===== //
  0) Exit
  1) Remove Bloatwares and Adjust swappiness
  2) Install Applications from Repository
  3) Install Other Applications
  4) Update Manager
  5) Antivirus Manager
  6) Defragment
  7) Start or stop XAMPP
  8) Extra Configurations
  "

  read -p "Select Option: " mainChoice
   
  # Main Controller
  case "$mainChoice" in 
    0)
      echo "Thank You!"
      ;;
    1)
      sudo apt remove celluloid gnote xviewer seahorse warpinator drawing pix hexchat hexchat-common transmission hypnotix rhythmbox transmission-gtk && printf "\n ***** Bloatware removed ***** \n"
      echo "vm.swappiness = 10" | sudo tee -a /etc/sysctl.conf && printf "\n ***** vm.swappiness Reduced ***** \n"
      # Confirm Exit
      reRunScript
      ;;
    2)
      sudo apt install bleachbit copyq firejail git handbrake ibus libdvd-pkg libreoffice-style-sifr k3b nomacs obs-studio okular python3-brotli qbittorrent resolvconf ubuntu-restricted-extras yt-dlp autoconf curl dh-autoreconf ffmpegthumbnailer libavcodec-extra net-tools openjdk-11-jre
      sudo dpkg-reconfigure libdvd-pkg
      # Confirm Exit
      reRunScript
      ;;
    3)
      clear
      appInstaller
      ;;
    4)
      clear
      updateManager
      ;;
    5)
      clear
      antivirusManager
      ;;
    6)
      defragment
      # Rerun mainMenu
      mainMenu
      ;;
    7)
      # Checking for Xampp
      if ! command -v /opt/lampp/lampp &> /dev/null
        then
          printf "\nInstall Xampp First!\n\n"
          return
      fi

      # Code
      read -p "Run or Stop (r/s): " XAMPPCTLCHOICE
      
      case "$XAMPPCTLCHOICE" in 
      [rR] | [rR][uU][nN])
        sudo /opt/lampp/lampp start
        ;;
      [sS] | [sS][tT][oO][pP])
        sudo /opt/lampp/lampp stop
        ;;
      *)
        echo "Invalid choice! Please enter r/run or s/stop"
        ;;
      esac
      # Confirm Exit
      reRunScript
      ;;      
    8)
      clear
      extraConfig
      ;;
    *)
      echo "Invalid choice!"
      # Confirm Exit
      reRunScript
      ;;
  esac
}
mainMenu
