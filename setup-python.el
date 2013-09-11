;;; setup-python.el --- Setup stuff for python files
;;; Commentary:

;;; We want to get
;;; A python mode
;;; - use default version from >=24
;;; Syntax checking
;;; - use flycheck
;;; Parenthesis and quote helpers
;;; - paredit is not suitable for python, try autopairs
;;; Whitespace

;;; Code:


;;;  Enable flycheck
(add-hook 'python-mode-hook 'flycheck-mode)

;;; Parenthesis
;; electric-pair
;; show-paren

;;; Whitespace
(add-hook 'python-mode-hook 'whitespace-mode)

;;; ein
;;; Not quite working yet

;; elpy?
;; yassnippets

;; Use 4 tabs.
(setq tab-width 4)

;; jedi
;; auto-complete

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)


(provide 'setup-python)
;;; setup-python.el ends here
