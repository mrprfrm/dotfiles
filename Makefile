STOW_SOURCE = $(if $(s),$(s),$(filter-out assets/,$(wildcard */)))

.PHONY: help
help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'

.PHONY: stow
stow: ## Stow packages; pass s=<package> to stow one source
	stow -t $(HOME) $(STOW_SOURCE)

.PHONY: unstow
unstow: ## Unstow packages; pass s=<package> to unstow one source
	stow -D -t $(HOME) $(STOW_SOURCE)

.PHONY: restow
restow: ## Restow packages; pass s=<package> to restow one source
	stow -R -t $(HOME) $(STOW_SOURCE)
