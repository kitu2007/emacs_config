(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)


(defalias 'yes-or-no-p 'y-or-n-p)

(defconst demo-packages
  '(;;anzu
    color-theme
    auto-complete
    auto-complete-c-headers
    auto-complete-clang
    ac-c-headers
    flymake-google-cpplint
    google-c-style
    company
    duplicate-thing
    ggtags
    helm
    helm-gtags
    helm-projectile
    helm-swoop
    function-args
    clean-aindent-mode
    comment-dwim-2
    dtrt-indent
    ws-butler
    iedit
    yasnippet
    smartparens
    projectile
    projectile-codesearch
    stickyfunc-enhance
    elscreen
    anything
    jedi-core
    jedi
    zenburn-theme
    sublime-themes
    ;;volatile-highlights
    ;;undo-tree
    ;;zygospore
    ))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package demo-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")

(add-to-list 'load-path "~/.emacs.d/mycustom")

; (require 'setup-helm)
; (require 'setup-helm-gtags)
;; (require 'setup-ggtags)
(require 'my-setup-keybindings)
(require 'my-setup-basic)
(require 'my-setup-indent)
(require 'my-setup-python-mode)
(require 'my-setup-miscellaneous)
(require 'my-setup-other-modes)
;(require 'my-setup-cedet)
(require 'my-setup-new)
;(require 'my-setup-cclookup)
;(require 'setup-editing)
;(windmove-default-keybindings)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

;(require 'hideshow)

(require 'color-theme)
(color-theme-initialize)
;;(color-theme-charcoal-black)
(require 'zenburn-theme)
;(color-theme-zenburn)
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'zenburn t)


(semantic-add-system-include "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include/c++/4.2.1" 'c++-mode)
;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)


(add-hook 'emacs-startup-hook
          (lambda () (delete-other-windows)) t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doxymacs-command-character "\\")
 '(doxymacs-doxygen-style "C++")
 '(flymake-google-cpplint-command "/anaconda/bin/cpplint")
 '(gud-pdb-command-name "/usr/bin/pdb"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/emacs-3rdParty/gud.el")
(require 'gud)

(custom-set-variables
 '(python-guess-indent nil)
 '(python-indent 2))

(add-hook 'python-mode-hook '(lambda ()
 (setq python-indent 2)))

;(setenv "PATH" "/usr/bin:/usr/bin:/bin:/some/other/dir")
(put 'narrow-to-region 'disabled nil)
