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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#454545" "#d65946" "#6aaf50" "#baba36" "#598bc1" "#ab75c3" "#68a5e9" "#AAB0AB"])
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" "48c02faac1209d3e960e15fa252cc0869aab5f96e6533bcf4619d2e88b74d7ac" "" default))
 '(frame-brackground-mode 'dark)
 '(org-src-window-setup 'current-window)
 '(package-selected-packages
   '(spacemacs-theme yaml-mode spacemacs-config powerline-evil smart-mode-line-powerline-theme smart-mode-line gruber-darker-theme lsp-treemacs helm-lsp lsp-ui treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs lsp-ui-menu lsp-ui-doc lsp-ui-peek lsp-ui-sideline flycheck nimbus-theme helm evil diminish rainbow-delimiters zenburn-theme hungry-delete switch-window rainbow-mode avy smex ido-vertical-mode exec-path-from-shell org-bullets beacon which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :family "FuraCode Nerd Font"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :extend t))))
 '(org-block-end-line ((t (:inherit org-meta-line :extend t)))))
