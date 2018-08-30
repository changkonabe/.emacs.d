(package-initialize)

;; CS61B-software path.
(setq SOFTWARE "~/eecs/cs61b/software/adm/cs61b.el")
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

;; Initialization stuff.
(setq c-default-style "stroustrup"
      c-basic-offset 4)

;; ExuberantCTags path.
(setq path-to-ctags "/usr/local/bin/ctags")

;; Function for creating ctags in Emacs.
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name))))
