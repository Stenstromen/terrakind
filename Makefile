.PHONY: init plan apply destroy reset

SHELL := /bin/bash
TFPLAN := tfplan

init:
	tofu init -upgrade

plan:
	tofu plan -out=$(TFPLAN)

apply:
	tofu apply -auto-approve $(TFPLAN)
	git pull

destroy:
	tofu destroy -auto-approve
	git pull

reset:
	$(MAKE) destroy
	rm -f $(TFPLAN)
	$(MAKE) init
	$(MAKE) plan
	$(MAKE) apply