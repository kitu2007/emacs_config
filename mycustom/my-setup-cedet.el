;; ------CEDET-----------

;;(load-file "~/.emacs.d/otherPackages/cedet-bzr/trunk/contrib/")

;(setq cedet-root-path (file-name-as-directory "~/.emacs.d/otherPackages/cedet-bzr/trunk/"))
;(load-file (concat cedet-root-path "cedet-devel-load.el"))
;(add-to-list 'load-path (concat cedet-root-path "contrib"))

(require 'cedet)

;; Semantic
;(semantic-load-enable-excessive-code-helpers)
;(global-semantic-idle-scheduler-mode)
;(global-semanticdb-minor-mode)
;(global-semantic-idle-summary-mode 1)
;(global-semantic-idle-completions-mode)
;(global-semantic-highlight-func-mode)
;(global-semantic-decoration-mode)
;(global-semantic-show-unmatched-syntax-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

;; semantic
(require 'cc-mode)
(require 'semantic)
(require 'semantic/ia)
(require 'stickyfunc-enhance)

;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

(semantic-add-system-include "/usr/include/boost" 'c++-mode)

;; Activate semantic
(semantic-mode 1)

;; load contrib library
;(require 'eassist)

;; customisation of modes
(defun kgarg/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  )
(add-hook 'c-mode-common-hook 'kgarg/cedet-hook)
(add-hook 'lisp-mode-hook 'kgarg/cedet-hook)
(add-hook 'scheme-mode-hook 'kgarg/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'kgarg/cedet-hook)
(add-hook 'erlang-mode-hook 'kgarg/cedet-hook)

(defun kgarg/c-mode-cedet-hook ()
  ;(local-set-key "\C-ct" 'eassist-switch-h-cpp)
  ;(local-set-key "\C-xt" 'eassist-switch-h-cpp)
  ;(local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'kgarg/c-mode-cedet-hook)

(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)

;(when (cedet-ectag-version-check t)
;  (semantic-load-enable-primary-ectags-support))

;; SRecode
(require 'srecode)
(global-srecode-minor-mode 1)

;; EDE
(require 'ede)
(global-ede-mode 1)
(ede-enable-generic-projects)

; (ede-cpp-root-project "NAME" :file "~/src/Makefile")

;; I think this may be giving issues
; function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
;(defun my:add-semantic-to-autocomplete()
;  (add-to-list 'ac-sources 'ac-source-semantic)
;)
;(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)


;; Semantic automatically find directory, where system include files are stored.
(require 'semantic/bovine/gcc)
;(require 'semantic/bovine/clang)

(provide 'my-setup-cedet)
