

;;; Prepare link creation
(setq slime-filename (expand-file-name "node_modules/swank-js/slime-js.el" "~"))
(setq slime-linkname (expand-file-name "slime/contrib/slime-js.el" site-lisp-dir))
;;; Create a symbolic link if needed
(when
    (and (file-exists-p slime-filename) (not (file-exists-p slime-linkname)))
     (make-symbolic-link slime-filename slime-linkname)
  )

(require 'slime)
(slime-setup '(slime-js slime-editing-commands slime-js))
(provide 'setup-slime)
