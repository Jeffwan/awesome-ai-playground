PACKER_BINARY ?= packer
AVAILABLE_PACKER_VARIABLES := $(shell $(PACKER_BINARY) inspect -machine-readable ai-playground-dlami.json | grep 'template-variable' | awk -F ',' '{print $$4}')

# include only variables which have a defined value
PACKER_VARIABLES := $(foreach packerVar,$(AVAILABLE_PACKER_VARIABLES),$(if $($(packerVar)),$(packerVar)))
PACKER_VAR_FLAGS := -var-file ai-playground-dlami-variables.json \
$(if $(PACKER_VARIABLE_FILE),--var-file=$(PACKER_VARIABLE_FILE),) \
$(foreach packerVar,$(PACKER_VARIABLES),-var $(packerVar)='$($(packerVar))')

T_RED := \e[0;31m
T_GREEN := \e[0;32m
T_YELLOW := \e[0;33m
T_RESET := \e[0m

.PHONY: validate
validate: ## Validate packer config
	$(PACKER_BINARY) validate $(PACKER_VAR_FLAGS) ai-playground-dlami.json

.PHONY: build
build: validate ## Build default version of ai playground AMI
	@echo "$(T_GREEN)Building AMI for version $(T_YELLOW)$(T_GREEN) on $(T_YELLOW)$(T_RESET)"
	$(PACKER_BINARY) build -timestamp-ui -color=false $(PACKER_VAR_FLAGS) ai-playground-dlami.json
