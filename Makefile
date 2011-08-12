OPTIONS= -unsafe

UNIX= -package unix unix.cmxa
PCRE= -package pcre pcre.cmxa
STR = -package str str.cmxa

REGEXP_DIR= regexp/_build
REGEXP= regexp.cmx
MLOBJS= common.cmx re_string_regexp_bench.cmx re_regexp_bench.cmx pcre_nogroup_regexp_bench.cmx pcre_regexp_bench.cmx str_regexp_bench.cmx

TARGET= driver_unix.native

all: $(TARGET)

$(REGEXP):
	make -C regexp

re_regexp_bench.cmx: $(REGEXP) common.cmx re_regexp_bench.ml
	ocamlfind ocamlopt $(OPTIONS) $(UNIX) -I $(REGEXP_DIR) -c $^ -o $@

re_string_regexp_bench.cmx: $(REGEXP) common.cmx re_string_regexp_bench.ml
	ocamlfind ocamlopt $(OPTIONS) $(UNIX) -I $(REGEXP_DIR) -c $^ -o $@

pcre_regexp_bench.cmx: common.cmx pcre_regexp_bench.ml
	ocamlfind ocamlopt $(OPTIONS) $(UNIX) $(PCRE) -c $^ -o $@

pcre_nogroup_regexp_bench.cmx: common.cmx pcre_nogroup_regexp_bench.ml
	ocamlfind ocamlopt $(OPTIONS) $(UNIX) $(PCRE) -c $^ -o $@

str_regexp_bench.cmx: common.cmx str_regexp_bench.ml
	ocamlfind ocamlopt $(OPTIONS) $(UNIX) $(STR) -c $^ -o $@

$(TARGET): $(REGEXP) $(MLOBJS) $(subst native,ml,$(TARGET))
	ocamlfind ocamlopt $(OPTIONS) $(UNIX) $(STR) $(PCRE) -I $(REGEXP_DIR) $^ -o $@

%.cmx: %.ml
	ocamlfind ocamlopt $(OPTIONS) -c -g $<


clean:
	rm -rf $(TARGET) myocamlbuild.ml *.cm* *.o
	rm -rf _build regexp/_build

