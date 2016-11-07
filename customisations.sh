DISTRIB=$(python -mplatform)

if DISTRIB | grep Ubuntu; then
	## Ubuntu customisations: themes, icon sets...
	sudo apt-get install unity-tweak-tool numix-icon-theme-circle flattastic-suite ambiance-blackout-colors moka-icon-theme conky conky-all compizconfig-settings-manager compiz-plugins
fi

