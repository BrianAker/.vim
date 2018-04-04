# vim:ft=make
MAKEFLAGS += --no-builtin-rules

.SUFFIXES:

HOME:= $(shell cd ~; pwd)
dirstamp:= .dirstamp
PREREQ=
PREREQ_DIR=
am_DIRECTORIES=

VIM_DIR:= $(HOME)/.vim
VIMRC:= $(HOME)/.vimrc

VIMRC_VIM:= vimrc.vim
BUNDLE_VIM:= bundle.vim
EDITOR:= vim
VIM:= vim -u $(VIMRC_VIM)
VUNDLE:= bundle/Vundle.vim/README.md
BUNDLE_DIR:= bundle/$(dirstamp)
VUNDLE_VIM:= bundle/Vundle.vim/$(dirstamp)
VUNDLE_REPO:= https://github.com/VundleVim/Vundle.vim.git
INSTALL_C:= install -C
TOUCH_R:= touch -r
TOUCH:= touch
INSTALL_DIR_TARGETS=
MKDIR_P:= mkdir -p
INSTALL_D:= install -d

#INSTALL_DIR_TARGETS+= bundle
INSTALL_DIR_TARGETS+= pack
INSTALL_DIR_TARGETS+= colors

am_install__DIRECTORIES= $(addsuffix /$(dirstamp), $(INSTALL_DIR_TARGETS))
install__DIRECTORIES= $(addprefix $(VIM_DIR)/, $(am_install__DIRECTORIES))

am_DIRECTORIES+= $(am_install__DIRECTORIES)
am_DIRECTORIES+= $(install__DIRECTORIES)

.PHONY: install_dir_am
install_dir_am: $(install__DIRECTORIES)

$(am_DIRECTORIES):
	@$(INSTALL_D) $(@D)
	@$(TOUCH) $@

.PHONY: display
display: 
	@echo $(VIMRC)

.PHONY: all
.ONESHELL:
all: $(VUNDLE_VIM) $(BUNDLES)

bundle/vim-colors-solarized/colors/solarized.vim:
	@$(VIM) +PluginInstall! +qall

# Dead rule
colors/solarized.vim: bundle/vim-colors-solarized/colors/solarized.vim colors/$(dirstamp)
	@$(INSTALL_C) $< $@

$(BUNDLE_DIR): $(BUNDLE_VIM)
	@$(VIM) +PluginClean! +qall
	@$(VIM) +PluginInstall! +qall
	@$(VIM) +PluginClean! +qall
	@$(MKDIR_P) $(dir $@)
	@$(TOUCH_R) $< $@

.phony: install
install: | all check $(VIMRC) gvimrc

gvimrc: gvimrc.vim
	@$(INSTALL_C) $< $@

.PHONY: check
check: all
	@$(VIM) +qall

$(VUNDLE):
	@git clone $(VUNDLE_REPO) $(@D)
	
$(VUNDLE_VIM): $(VUNDLE)
	@$(TOUCH_R) $< $@

.PHONY: update
update:
	@rm -rf $(BUNDLE_DIR) $(VUNDLE_VIM) $(BUNDLES)
	$(MAKE)

$(VIMRC): $(VIMRC_VIM)
	@$(INSTALL_C) $< $@

.ONESHELL:
all: $(BUNDLE_DIR) $(VUNDLE_VIM)

.ONESHELL:
.PHONY: uninstall
uninstall: clean
	@rm $(VIMRC) gvimrc

.PHONY: clean
.ONESHELL:
clean:
	@vim +PluginClean! +qall
	@if [ -L $(VIMRC) ]; then rm $(VIMRC); fi
	@rm -rf bundle colors

.DEFAULT_GOAL:= all
.NOTPARALLEL:
