;; Give me back my menu and scroll bar....
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 1))
(when window-system
  (switch-fullscreen)
  )

