(package-initialize)

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; CS61B-software path.
(setq SOFTWARE "~/.emacs.d/cs61b.el")
(load-file SOFTWARE)

(add-to-list 'load-path "~/.emacs.d/plugins")

;; Custom key bindings and settings
(global-set-key "\C-xp" (lambda () 
                          (interactive)
                          (other-window -1)))
(global-set-key "\M-;" 'comment-dwim-2)
(put 'narrow-to-region 'disabled nil)
(require 'flex-mode)
(add-to-list 'auto-mode-alist '("\\.l\\'" . flex-mode))
(put 'downcase-region 'disabled nil)
(global-auto-complete-mode)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("725a0ac226fc6a7372074c8924c18394448bb011916c05a87518ad4563738668" default)))
 '(gotham-tty-256-colors t)
 '(package-selected-packages
   (quote
    (zweilight-theme ac-etags auto-complete comment-dwim-2 poker gnugo chess web-mode go-mode gotham-theme golint fireplace abyss-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
