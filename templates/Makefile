SHELL=/bin/bash
PROVIDER=virtualbox
TARGETS=build reload clean status

all: $(TARGETS)

build:
	time vagrant up --provider $(PROVIDER)

reload:
	time vagrant reload

clean:
	time vagrant destroy -f

status:
	vagrant status

.PHONY: $(TARGETS)
