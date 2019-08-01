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

;; ExuberantCTags path.
(setq path-to-etags
      (substring
       (shell-command-to-string "which etags") 0 -1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1b1a24" "#ee11dd" "#4c406d" "#b4f5fe" "#8CD0D3" "#DC8CC3" "#ffa500" "#8584ae"])
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("04589c18c2087cd6f12c01807eed0bdaa63983787025c209b89c779c61c3a4c4" "e9740103f6ae2cbc97fef889b85b1c51b4d4a2d95c2b398b57a1842d14d96304" "725a0ac226fc6a7372074c8924c18394448bb011916c05a87518ad4563738668" default)))
 '(fci-rule-color "#4c406d")
 '(gotham-tty-256-colors t)
 '(nrepl-message-colors
   (quote
    ("#ee11dd" "#8584ae" "#b4f5fe" "#4c406d" "#ffe000" "#ffa500" "#ffa500" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (ace-window zone-rainbow zone-sl roguel-ike cherry-blossom-theme ac-etags auto-complete comment-dwim-2 web-mode go-mode gotham-theme golint fireplace)))
 '(vc-annotate-background "#0bafed")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#ee11dd")
     (60 . "#8584ae")
     (80 . "#ffe000")
     (100 . "#efef80")
     (120 . "#b4f5fe")
     (140 . "#4c406d")
     (160 . "#4c406d")
     (180 . "#1b1a24")
     (200 . "#4c406d")
     (220 . "#65ba08")
     (240 . "#ffe000")
     (260 . "#ffa500")
     (280 . "#6CA0A3")
     (300 . "#0bafed")
     (320 . "#8CD0D3")
     (340 . "#ffa500")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Custom key bindings and settings
(global-set-key "\C-xp" (lambda ()
                          (interactive)
                          (other-window -1)))
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key "\M-;" 'comment-dwim-2)
(put 'narrow-to-region 'disabled nil)
(require 'flex-mode)
(add-to-list 'auto-mode-alist '("\\.l\\'" . flex-mode))
(put 'downcase-region 'disabled nil)
(global-auto-complete-mode)
(load-theme 'cherry-blossom t)
(show-paren-mode)
(require 'zone)
(zone-when-idle 120)
