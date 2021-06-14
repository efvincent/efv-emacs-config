(setq org-src-window-setup 'current-window)

(require 'org-tempo)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(add-hook 'org-mode-hook (lambda () (visual-line-mode t)))

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(global-set-key (kbd "C-x b") 'ibuffer)

(setq ibuffer-expert t)

(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(global-set-key (kbd "<s-return>") 'ansi-term)

(exec-path-from-shell-initialize)

(use-package which-key
    :ensure t
    :init (which-key-mode))

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package beacon
    :ensure t
    :init (beacon-mode 1))

(global-hl-line-mode t)

(setq scroll-conservatively 100)

(cua-mode 1)

(global-prettify-symbols-mode t)

(use-package rainbow-mode
  :ensure t
  :init (rainbow-mode 1))

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(setq ring-bell-function 'ignore)

(setq make-backup-filese nil)
(setq auto-save-default nil)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(global-subword-mode 1)

(use-package 'sudo-edit
  :ensure t
  :bind ("s-e") . sudo-edit)

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(defun split-and-follow-h ()
  ;; Perform the split horizontally and put the cursor in the new window
  ;; which will be below the current window
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-h)

(defun split-and-follow-v ()
  ;; Perform the split vertically and put the cursor in the new widnow
  ;; which will be to the right of the current window
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-v)

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "h" "j" "k" "l"))
  :bind
  ([remap other-window] . switch-window))

(setq electric-pair-pairs '(
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\])
			    )
      )
(electric-pair-mode t)

(defun kill-whole-word ()
  (interactive)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c w w") 'kill-whole-word)
