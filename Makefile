FORMULA=$(shell git ls-files '*.rb' | while read file; do basename $$file .rb; done)

all: $(FORMULA)

$(FORMULA):
	brew audit $@.rb
	brew reinstall $@.rb --debug --verbose

.PHONY: all $(FORMULA)
