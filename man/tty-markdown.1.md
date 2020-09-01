# tty-markdown(1)

## NAME

`tty-markdown` - display Markdown documents in a nicely formatted terminal output

## SYNOPSIS

`tty-markdown` \[options\] \[file\]

## DESCRIPTION

The `tty-markdown` utility displays Markdown documents in a nicely formatted terminal output.

The options are as follows:

`-a`, `--ascii`
: Use ASCII symbols.

`-c n`, `--colors n`
: Maximum number of colors supported by the terminal (default auto detect).

`-i n`, `--indent n`
: Indentation amount (default 2 spaces).

`-w n`, `--width n`
: Maximum output width (default full terminal width).

`-h`, `--help`
: Print the synopsis and list all available options

`-v`, `--version`
: Print the tool version and the tty-markdown version its using.

## EXAMPLES

Print a Markdown document to the standard output using ASCII symbol set:

```
tty-markdown -a README.md
```

Read a Markdown content and print it to the standard output at maximum width of 80 characters:

```
cat README.md | tty-markdown --width 80
```

## EXIT STATUS

The `tty-markdown` utility exits 0 on success, and 1 if an error occurs.

## SEE ALSO

The `tty-markdown` readme https://github.com/piotrmurach/tty-markdown

## AUTHOR

The `tty-markdown` utility is written by Piotr Murach \<piotr@piotrmurach.com\>

Website: https://ttytoolkit.org
