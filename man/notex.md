% notex(1) | General Commands Manual

## NAME

notex(1) -- Note taking command line utility

## SYNOPSIS

**notex** **[-h]** *SUBCOMMAND* ...

## DESCRIPTION

**notex** is a command line program for UNIX-like systems for taking and\
managing notes with a focus on simplicity and easily combining other commands\
through shell mechanisms such as pipelines and redirection.

**notex** was inspired from the Bourne Again shell script **notes** by the\
creator of *HTTP Toolkit*, Tim Perry.

The main differences between the two are:

                          **notes**                                           **notex**
-----------------------   ---------------------------                         -------------------------
Language                  Bash                                                Python
Notes directory           *NOTES_DIRECTORY*                                   *XDG_DATA_HOME/notex*
Configuration file        *~/.config/notes/config*                            None
Subcommand aliases        **n**, **f**, **g**, **s**, **o**, **a**, and **c** None
Arguments per subcommand  One                                                 One or more
Command line option style GNU, UNIX, and X toolkit                            GNU and UNIX

**notex** reads and writes text files in any format (e.g., Markdown) (notes)\
into and from the directory *$XDG_DATA_HOME/notex* (base directory) or\
subdirectories of the same (notebooks).

To create or manage notes and/or notebooks, you must write one of the\
subcommands below and pathnames relative to the base directory.

## OPTIONS

**-h, --help**

:   Show usage message and exit.

## SUBCOMMANDS

If no arguments are given to the subcommands below, except for **ls**,\
**notex** will read one or more lines from the standard input stream and use\
them as arguments.

**touch [-h] [PATHNAMES...]**

Create notes in *PATHNAMES*.

**mkdir [-h] [PATHNAMES...]**

Create notebooks in *PATHNAMES*.

**edit [-h] [PATHNAMES...]**

Open notes in *PATHNAMES*.

**cat [-h] [PATHNAMES...]**

Write the contents of the notes in *PATHNAMES* to the standard output stream.

**rm [-h] [PATHNAMES...]**

Remove notes and/or notebooks in *PATHNAMES*.

**mv [-h] [SOURCE] [DESTINATION]**

Move or rename notes and/or notebooks.

**ls [-h] [PATHNAMES...]**

Write the names of the notes and notebooks in the notebooks in *PATHNAMES* to\
the standard output stream.

If no *PATHNAMES* are given, **notex** will write the names of the notes and\
notebooks in the base directory.

**realpath [-h] [PATHNAMES...]**

Write the canonicalized pathnames of notes and/or notebooks in *PATHNAMES* to\
the standard output stream.

## EXIT STATUS

- 0:

The command terminated without errors or warnings.

- 64 (**EX_USAGE**):

A command line argument is missing or was not specified correctly.

- 65 (**EX_DATAERR**):

A note was not encoded with UTF-8.

- 66 (**EX_NOINPUT**):

A note or notebook did not exist or a pathname referred to a file with an\
incorrect type.

- 69 (**EX_UNAVAILABLE**):

There was no executable file named as the value of the environment
variable **EDITOR**.

- 73 (**EX_CANTCREAT**):

The base directory, a note or a notebook could not be created.

- 75 (**EX_TEMPFAIL**):

The value of an environment variable was not set or invalid.

## ENVIRONMENT

- **XDG_DATA_HOME**

If the variable is set and its value is not an empty string, its value is used
to construct the pathname for the base directory.

- **EDITOR**

If the variable is set and its value is not an empty string, the program named
as its value will be executed in a child process and with the pathnames for the
notes as arguments.

- **HOME**

If the environment variable **XDG_DATA_HOME** is not set or its value is an
empty string, its value is used to construct the pathname for the base
directory.

## EXAMPLES

**NOTE**: Shell syntax and command arguments may vary, read and and understand
the commands below before executing them.

0.  Create a note:

**notex touch "School/Physics/Class-$(date"+%d-%m-%Y").md"**

1.  Create notebooks:

**notex mkdir School/{Physics,"World History","Differential Calculus"}**

2.  Edit notes:

**notex edit Diary "Bucket List" School/Literature/Poem**

3.  Show contents of notes:

**notex cat School/Art/ASCII.txt School/Chemistry/Reactions.md**

4.  Remove a notebook:

**notex rm School/OldCourse**

5.  Rename a note:

**notex mv {Groozeryes,Groceries}.md**

6.  Rename a notebook:

**notex mv "Personal Stuff" Personal**

7.  Move a note into notebook:

**notex mv School/Physics/Realism.md School/Literature**

8. Overwrite and delete a note:

**notex realpath Cellphones | xargs shred -u**

9. Print first alphabetically sorted note name:

**notex ls School | grep -v "/$" | sort | uniq | head -n 1**

10. Search notes by name:

**notex ls | grep ".md$"**

11. Search for a string in a note:

**notex cat School/Mathematics/Ellipses.md | grep -i "Foci"**

12. Read a note written in Markdown with another program:

**notex cat "School/Chemistry/Functional Groups" | glow**

13. Create a PDF file from a note written in GitHub Flavored Markdown:

**notex realpath School/Physics/Formulary | pandoc -f gfm -t pdf -o Formulary.pdf**

## SEE ALSO

**sh(1)**, **bash(1)**, **notes(1)**, **path_resolution(7)**

- Tim Perry's GitHub repository for **notes**:

https://github.com/pimterry/notes

- XDG Base Directory specification:

https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

- Command line option styles:

http://www.catb.org/esr/writings/taoup/html/ch10s05.html#ftn.id2950141
