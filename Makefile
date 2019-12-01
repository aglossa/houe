# File brought by github.com/aglossa/houe

HOSTNAME ?= $(hostname)

default: help

dotfiles: # install le .bashrc pour l'utilisateur courant et pour root
	cp .bashrc ~/.bashrc
	sudo cp .bashrc /root/.bashrc

install: # install l'outil de mise à jour de golang
	./install-update-golang.sh

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'