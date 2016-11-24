;; hide-show the blocks
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key (kbd "C-h <right>") 'hs-show-block)
    (local-set-key (kbd "C-h <left>")  'hs-hide-block)
    (local-set-key (kbd "C-h <up>")    'hs-hide-all)
    (local-set-key (kbd "C-h <down>")  'hs-show-all)
    (hs-minor-mode t)))

(provide 'my-setup-new)
