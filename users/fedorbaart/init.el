;; Give me back my menu and scroll bar....
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 1))

;; Mac specific options.
(when is-mac
  ;; Zoom in and enhance...
  (ns-toggle-fullscreen)

  ;; Set gls as default ls (for --dired)
  (setq ls-lisp-use-insert-directory-program t)
  (setq insert-directory-program "gls")
  )
