(package-initialize)

;; NOTE when configuring on a new machine must manually execute
;; (package-refresh-contents)
;; (package-install-selected-packages)

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t)
  (add-to-list
   'package-archives
   '("org" . "http://orgmode.org/elpa/")
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
    ("dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "04589c18c2087cd6f12c01807eed0bdaa63983787025c209b89c779c61c3a4c4" "e9740103f6ae2cbc97fef889b85b1c51b4d4a2d95c2b398b57a1842d14d96304" "725a0ac226fc6a7372074c8924c18394448bb011916c05a87518ad4563738668" default)))
 '(fci-rule-color "#4c406d")
 '(gotham-tty-256-colors t)
 '(inhibit-startup-screen t)
 '(nrepl-message-colors
   (quote
    ("#ee11dd" "#8584ae" "#b4f5fe" "#4c406d" "#ffe000" "#ffa500" "#ffa500" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (ibuffer-tramp pbcopy vlf org magit chess ace-jump-mode ace-window zone-sl cherry-blossom-theme ac-etags auto-complete comment-dwim-2 web-mode go-mode gotham-theme golint fireplace)))
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

;; Settings for installed packages.
;; Org mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; iBuffer customizations
(global-set-key (kbd "C-x C-b") 'ibuffer)
(require 'ibuf-ext)
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-tramp-set-filter-groups-by-tramp-connection)
            (ibuffer-do-sort-by-alphabetic)))
(add-to-list 'ibuffer-never-show-predicates "^\\*[^s]")
(add-to-list 'ibuffer-never-show-predicates "^\\*scratch")

;; Ace Window/Jump
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(global-set-key "\M-;" 'comment-dwim-2)
(global-set-key (kbd "C-x g") 'magit-status)
(require 'vlf-setup)
(require 'pbcopy)
(turn-on-pbcopy)

;;
;; Custom key bindings and settings
;;

(global-set-key "\eg" 'goto-line)
(global-set-key "\eq" 'query-replace)
(global-set-key "\eQ" 'query-replace-regexp)
(global-set-key "\^xm" 'compile) ; replace compose-mail with compile
(global-set-key "\^co" 'occur)

(delete-selection-mode)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(global-auto-complete-mode)
(load-theme 'cherry-blossom t)
(show-paren-mode)
(require 'zone)

;; hs-minor-mode
(defun hs-toggle-fold ()
  "Go to end of line before toggling hs hiding."
  (interactive)
  (save-excursion
    (end-of-line)
    (hs-toggle-hiding)))

(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-c TAB") 'hs-toggle-fold)

;; Load local init if exists.
(load "~/.emacs.d/local" t)
