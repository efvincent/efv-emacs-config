;;; package --- summary
;;
;; primary configuration file
;; Eric Vincent
;; July 7, 2021
;;
;;; Commentary:
;;
;; This is a from scratch custom configuration file I've written after
;; having lived for a while with one cobbled together from googling
;; around and watching yt vids.
;;
;;; Code:

;;-------------------------
;; Evil mode
;;-------------------------

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(setq evil-split-window-below t)
(setq evil-split-window-right t)

;;-------------------------
;; Window
;;-------------------------

;; Beacon to make the line with the cursor flash when you switch to that window
;; this can get a bit janky under some conditions if this plugin thinks the window
;; is losing/getting the focus - the line can flash a bit and slow things down

(use-package beacon
  :ensure t
  :init (beacon-mode 0))

;; Use emacs function to highlight the current line. To enable, set this to true (t)

(global-hl-line-mode -1)

;; Split and follow - when we split a window, have the focus follow the split
;; to the new window. Otherwise, you have to explicitly change focus over.

(defun split-and-follow-h ()
  "Perform split horizontally and put the cursor in the new window."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun split-and-follow-v ()
  "Perform vertical split and have the focus follow."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

;;-------------------------
;; Buffers
;;-------------------------

(defun kill-current-buffer ()
  "Always kill the current buffer."
  (interactive)
  (kill-buffer (current-buffer)))
  
;;-------------------------
;; Commands
;;-------------------------

;; Auto completion - we're using company (as opposed to autocomplete)
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; confirmation - allow y/n where it usually would require yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; which key is auto suggest for commands
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; make ESC act like C-g
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))


;;-------------------------
;; Org Mode!
;;-------------------------

;; When editing a source section, zoom it into current window
(setq org-src-window-setup 'current-window)

;; Change heading asterisks into bullet symbols. This can get annoying
;; so you may want to disable this. TODO: figure out cannonical way
;; to set feature flags
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

;; Use text wrapping in org mode
;; turn off electric (automatic) indenting which is super annoying
(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode t)
			   (org-indent-mode t)
			   (org-bullets-mode)
			   (electic-local-indent-mode 0)))

;; Allow leading starts to remain (when not using bullets)
(setq org-hide-leading-stars nil)

;;-------------------------
;; Mode line
;;-------------------------

;; Show both line and columns min mode like
(line-number-mode 1)
(column-number-mode 1)

