.PHONY: init plan apply destroy reset

SHELL := /bin/bash

ifndef ENV
$(error ENV is not set. Usage: make <target> ENV=<environment_name>)
endif

TFVARS  := conf/$(ENV)/$(ENV).tfvars
TFPLAN  := $(ENV).tfplan

init:
	tofu init -upgrade

plan:
	tofu plan -var-file=$(TFVARS) -out=$(TFPLAN)

apply:
	tofu apply -auto-approve $(TFPLAN)

destroy:
	tofu destroy -var-file=$(TFVARS) -auto-approve
	rm -f $(TFPLAN)

reset:
	$(MAKE) destroy ENV=$(ENV)
	rm -f $(TFPLAN)
	$(MAKE) init ENV=$(ENV)
	$(MAKE) plan ENV=$(ENV)
	$(MAKE) apply ENV=$(ENV)