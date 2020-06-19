;;; lox-mode.el --- Major mode for the Lox programming language -*- lexical-binding: t -*-.

;; Copyright (C) 2020 Timmy Jose<zoltan.jose@gmail.com>

;; Author: Timmy Jose <zoltan.jose@gmail.com>
;; Maintainer: Timmy Jose <zoltan.jose@gmail.com>
;; Version: 1.0
;; Keywords: languages, lox
;; Homepage: https://github.com/timmyjose-projects/lox-mode

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;  A major mode for the Lox programming language (http://craftinginterpreters.com/the-lox-language.html).

;;; Code:

(defvar lox-mode-hook nil)

(defgroup lox-mode nil
  "Lox mode configuration group."
  :link '(url-link "https://www.craftinginterpreters.com/the-lox-language.html")
  :group 'languages)

(defcustom lox-bin "clox"
  "Path to the Lox executable."
  :type 'string
  :safe #'stringp
  :group 'lox-mode)

;; supported commands

;;;###autoload
(defun lox-run ()
  "Run the currently loaded script."
  (interactive)
  (compile (concat lox-bin " " (buffer-file-name)))
  (other-window 1))

(defvar lox-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-r") 'lox-run)
    map)
  "Keymap for Lox mode.")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.lox\\'" . lox-mode))

;; Derive the mode from c-mode for automatic syntax highlighting and
;; indentation. Once a custom formatter is written for this mode, this
;; can probably derive from prog-mode instead.

;;;###autoload
(define-derived-mode lox-mode c-mode "Lox"
  "A major mode for the Lox programming language."
  :group 'lox-mode
  (setq-local comment-start "// ")
  (setq-local comment-end "")
  (use-local-map lox-mode-map))

(provide 'lox-mode)

;;; lox-mode.el ends here
