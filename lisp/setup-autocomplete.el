(require 'auto-complete)
(ac-set-trigger-key "TAB")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)


(custom-set-variables
 '(ac-etags-requires 1))

(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))

(defun ac-etags-hook ()
  (add-to-list 'ac-sources 'ac-source-etags))

(add-hook 'f90-mode-hook 'ac-etags-hook)

(provide 'setup-autocomplete)
