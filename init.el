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
 '(custom-enabled-themes '(nimbus))
 '(custom-safe-themes
   '("48c02faac1209d3e960e15fa252cc0869aab5f96e6533bcf4619d2e88b74d7ac" "" default))
 '(org-src-window-setup 'current-window)
 '(package-selected-packages
   '(nimbus-theme helm evil diminish rainbow-delimiters zenburn-theme hungry-delete switch-window rainbow-mode avy smex ido-vertical-mode exec-path-from-shell org-bullets beacon which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :family "FuraCode Nerd Font"))))
 '(org-block-begin-line ((t (:inherit org-meta-line :extend t))))
 '(org-block-end-line ((t (:inherit org-meta-line :extend t)))))
