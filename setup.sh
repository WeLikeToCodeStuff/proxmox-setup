clear
cat << "EOF"




         .://:`              `://:.
       `hMMMMMMd/          /dMMMMMMh`
        `sMMMMMMMd:      :mMMMMMMMs`
`-/+oo+/:`.yMMMMMMMh-  -hMMMMMMMy.`:/+oo+/-`
`:oooooooo/`-hMMMMMMMyyMMMMMMMh-`/oooooooo:`
  `/oooooooo:`:mMMMMMMMMMMMMm:`:oooooooo/`
    ./ooooooo+- +NMMMMMMMMN+ -+ooooooo/.
      .+ooooooo+-`oNMMMMNo`-+ooooooo+.
        -+ooooooo/.`sMMs`./ooooooo+-
          :oooooooo/`..`/oooooooo:
          :oooooooo/`..`/oooooooo:
        -+ooooooo/.`sMMs`./ooooooo+-
      .+ooooooo+-`oNMMMMNo`-+ooooooo+.
    ./ooooooo+- +NMMMMMMMMN+ -+ooooooo/.
  `/oooooooo:`:mMMMMMMMMMMMMm:`:oooooooo/`
`:oooooooo/`-hMMMMMMMyyMMMMMMMh-`/oooooooo:`
`-/+oo+/:`.yMMMMMMMh-  -hMMMMMMMy.`:/+oo+/-`
        `sMMMMMMMm:      :dMMMMMMMs`
       `hMMMMMMd/          /dMMMMMMh`
         `://:`              `://:`
EOF
echo "-------------------------------------------------------"
cat << "EOF"
  ____    ____     ___   __  __  __  __    ___   __  __
 |  _ \  |  _ \   / _ \  \ \/ / |  \/  |  / _ \  \ \/ /
 | |_) | | |_) | | | | |  \  /  | |\/| | | | | |  \  / 
 |  __/  |  _ <  | |_| |  /  \  | |  | | | |_| |  /  \ 
 |_|     |_| \_\  \___/  /_/\_\ |_|  |_|  \___/  /_/\_\
EOF
echo "-------------------------------------------------------"
currentyear=`date +'%Y'`
echo "Thank you for using Neon's Proxmox Setup Script"
echo "©️ $currentyear Neon Development"
echo ""
echo ""

dark_theme() {
  read -p "Would you like to install a dark theme? y/n " yesnotheme
  if [ $yesnotheme == "y" ]
  then
    echo "Installing Weilbyte's PVE Discord Dark theme..."
    apt install curl -y
    bash <(curl https://raw.githubusercontent.com/Weilbyte/PVEDiscordDark/master/PVEDiscordDark.sh)
    remove_popup()
  else
    remove_popup()
  fi
}

remove_popup() {
  read -p "Would you like to remove the Proxmox Subscription Notice message? y/n " yesnopopup
  if [ $yesnopopup== "y" ]
  then
    echo "Removing the subscription notice popup..."
    sed -Ezi.bak "s/(Ext.Msg.show\(\{\s+title: gettext\('No valid sub)/void\(\{ \/\/\1/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service
    bedone()
  else
    bedone()
  fi
}

bedone() {
  echo "Thank you for using Neon's Proxmox setup script! If you have any issues, please send them via the issues page on our Github located at https://github.com/WeLikeToCodeStuff/proxmox-setup/issues"
  exit 0
}

dark_theme()
