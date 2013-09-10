;; Use python


;; python-mode
;; rainbow-mode, rainbow-delimiters-mode
;; flymake-mode (hooked up to flymake-pyflakes)
;; linum-on
;; pycheckers + pyflakes
;; rope
;; electric-pair
;; show-paren
;; ein
;; elpy?
;; yassnippets

;; Use 4 tabs.
(setq default-tab-width 4)

;; jedi
;; auto-complete

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(provide 'setup-python)
