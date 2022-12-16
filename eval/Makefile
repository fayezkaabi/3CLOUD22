.PHONY: help init plan apply destroy mrproper

help:
	@echo "Usage: make init|plan|apply|destroy|mrproper"
	@echo "Note: create a teamname.txt containing a nice name like 'farting-zuckerberg' (not that one!)"

init: locals.tf
	terraform init

plan: locals.tf
	terraform plan

apply: locals.tf
	terraform apply --auto-approve

destroy: locals.tf
	terraform destroy --auto-approve

locals.tf: teamname.txt 
	@test -f teamname.txt
	sed -e "s/TEAMNAME/$$(cat teamname.txt)/" locals.tf.tmpl > locals.tf	

teamname.txt:
	@echo "Note: create a teamname.txt containing a nice name like 'farting-zuckerberg' (not that one!)"


mrproper: destroy
	rm -f locals.tf *state* teamname.txt
