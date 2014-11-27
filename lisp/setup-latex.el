
(add-hook 'TeX-mode-hook
          (lambda ()
            (visual-line-mode)
            (flyspell-mode)
            )
)
(provide 'setup-latex)

