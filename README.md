# lox-mode

An Emacs major mode for the [Lox programming language](http://craftinginterpreters.com/the-lox-language.html).

(Note that this mode requires Emacs version `24.3` (or higher)).

## Installation

### Manual

Clone this project to a directory of your choice, and add the following lines to your Emacs init file:

```lisp

  (unless (version< emacs-version "24")
    (add-to-list 'load-path "path/to/lox-mode/directory")
    (autoload 'lox-mode "lox-mode" nil t)
    (add-to-list 'auto-mode-alist '("\\.lox\'" . lox-mode)))

```

### Melpa

<TBD>

## Usage

Open a `.lox` script in a buffer - syntax highlighting and indentation should be automatically applied.

Run the currently loaded `Lox` script with: `C-c C-r`.

Alternatively, you can also run the script using the "interactive" mode command like so: `M-x lox-run`.

**Note**: the default executable for `Lox` is assumed to be `clox`. However, if you wish to change this to `jlox` (or any other 
custom value, you can do that by invoking: `M-x customize-mode`).

# LICENSE

See [LICENSE](LICENSE.md).
