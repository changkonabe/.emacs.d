(package-initialize)

;; CS61B-software path.
(setq SOFTWARE "~/.emacs.d/cs61b.el")
(load-file SOFTWARE)

(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(require 'flex-mode)
(add-to-list 'auto-mode-alist '("\\.l\\'" . flex-mode))
(put 'downcase-region 'disabled nil)

;; Custom key bindings
(global-set-key "\C-xp" (lambda () 
                          (interactive)
                          (other-window -1)))
(put 'narrow-to-region 'disabled nil)

;; ExuberantCTags path.
(setq path-to-etags
      (substring
       (shell-command-to-string "which etags") 0 -1))

;; Function for creating ctags in Emacs.
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -R %s" path-to-etags (directory-file-name dir-name))))
