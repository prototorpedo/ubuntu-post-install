DISTRIB=$(python -mplatform)

if DISTRIB | grep Ubuntu; then
	## Ubuntu customisations: themes, icon sets...
	sudo apt-get install unity-tweak-tool numix-icon-theme-circle flattastic-suite
fi

