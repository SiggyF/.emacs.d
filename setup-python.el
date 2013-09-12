;;; setup-python.el --- Setup stuff for python files
;;; Commentary:

;;; We want to get
;;; A python mode
;;; - use default version from >=24
;;; Syntax checking
;;; - use flycheck
;;; Parenthesis and quote helpers
;;; - smartparens, setup in init for all modes
;;; Whitespace
;;; - whitespace-mode
;;; IPython Notebook
;;; - start with ein:notebooklist-open
;; elpy?

;;; Code:


;;;  Enable flycheck
(add-hook 'python-mode-hook 'flycheck-mode)

;;; Parenthesis


;;; Whitespace
(add-hook 'python-mode-hook 'whitespace-mode)

(defun ipython ()
  "start ipython shell"
  (interactive)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  (python-shell-switch-to-shell))



   ;; Use 4 tabs.



(setq tab-width 4)

   ;; jedi
   ;; auto-complete




(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)


(provide 'setup-python)
;;; setup-python.el ends here
