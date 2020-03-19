CONFIG := $(HOME)/.config
configfiles = $(addprefix $(CONFIG),$(shell find $(1) | tail +2 | sed "s/$(1)//"))
VIMFILES := $(call configfiles,vim)
FISHFILES := $(call configfiles,fish)
VIMPLUG := $(HOME)/.local/share/nvim/site/autoload/plug.vim

install: fish

fish: /usr/bin/fish node python vim $(FISHFILES)

node: $(HOME)/.nvm

python: $(HOME)/.pyenv

vim: /usr/bin/nvim node /usr/bin/elixir $(VIMFILES) $(VIMPLUG)

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

/usr/bin/elixir:
	sudo pacman -S elixir --noconfirm

$(HOME)/.nvm: /usr/bin/fish
	git clone https://github.com/nvm-sh/nvm.git $(HOME)/.nvm
	cd $(HOME)/.nvm; git checkout v0.35.3
	fish -c "finit; nvm install node"
	fish -c "finit; npm i -g yarn typescript eslint prettier elm elm-test elm-format"

$(HOME)/.pyenv:
	git clone https://github.com/pyenv/pyenv.git $(HOME)/.pyenv

$(VIMPLUG): /usr/bin/fish
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fish -c "vim -c 'PlugInstall | qa'"
	fish -c "vim -c 'CocInstall coc-prettier coc-eslint coc-tsserver coc-json coc-html coc-elixir coc-css | q'"
