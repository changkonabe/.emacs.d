; Some definitions for home use of Emacs.  To modify these definitions on your
; home system, define the file $HOME/.emacs.local.cs61b, which this file
; will include, if present, after all these definitions. Anything you do
; in .emacs.local.cs61b will override anything done here.

(setq load-path
      (append load-path
              (list (expand-file-name "~/.emacs.d/plugins"))))
(require 'gjdb)
(require 'cc-mode)
(require 'compile)

; Key definitions from lab
(global-set-key "\eW" 'kill-region)

; Undo some dangerous or annoying keys.

(global-unset-key "\^z")
;; (global-unset-key "\^xnn")  narrow-to-region
;; (global-unset-key "\^x\^l") downcase-region
;; (global-unset-key "\^x\^u") upcase-region
;; (global-unset-key "\^x\^v")

; Set up Java formatting as in lab: 4 space indentation quantum, no tabs
; inserted for indentation, indent @ annotations properly.
;(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(load "java-mode-indent-annotations")

(if (file-readable-p "~/.emacs.local.cs61b")
	(load-file "~/.emacs.local.cs61b"))
