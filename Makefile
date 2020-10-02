
.DEFAULT_GOAL := all

TSC = tsc
TSCOPTS = -strict

.PHONY: all
all: static/tolerances.js

static:
	mkdir $@

static/tolerances.js: static work/tolerances.js
	java -jar googcc/closure-compiler.jar --js work/tolerances.js --js_output_file $@

work:
	mkdir $@

work/tolerances.js: work src/main.ts src/test.ts
	$(TSC) $(TSCOPTS) --outfile $@ src/main.ts

.PHONY: clean
clean:
	rm -rf work static

