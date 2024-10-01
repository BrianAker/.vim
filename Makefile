# vim:ft=make
MAKEFLAGS += --no-builtin-rules

.SUFFIXES:

HOME:= $(shell cd ~; pwd)
dirstamp:= .dirstamp
PREREQ =
PREREQ_DIR =
am_DIRECTORIES =
INSTALL_DIR_TARGETS =

VIM_DIR:= $(HOME)/.vim
#VIMRC:= $(HOME)/.vimrc
VIMRC:= vimrc

VIMRC_VIM:= vimrc.vim
BUNDLE_VIM:= bundle.vim
EDITOR:= vim
VIM:= vim -u $(VIMRC_VIM) -T vt100
VIMPLUG:= autoload/plug.vim
BUNDLE_LAST_UPDATED:= bundle/.last_updated
VIMPLUG_DIR:= autoload/plug.vim
#VIMPLUG_DIR:= bundle/vim-plug/plug.vim
VIMPLUG_REPO:= https://github.com/junegunn/vim-plug
INSTALL_C:= install -C
TOUCH_R:= touch -r
TOUCH:= touch
MKDIR_P:= mkdir -p
INSTALL_D:= install -d

PREREQ_DIR += autoload
PREREQ_DIR += colors
PREREQ_DIR += pack
PREREQ_DIR += pack/my-plugins/start
PREREQ_DIR += pack/my-plugins/opt
PREREQ_DIR += pack/vim-plug/start
PREREQ_DIR += pack/vim-plug/opt
PREREQ_DIR += bundle

prereq__DIRECTORIES= $(addsuffix /$(dirstamp), $(PREREQ_DIR))
am_install__DIRECTORIES= $(addsuffix /$(dirstamp), $(INSTALL_DIR_TARGETS))
install__DIRECTORIES= $(addprefix $(VIM_DIR)/, $(am_install__DIRECTORIES))

am_DIRECTORIES+= $(prereq__DIRECTORIES)
am_DIRECTORIES+= $(am_install__DIRECTORIES)
am_DIRECTORIES+= $(install__DIRECTORIES)

.PHONY: install_dir_am
install_dir_am: $(install__DIRECTORIES)

%.dirstamp:
	@$(INSTALL_D) $(@D)
	@$(TOUCH) $@

.PHONY: display
display: 
	@echo $(am_DIRECTORIES)

.PHONY: all
all: $(VIMPLUG) $(BUNDLE_LAST_UPDATED) | $(prereq__DIRECTORIES)

bundle/vim-colors-solarized/colors/solarized.vim:
	@$(VIM) +PlugInstall! +qall

# Dead rule
colors/solarized.vim: bundle/vim-colors-solarized/colors/solarized.vim colors/$(dirstamp)
	@$(INSTALL_C) $< $@

$(BUNDLE_LAST_UPDATED): $(BUNDLE_VIM)
	@$(MKDIR_P) $(dir $@)
	@$(VIM) +PlugClean! +qall
	@$(VIM) +PlugInstall! +qall
	@$(VIM) +PlugClean! +qall
	@$(TOUCH_R) $< $@

.phony: install
install: | all check $(VIMRC) gvimrc
	@$(VIM) -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

gvimrc: gvimrc.vim
	@$(INSTALL_C) $< $@

.PHONY: check
check: all
	@$(VIM) +qall
	@$(VIM) +PlugStatus +qall

#$(VIMPLUG): $(VIMPLUG_DIR)
$(VIMPLUG):
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#	@$(INSTALL_C) $< $@
	
#$(VIMPLUG_DIR):
#	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#	git clone $(VIMPLUG_REPO) $@

.PHONY: update
update:
	@rm -rf $(dir $(BUNDLE_LAST_UPDATED))
	$(MAKE)

$(VIMRC): $(VIMRC_VIM)
	@$(INSTALL_C) $< $@

.PHONY: uninstall
uninstall: clean
	@rm $(VIMRC) gvimrc

.PHONY: clean
clean:
	@$(VIM) +PlugClean! +qall
	@if [ -L $(VIMRC) ]; then rm $(VIMRC); fi
	@rm -rf colors
	@rm -rf $(dir $(BUNDLE_LAST_UPDATED))

.PRECIOUS: %/.dirstamp

.DEFAULT_GOAL := all
.NOTPARALLEL:
