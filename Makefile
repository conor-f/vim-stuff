# Current directory by default, but set it similar to the following to
# hardcode:
#homedir = /home/<username>
homedir = $(CURDIR)
comma := ,
quote := '

define colour_echo
	@tput setaf 6
	@echo $1
	@tput sgr0
endef

clean: $(homedir)
	rm -fr $(homedir)/.vim

init: $(homedir)
	mkdir $(homedir)/.vim
	cp resources/.vimrc $(homedir)/.vim/.vimrc
	sed -i 's|++HOMEDIR++|$(homedir)|g' $(homedir)/.vim/.vimrc

python: $(homedir)
	sed -i 's|"++SHOULD_INCLUDE_PYTHON++||g' $(homedir)/.vim/.vimrc

floaterm: $(homedir)
	sed -i 's|"++SHOULD_INCLUDE_FLOATERM++||g' $(homedir)/.vim/.vimrc

slimv: $(homedir)
	sudo apt install slime
	sed -i 's|"++SHOULD_INCLUDE_SLIMV++||g' $(homedir)/.vim/.vimrc

alias: $(homedir)
	@echo 'alias vim="vim -u $(homedir)/.vim/.vimrc"' >> ~/.zshrc

quick: $(homedir) clean init alias

install: $(homedir) clean init python floaterm slimv alias
	@echo ""
	$(call colour_echo, "Full install completed!")
	$(call colour_echo, "An alias has been added to your ~/.zshrc file to make this your default config.")
	$(call colour_echo, "This is trivial to delete if you don't like it!")
	$(call colour_echo, "Your vimrc is now in "$(homedir)"/.vim/.vimrc")
	$(call colour_echo, "Copy the entire .vim directory to ~/ if you want to take all the plugins etc with you.")
	$(call colour_echo, "Now source your ~/.zshrc$(comma) vim your favourite file$(comma) wait for the plugins to install$(comma) close and reopen vim$(comma) and you$(quote)re ready to go!")

slimv_install: $(homedir) clean init slimv alias
	@echo ""
	$(call colour_echo, "Full install completed!")
	$(call colour_echo, "An alias has been added to your ~/.zshrc file to make this your default config.")
	$(call colour_echo, "This is trivial to delete if you don't like it!")
	$(call colour_echo, "Your vimrc is now in "$(homedir)"/.vim/.vimrc")
	$(call colour_echo, "Copy the entire .vim directory to ~/ if you want to take all the plugins etc with you.")
	$(call colour_echo, "Now source your ~/.zshrc$(comma) vim your favourite file$(comma) wait for the plugins to install$(comma) close and reopen vim$(comma) and you$(quote)re ready to go!")
