include config.mk

.PHONY: all install uninstall installdirs

all: installdirs install

install:
	for file in $(srcdir)/*; do\
		install -m 775 $${file} $(bindir); done

	for file in man/*; do\
		pandoc -s -f markdown -t man $${file} | \
		gzip -c - > $(man1dir)/$$(basename $${file} .md)$(manext).gz; \
		chmod 664 $(man1dir)/$$(basename $${file} .md)$(manext).gz; done

uninstall:
	for file in $(srcdir)/*; do\
		$(RM) $(bindir)/$$(basename $${file}); done

	for file in man/*; do\
		$(RM) $(man1dir)/$$(basename $${file} .md)$(manext).gz; done

installdirs:
	mkdir -p $(bindir)
	mkdir -p $(man1dir)
