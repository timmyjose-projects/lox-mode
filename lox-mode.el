;;; lox-mode.el --- Major mode for the Lox programming language

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
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;  A major mode for the Lox programming language (http://craftinginterpreters.com/the-lox-language.html).

;;; Code:

(defgroup lox-mode nil
  "Lox mode configuration group."
  :link '(url-link "https://www.craftinginterpreters.com/the-lox-language.html")
  :group 'languages)

(defcustom lox-bin "lox"
  "Path to the Lox executable."
  :type 'string
  :safe #'stringp
  :group 'lox-mode)

;;;###autoload
(defun lox-compile-and-run-file ()
  "Run the currently loaded script."
  (interactive)
  (message "all done!"))

(defvar lox-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-c") 'lox-compile-and-run-file)
    map)
  "Keymap for Lox mode.")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.lox\\'" . lox-mode))

;;;###autoload
(define-derived-mode lox-mode java-mode "Lox"
  "A major mode for the Lox programming language."
  :group 'lox-mode
  (use-local-map lox-mode-map))

(provide 'lox-mode)

;;; lox-mode.el ends here
