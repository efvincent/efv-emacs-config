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

;; the spacemacs theme which is a sane default until I switch it up 
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacepacs-theme))

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
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages
   '(hungry-delete switch-window rainbow-mode avy smex ido-vertical-mode exec-path-from-shell org-bullets beacon spacemacs-theme which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :family "FuraCode Nerd Font")))))
