PROJECT = the_fallacy_of_layered_abstractions
SRC = src/$(PROJECT).tex
OUT_DIR = build

LUA_FLAGS = -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1

.PHONY: all ja en clean

all: ja en

ja: $(OUT_DIR)/$(PROJECT)_ja.pdf
en: $(OUT_DIR)/$(PROJECT)_en.pdf

$(OUT_DIR)/$(PROJECT)_ja.pdf: $(SRC)
	@mkdir -p $(OUT_DIR)
	latexmk -pdf -lualatex \
		-pdflatex='lualatex $(LUA_FLAGS) -jobname=$(PROJECT)_ja "\let\ifja\iftrue\input{$(SRC)}"' \
		-jobname=$(PROJECT)_ja \
		-outdir=$(OUT_DIR) \
		$(SRC)

$(OUT_DIR)/$(PROJECT)_en.pdf: $(SRC)
	@mkdir -p $(OUT_DIR)
	latexmk -pdf -lualatex \
		-pdflatex='lualatex $(LUA_FLAGS) -jobname=$(PROJECT)_en "\let\ifja\iffalse\input{$(SRC)}"' \
		-jobname=$(PROJECT)_en \
		-outdir=$(OUT_DIR) \
		$(SRC)

clean:
	latexmk -C -outdir=$(OUT_DIR)
	rm -rf $(OUT_DIR)
