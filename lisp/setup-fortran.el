(require 'whitespace)
(add-hook 'f90-mode-hook
          (lambda ()
            (message "f90 mode hook")
            (fci-mode 1)
            (setq f90-mode t)
            (setq fci-column 70)
            (whitespace-mode 1)
            (flycheck-mode 1)
            (setq flycheck-gfortran-language-standard "f2008")
            )
          )
(provide 'setup-fortran)
