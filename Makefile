PROJECT=ieducar
SOURCE=$(PROJECT).adoc
TARGETPDF=$(PROJECT).pdf
TARGETHTML=$(PROJECT).html
IMAGEOUTDIR=img
#REQUIRES=asciidoctor-mathematical
ATTRIBUTES=stem
MATHFORMAT=svg
LOG=ieducar.log

pdf: xhtml5
	@echo -n "Formatando o livro em PDF... "
	@asciidoctor-pdf -a $(ATTRIBUTES) -a $(MATHFORMAT) $(SOURCE) -o $(TARGETPDF) > $(LOG) 2>&1
	@echo "pronto."

html: xhtml5

xhtml5: $(SOURCE)
	@echo -n "Formatando o livro em HTML... "
	@asciidoctor -b xhtml5 -a $(ATTRIBUTES) $(SOURCE) -o $(TARGETHTML) > $(LOG) 2>&1
	@echo "pronto."

all: pdf

clean:
	@echo -n "Apagando os arquivos criados... "
	@rm -rf $(TARGETPDF) $(TARGETHTML) $(IMAGEOUTDIR) $(LOG)
	@echo "pronto."
