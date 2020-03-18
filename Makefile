VIMFILES := $(addprefix $(HOME),$(shell find vim | tail +2 | sed 's/vim//'))

install: vim

vim: /usr/bin/nvim $(VIMFILES)

$(VIMFILES): /bin/stow
	stow -t $(HOME) vim

/bin/stow:
	sudo pacman -S stow --noconfirm

/usr/bin/nvim:
	sudo pacman -S neovim --noconfirm
