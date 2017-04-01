N?=0
SIZE?=short
IN:=    data/la4.${SIZE}/${SIZE}.la4falcon
GOLDEN:=data/la4.${SIZE}/${SIZE}.cns.fasta
FLAGS:=--output_multi --min_idt 0.70 --min_cov 4 --max_n_read 500 --n_core $N
F:=../main.exe
GS:=../../git-sym/git-sym

vpath %.la4falcon data/la4.short:data/la4.long:data/la4.huge

nim: ${IN}
	$F ${FLAGS} > out.nim.fasta < ${IN}
py: ${IN}
	fc_consensus ${FLAGS} > out.py.fasta < ${IN}
comp:
	diff out.nim.fasta ${GOLDEN}
%.la4falcon:
	${GS} show data/la4.${SIZE}
	${GS} update data/la4.${SIZE}
	${GS} show data/la4.${SIZE}
.PHONY: nim py comp
