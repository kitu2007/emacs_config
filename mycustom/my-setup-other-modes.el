;; set up the cuda and the cmake modes
; turn on syntax highlighting for cuda files
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

; turn on syntax highlighting for CMAKEfiles
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(autoload 'cmake-mode "~/.emacs.d/emacs-3rdParty/cmake-mode.el" t)
(provide 'my-setup-other-modes)
