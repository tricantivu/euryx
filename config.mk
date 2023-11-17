# https://www.gnu.org/prep/standards/html_node/Directory-Variables.html#Directory-Variables

srcdir = src

# Prefixes
prefix = /usr/local
exec_prefix = $(prefix)

# Executable programs
bindir = $(exec_prefix)/bin

# Data files
datarootdir = $(prefix)/share

# Man pages
mandir = $(datarootdir)/man
man1dir = $(mandir)/man1

manext = .1
