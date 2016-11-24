;; ======================================================================
;; add cclookup to your loadpath, ex) ~/.emacs.d/cclookup
(setq cclookup-dir ".~/.emacs.d/emacs-3rdParty/cclookup")
(add-to-list 'load-path cclookup-dir)

(require 'cclookup)
;; load cclookup when compile time
;(eval-when-compile (require 'cclookup))

;; set executable file and db file
(setq cclookup-program (concat cclookup-dir "/cclookup.py"))
(setq cclookup-db-file (concat cclookup-dir "/cclookup.db"))

;; to speedup, just load it on demand
(autoload 'cclookup-lookup "cclookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

(autoload 'cclookup-update "cclookup"
  "Run cclookup-update and create the database at `cclookup-db-file'." t)
;;----------------------------------------------------------------------


(require 'anything)
(require 'anything-config)
(global-set-key (kbd "C-c i")  ;; i -> info
  (lambda () (interactive)
  (anything
   :prompt "Info about: "
   :candidate-number-limit 100
   :sources
      '(anything-c-source-man-pages
        anything-c-source-boost-html))))

(provide 'my-setup-cclookup)
