# My fish Settings.
.config/fish  
fish -> version 3.3.1  
fisher -> version 4.3.0

# fish Install & Change Default Shell
```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

sudo chsh
  Login Shell [/bin/bash]: /usr/bin/fish
```

# fisher Install & Add Theme (bobthefish)
```
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install oh-my-fish/theme-bobthefish
```
