;; Give me back my menu and scroll bar....
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 1))

;; Mac specific options.
(when is-mac
  ;; Zoom in and enhance... But not in the shell otherwise it breaks....
  (when window-system
    (osx-toggle-fullscreen)
    )

  ;; Set gls as default ls (for --dired)
  (setq ls-lisp-use-insert-directory-program t)
  (setq insert-directory-program "gls")

  (setq org-mobile-directory "~/Dropbox/org")
  (setq org-directory "~/Documents/checkouts/baart_f/documents/org")
  (setq org-mobile-inbox-for-pull "~/Dropbox/org/from-mobile.org")
)
