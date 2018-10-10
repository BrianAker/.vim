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
VIMRC:= $(HOME)/.vimrc

VIMRC_VIM:= vimrc.vim
BUNDLE_VIM:= bundle.vim
EDITOR:= vim
VIM:= vim -u $(VIMRC_VIM)
VUNDLE:= bundle/Vundle.vim/README.md
BUNDLE_LAST_UPDATED:= bundle/.last_updated
VUNDLE_VIM:= bundle/Vundle.vim/$(dirstamp)
VUNDLE_REPO:= https://github.com/VundleVim/Vundle.vim.git
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
all: $(VUNDLE_VIM) $(BUNDLE_LAST_UPDATED) | $(prereq__DIRECTORIES)

bundle/vim-colors-solarized/colors/solarized.vim:
	@$(VIM) +PluginInstall! +qall

# Dead rule
colors/solarized.vim: bundle/vim-colors-solarized/colors/solarized.vim colors/$(dirstamp)
	@$(INSTALL_C) $< $@

$(BUNDLE_LAST_UPDATED): $(BUNDLE_VIM)
	@$(MKDIR_P) $(dir $@)
	@$(VIM) +PluginClean! +qall
	@$(VIM) +PluginInstall! +qall
	@$(VIM) +PluginClean! +qall
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
	@rm -rf $(dir $(BUNDLE_LAST_UPDATED))
	$(MAKE)

$(VIMRC): $(VIMRC_VIM)
	@$(INSTALL_C) $< $@

.PHONY: uninstall
uninstall: clean
	@rm $(VIMRC) gvimrc

.PHONY: clean
clean:
	@vim +PluginClean! +qall
	@if [ -L $(VIMRC) ]; then rm $(VIMRC); fi
	@rm -rf colors
	@rm -rf $(dir $(BUNDLE_LAST_UPDATED))

.PRECIOUS: %/.dirstamp

.DEFAULT_GOAL := all
.NOTPARALLEL:
