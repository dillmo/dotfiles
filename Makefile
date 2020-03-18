CONFIG := $(HOME)/.config
configfiles = $(addprefix $(CONFIG),$(shell find $(1) | tail +2 | sed "s/$(1)//"))
VIMFILES := $(call configfiles,vim)
FISHFILES := $(call configfiles,fish)
VIMPLUG := $(HOME)/.local/share/nvim/site/autoload/plug.vim

install: fish

fish: /usr/bin/fish node vim $(FISHFILES)

node: $(HOME)/.nvm

vim: /usr/bin/nvim node $(VIMFILES) $(VIMPLUG)

$(VIMFILES): /bin/stow
	stow -t $(CONFIG) vim

$(FISHFILES): /bin/stow
	stow -t $(CONFIG) fish

/bin/stow:
	sudo pacman -S stow --noconfirm

/usr/bin/nvim:
	sudo pacman -S neovim --noconfirm

/usr/bin/fish:
	sudo pacman -S fish --noconfirm
	chsh -s /usr/bin/fish

$(HOME)/.nvm:
	git clone https://github.com/nvm-sh/nvm.git $(HOME)/.nvm
	cd $(HOME)/.nvm; git checkout v0.35.3

$(VIMPLUG):
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
		nvim -c 'PlugInstall | qa'
