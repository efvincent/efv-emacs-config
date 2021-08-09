;; package management
;; --------------------------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; simplify package management with use-package package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; load main config from config.el
;; in this build, I'm not using an org mode based init
(load "~/.emacs.d/config.el")

;; below this point, emacs will control customized parameters

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("af61897863697976008645e485ac1a0b5ec0fdef264a1dbe39b335485a62b77e" default))
 '(evil-undo-system 'undo-fu)
 '(package-selected-packages
   '(lsp magit undo-fu yaml-mode powerline-evil smart-mode-line-powerline-theme smart-mode-line lsp-treemacs helm-lsp lsp-ui lsp-ui-menu lsp-ui-doc lsp-ui-peek lsp-ui-sideline flycheck helm evil diminish rainbow-delimiters hungry-delete switch-window rainbow-mode avy smex ido-vertical-mode exec-path-from-shell org-bullets beacon which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit default :extend t :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "ADBO" :family "FuraCode Nerd Font Mono"))) nil "Customized Font size, font face (FuraCode Nerd), and color (dark)"))
