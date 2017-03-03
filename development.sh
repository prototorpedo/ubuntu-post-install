#!bin/bash

cd ./tmp

# Essentials (git, terminator, editors)
#
install_list 'data/development/essentials.list'

# Installing editors
install_list 'data/development/editors.list'

sudo ln -s /usr/bin/neovim /usr/bin/vi

##

# Installing php w/ composer & laravel + symfony installers
#
install_list 'data/development/php.list'

# Composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
php -r "if (hash_file('SHA384', 'composer-setup.php') === '92102166af5abdb03f49ce52a40591073a7b859a86e8ff13338cf7db58a19f7844fbc0bb79b2773bf30791e935dbd938') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm -rf composer-setup.php

echo "export PATH=~/.composer/vendor/bin:$PATH" >> ~/.zshrc

# Laravel + Symfony installers
composer require global "laravel/installer"

sudo curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
sudo chmod a+x /usr/local/bin/symfony

##

# Node.js + npm nosudo
#
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

sudo apt-get install nodejs

wget https://github.com/glenpike/npm-g_nosudo/blob/master/npm-g-nosudo.sh
bash npm-g-nosudo.sh

##

# Ruby + gems
#
sudo apt-get install -y ruby-full

##
##

# Vagrant
echo "Vagrant...\n"
URL='https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb'
wget "$URL" -qO $FILE && sudo dpkg -i $FILE

rm $FILE

cd ..