;; hide unneeded minor modes in the mode line
(use-package diminish
  :ensure t
  :init
  (diminish 'hungry-delete-mode)
  (diminish 'beacon-mode)
  (diminish 'whick-key-mode)
  (diminish 'rainbow-mode)
  (diminish 'visual-line-mode)
  (diminish 'subword-mode))

;; spaceline package for evil friendly mode line
(use-package spaceline
  :ensure t
  :config
 (use-package spaceline-config
    :config
    (spaceline-toggle-minor-modes-off)
    (spaceline-toggle-buffer-encoding-off)
    (spaceline-toggle-buffer-encoding-abbrev-off)
    (setq powerline-default-separator 'rounded)
    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
    (spaceline-define-segment line-column
      "The current line and column numbers."
      "(%l:%c)")
    (spaceline-define-segment time
      "The current time."
      (format-time-string "%H:%M"))
    (spaceline-define-segment date
      "The current date."
      (format-time-string "%h %d"))
    (spaceline-toggle-time-on)
    (spaceline-emacs-theme)
    (setq evil-normal-state-tag " NORMAL ")
    (setq evil-insert-state-tag " INSERT ")
    (setq evil-visual-state-tag " VISUAL ")
    )
 )

;; clock
(display-time-mode)

;;-------------------------
;; Movement
;;-------------------------

;; Scrolling content - when scrolling off the top/bottom with arrows or C-n / C-p,
;; don't make big jumps
(setq scroll-conservatively 100)

;;-------------------------
;; Editing
;;-------------------------

;; to get "normal" copy/paste keys, could use cua-mode. Going to skip it for now
;; and use the cannonical keys
;; (cua-mode 1)

;; undo-fu - smarter undo. Google it
(use-package undo-fu
  :ensure t
  :init (setq evil-undo-system 'undo-fu))

;; fancy substitution - ex: the lambda symbol substitution
(global-prettify-symbols-mode t)

;; show actual colors in code - where ever there are color codes, show the actual colors
(use-package rainbow-mode
  :ensure t
  :init (rainbow-mode 1))

;; rainbow delimiters. You need this.
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;;-------------------------
;; Helm configuration
;;-------------------------

(use-package helm
  :init
    (require 'helm-config)
  :config
    (helm-mode 1)                                                   ;; Most of Emacs prompts become helm-enabled
    (helm-autoresize-mode 1)                                        ;; Helm resizes according to the number of candidates
    (global-set-key (kbd "C-x b")   'helm-buffers-list)             ;; List buffers ( Emacs way )
    (define-key evil-ex-map "b"     'helm-buffers-list)             ;; List buffers ( Vim way )
    (global-set-key (kbd "C-x r b") 'helm-bookmarks)                ;; Bookmarks menu
    (global-set-key (kbd "C-x C-f") 'helm-find-files)               ;; Finding files with Helm
    (global-set-key (kbd "M-c")     'helm-calcul-expression)        ;; Use Helm for calculations
    (global-set-key (kbd "C-s")     'helm-occur)                    ;; Replaces the default isearch keybinding
    (global-set-key (kbd "C-h a")   'helm-apropos)                  ;; Helmized apropos interface
    (global-set-key (kbd "M-x")     'helm-M-x)                      ;; Improved M-x menu
    (global-set-key (kbd "M-y")     'helm-show-kill-ring)           ;; Show kill ring, pick something to paste
  :ensure t)

;; when arrowing in helm choices, wrap around bottom and top
(setq helm-move-to-line-cycle-in-source t)

;; helm use minibuffer; less disruptive
(setq helm-split-window-inside-p t)

;;-------------------------
;; FlyCheck
;;-------------------------

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


;;-------------------------
;; Projectile
;;-------------------------

(use-package projectile
  :ensure t
  :init (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))

;;-------------------------
;; Yaml
;;-------------------------

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-hook 'yaml-mode-hook
	    '(lambda ()
	       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
  )

;;-------------------------
;; Language Server
;;-------------------------

;; Base LSP for emacs
(require 'lsp)

(use-package yasnippet
  :ensure t)

;; dependency lsp-ui was giving me trouble... pre-load it to be sure
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; See haskell specifics here: https://emacs-lsp.github.io/lsp-haskell
;; also useful: http://abailly.github.io/posts/a-modern-haskell-env.html

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (
    (haskell-mode . lsp)
    (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; if you are helm user
(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

;;-------------------------
;; Haskell
;;-------------------------

;; Assure that haskell tools are on the path
(setq exec-path
      (reverse
       (append
        (reverse exec-path)
        (list (concat (getenv "HOME") "/.ghcup/bin")  "/usr/local/bin" ))))

(use-package lsp-haskell
  :ensure t
  :config
  (setq lsp-haskell-server-path "haskell-language-server-8.10.4")
  (setq lsp-haskell-server-args ())
  ;; comment/uncomment this line to see interactions between lsp client/server
  (setq lsp-log-io t))

;; Hooks so haskell and literate haskell major modes trigger LSP setup
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

(setq lsp-ui-doc-max-height 50)
(setq lsp-ui-doc-show-with-mouse t)

;;-------------------------
;; Magit
;;-------------------------

(use-package magit
  :ensure t)

;;-------------------------
;; Misc
;;-------------------------

;; kill the bell
(setq ring-bell-function 'ignore)

;; don't create junk files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; get rid of extra window chrome
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

;; electric parens
(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    )
      )
(electric-pair-mode t)

;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 10)))
  (setq dashboard-startup-banner "~/.emacs.d/images/Haskell-logo.png"))

;; relative line numbers everywhere
(menu-bar--display-line-numbers-mode-relative)
(global-display-line-numbers-mode t)

;; TODO: remember windows position

;; config file edit / reload
(defun edit-config-file ()
  "Load the configuration file."
  (interactive)
  (find-file "~/.emacs.d/config.el"))

(defun reload-config-file ()
  "Reload (execute) the configuration file."
  (interactive)
  (load "~/.emacs.d/config.el"))

;;-------------------------
;; My Bindings
;;-------------------------

;; load and save config file
(global-set-key (kbd "C-c e") 'edit-config-file)
(global-set-key (kbd "C-c r") 'reload-config-file)

;; kill the current buffer
(global-set-key (kbd "C-x k") 'kill-current-buffer)
  
;; window splits - bind to my own functions (see above)
(global-set-key (kbd "C-x 2") 'split-and-follow-h)
(global-set-key (kbd "C-x 3") 'split-and-follow-v)

;; switch windows
(global-set-key (kbd "C-`") 'other-window)


(provide 'config)

;;; config.el ends here
