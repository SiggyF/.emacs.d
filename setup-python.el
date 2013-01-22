;; Use 4 tabs.
(setq default-tab-width 4)
;; Decorate away
(setq font-lock-maximum-decoration t)
;; We use python
(setq py-shell-name "python")


;; Pymacs, ropemacs
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; Python mode
;; (require 'python-mode)
;; (setq py-start-run-py-shell nil)
;; (setq py-load-pymacs-p nil)
;; (setq py-python-command-args '("--colors=linux"))
;; (setq py-shell-name "ipython")
;; (setq py-python-command "python")
;; (autoload 'python-mode "python-mode" "Python editing mode." t)
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; IPython
;; (defvar py-mode-map python-mode-map) ; fuck python-mode's renaming
;; (add-to-list 'load-path "~/.emacs.d/plugins/")
;; (require 'ipython)

;; (require 'anything-ipython)
;; (when (require 'anything-show-completion nil t)
;;   (use-anything-show-completion 'anything-ipython-complete
;;                                 '(length initial-pattern)))

;; (require 'ac-python)
;; ;; Python complete (must with python-mode.el from the pycomplete website)
;; (add-to-list 'load-path "~/.emacs.d/plugins")
;; (require 'pycomplete)

;; Option 1 http://chrispoole.com/project/ac-python/

;; Option 2 seems fine
;; (ac-ropemacs-initialize)
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (add-to-list 'ac-sources 'ac-source-ropemacs)))

;; Option 3
;; (require 'pysmell)
;; (add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))

(provide 'setup-python)
