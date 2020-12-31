
#package=
#CINCLUDE:=$(shell /usr/bin/pkg-config --cflags package)
#CLIBS=$(shell /usr/bin/pkg-config --libs package)

CFLAGS+=-fdump-ada-spec -C
CFLAGS+=-fada-spec-parent=Pcre.Low_Level
CFLAGS+=-DPCRE2_CODE_UNIT_WIDTH=8

all:gen
	./generate_wide.py
	./update_pcre_ads.py
	gprbuild  -j0 -k -p -P pcre.gpr
gen:.generate

.generate:Makefile $(wildcard sed/*.sed) src/input.cpp

	rm -rf  .gen src/gen
	mkdir -p .gen src/gen

	
	cd .gen; gcc -c ${CFLAGS} -C  ${CURDIR}/src/input.cpp
	cp .gen/pcre-low_level-pcre2_h.ads src/gen
	python bin/patch_generated

	@gprbuild  -j0 -k -p -P pcre.gpr 2>&1 | tee .messages.txt

# evaluate the build and generate empty .sed files for failed specs.
	find sed -size 0 -name "*.sed" -delete
	@if (grep "compilation of" .messages.txt) ; then\
		echo "FAIL#";\
		touch `cat .messages.txt  | grep "compilation of" | grep "failed" | sed "s-  - -g" | cut -f 5 -d " " | \
			sed -e "s-^-sed/-"  -e "s/\.ads$$/.sed/"` sed/all.sed ;\
		rm -f .messages.txt;\
		exit 1;\
	fi
	gnatpp -P pcre.gpr src/gen/*.ads

	chmod -w src/gen/*.ads
	touch $@

