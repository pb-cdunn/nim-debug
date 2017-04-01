NIMFLAGS+=--threads:on
#NIMFLAGS+=--threadAnalysis:off
NIMFLAGS+=--verbosity:2
NIMFLAGS+=-d:debug
#NIMFLAGS+=-d:release
NIMFLAGS+=--tlsemulation:on
NIMFLAGS+=-d:debugHeapLinks

pass: main.exe
	N=0 SIZE=short make -C test
long: main.exe
	N=1 SIZE=long make -C test
fail:
	N=1 SIZE=huge make -C test

main.exe: main.nim falcon.nim common.nim DW_banded.nim kmer_lookup_c.nim poo.nim
run-%: %.exe
	./$*.exe
%.exe: %.nim
	nim ${NIMFLAGS} --out:$*.exe c $<
clean:
	rm -rf nimcache/
	rm -f main.exe
init:
	git submodule update --init
