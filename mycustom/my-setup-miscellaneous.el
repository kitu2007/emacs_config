;; uniquify.el is a helper routine to help give buffer names a better unique name.
(when (load "uniquify" 'NOERROR)
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'forward)
  ;(setq uniquify-buffer-name-style 'post-forward)
)

; (color-theme-robin-hood)
(put 'dired-find-alternate-file 'disabled nil)

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )


(provide 'my-setup-miscellaneous)
