;; this is to setup the python mode
; add the load path of python-mode
(setq py-install-directory "~/emacs-3rdParty/python-mode.el-6.2.0")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

; why is this useful
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'python-mode)
(add-to-list 'auto-mode-alist '("\.py\'" . python-mode))

; jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

; (require 'python)
; (when (executable-find "ipython")
;   (setq python-shell-interpreter "ipython")
;   (setq python-shell-interpreter-args "--pylab")
;  )

(provide 'my-setup-python-mode)
