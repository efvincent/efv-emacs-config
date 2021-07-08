;; package management
;; ---------------------------------- 
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; simplify package management with the use-package package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; give doom themes a try
(unless (package-installed-p 'doom-themes)
  (package-refresh-contents)
  (package-install 'doom-themes))

;; Exract elisp from config.org and source from here
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;;;;;; above here doesn't move to config.org


;; all the stuff that was here is in the config.org file and is extracted above ^


;;;;;;;;; Below here doesn't go to config.org

;; Controlled by configuration - generated code
;;----------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("af61897863697976008645e485ac1a0b5ec0fdef264a1dbe39b335485a62b77e" default))
 '(package-selected-packages
   '(undo-fu yaml-mode powerline-evil smart-mode-line-powerline-theme smart-mode-line lsp-treemacs helm-lsp lsp-ui lsp-ui-menu lsp-ui-doc lsp-ui-peek lsp-ui-sideline flycheck helm evil diminish rainbow-delimiters hungry-delete switch-window rainbow-mode avy smex ido-vertical-mode exec-path-from-shell org-bullets beacon which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :family "FuraCode Nerd Font"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :extend t))))
 '(org-block-end-line ((t (:inherit org-meta-line :extend t)))))
