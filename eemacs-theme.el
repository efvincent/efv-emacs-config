;;; eemacs-theme.el --- eemacs
;;; Version: 1.0
;;; Commentary:
;;; A theme called eemacs
;;; Code:

(deftheme eemacs "Eric's Emacs Theme")
  (custom-theme-set-faces 'eemacs
   '(default ((t (:foreground "#fdf4c1" :background "#282828" ))))
   '(cursor ((t (:background "#ffffff" ))))
   '(fringe ((t (:background "#2e5650" ))))
   '(mode-line ((t (:foreground "#2c2c60" :background "#9de3d7" ))))
   '(region ((t (:background "#42726a" ))))
   '(secondary-selection ((t (:background "#31524d" ))))
   '(font-lock-builtin-face ((t (:foreground "#f4de39" ))))
   '(font-lock-comment-face ((t (:foreground "#58a96c" ))))
   '(font-lock-function-name-face ((t (:foreground "#f9f9f9" ))))
   '(font-lock-keyword-face ((t (:foreground "#34fbcf" ))))
   '(font-lock-string-face ((t (:foreground "#ff9e7c" ))))
   '(font-lock-type-face ((t (:foreground "#f7c5d2" ))))
   '(font-lock-constant-face ((t (:foreground "#b0bbc3" ))))
   '(font-lock-variable-name-face ((t (:foreground "#83a598" ))))
   '(minibuffer-prompt ((t (:foreground "#fdffb2" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
   )

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'eemacs)

;;; eemacs-theme.el ends here

