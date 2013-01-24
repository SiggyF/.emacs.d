
;; Use python
;; (require 'python)

;; Use 4 tabs.
(setq default-tab-width 4)
;; Decorate away
(setq font-lock-maximum-decoration t)
;; We use python
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("ipython" . python-mode))


;; (setq python-shell nil)
;; (package-require 'virtualenv)
;; (require 'virtualenv)
;; (setq virtualenv-workon-starts-python nil)



;; (setq
;;   python-shell-interpreter "ipython"
;;   python-shell-interpreter-args ""
;;   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;   python-shell-completion-setup-code
;;     "from IPython.core.completerlib import module_completion"
;;   python-shell-completion-module-string-code
;;     "';'.join(module_completion('''%s'''))\n"
;;   python-shell-completion-string-code
;;     "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
;;   python-indent-offset 4)

(defun workon (&optional env)
  (interactive "P")
  (let ((env
         (cond
          ((stringp env) env)
          (t (read-from-minibuffer "Virtualenv to activate: "))))
        (full-env (concat "~/.virtualenvs/" env)))
    (setq python-shell-virtualenv-path full-env)))

;; (package-require 'pyflakes)
;; (package-require 'nose)
;; (require 'nose)

;; (setq nose-project-names '("nosetests"))

;; (defun nose-get-directory ()
;;   "Get either the local directory or the virtualenv directory"
;;   (if python-shell-virtualenv-path
;;       (concat python-shell-virtualenv-path "/bin/")
;;     (file-name-directory buffer-file-name)))

;; (defun nose-find-test-runner-names (runner)
;;   "find eggs/bin/test in a parent dir of current buffer's file"
;;   (nose-find-test-runner-in-dir-named (expand-file-name (nose-get-directory)) runner))


;; (add-hook 'python-mode-hook
;;           #'(lambda ()
;;             (local-set-key "\C-ca" 'nosetests-all)
;;             (local-set-key "\C-cm" 'nosetests-module)
;;             (local-set-key "\C-c." 'nosetests-one)
;;             (local-set-key "\C-cpa" 'nosetests-pdb-all)
;;             (local-set-key "\C-cpm" 'nosetests-pdb-module)
;;             (local-set-key "\C-cp." 'nosetests-pdb-one)))

;; (provide 'config-python)

;; ;; Pymacs, ropemacs
;; ;; (autoload 'pymacs-apply "pymacs")
;; ;; (autoload 'pymacs-call "pymacs")
;; ;; (autoload 'pymacs-eval "pymacs" nil t)
;; ;; (autoload 'pymacs-exec "pymacs" nil t)
;; ;; (autoload 'pymacs-load "pymacs" nil t)
;; ;; (autoload 'pymacs-autoload "pymacs")
;; ;; (require 'pymacs)
;; ;; (pymacs-load "ropemacs" "rope-")
;; ;; (setq ropemacs-enable-autoimport t)

;; ;; Python mode
;; ;; (require 'python-mode)
;; ;; (setq py-start-run-py-shell nil)
;; ;; (setq py-load-pymacs-p nil)
;; ;; (setq py-python-command-args '("--colors=linux"))
;; ;; (setq py-shell-name "ipython")
;; ;; (setq py-python-command "python")
;; ;; (autoload 'python-mode "python-mode" "Python editing mode." t)
;; ;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; ;; IPython
;; ;; (defvar py-mode-map python-mode-map) ; fuck python-mode's renaming
;; ;; (add-to-list 'load-path "~/.emacs.d/plugins/")
;; ;; (require 'ipython)

;; ;; (require 'anything-ipython)
;; ;; (when (require 'anything-show-completion nil t)
;; ;;   (use-anything-show-completion 'anything-ipython-complete
;; ;;                                 '(length initial-pattern)))

;; ;; (require 'ac-python)
;; ;; ;; Python complete (must with python-mode.el from the pycomplete website)
;; ;; (add-to-list 'load-path "~/.emacs.d/plugins")
;; ;; (require 'pycomplete)

;; ;; Option 1 http://chrispoole.com/project/ac-python/

;; ;; Option 2 seems fine
;; ;; (ac-ropemacs-initialize)
;; ;; (add-hook 'python-mode-hook
;; ;;           (lambda ()
;; ;;             (add-to-list 'ac-sources 'ac-source-ropemacs)))

;; ;; Option 3
;; ;; (require 'pysmell)
;; ;; (add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))

(provide 'setup-python)
