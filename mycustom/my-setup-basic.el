;; just the basic setup
;; auto-complete with install cpplint
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  ;(add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include")
)

; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; Fix iedit bug in Mac
(require 'iedit)
(define-key global-map (kbd "C-c ;") 'iedit-mode)

; start flymake-google-cpplint-load
; let's define a function for flymake initialization
; to install cpplint call sudo pip install cpplint.
; then find the cpplint and put it hear. common error flymake-google-cpplint
; not installed
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables '(flymake-google-cpplint-command
			 "/anaconda/bin/cpplint" ))
  (flymake-google-cpplint-load)
)
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)


; turn on Semantic
(semantic-mode 1)
; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
; turn on ede mode
(global-ede-mode 1)
;; create a project for our program.

; you can use system-include-path for setting up the system header file locations.
; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)

(provide 'my-setup-basic)
