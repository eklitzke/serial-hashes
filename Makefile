ALL_HASHES = $(shell find content/ -type f -print | sed 's/^content/hashes/')

all: $(ALL_HASHES)

hashes:
	mkdir $@

hashes/% : content/%
	$(shell sha1sum $< | awk '{print $$1}' > $@)

.PHONY: all
