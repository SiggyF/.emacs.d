(require 'slime)


;;; Prepare link creation
(setq slime-filename (expand-file-name "node_modules/swank-js/slime-js.el" "~"))
(setq slime-linkname (expand-file-name "slime/contrib/slime-js.el" site-lisp-dir))
;;; Create a symbolic link if needed
(when
    (and (file-exists-p slime-filename) (not (file-exists-p slime-linkname)))
  ;; Only setup slime if both exist
  (make-symbolic-link slime-filename slime-linkname)
  )
(when
    (file-exists-p slime-linkname)
  (slime-setup '(slime-js ))
  )

(slime-setup '(slime-editing-commands))
(provide 'setup-slime)
