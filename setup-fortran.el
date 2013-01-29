

(require 'whitespace)
(add-hook 'f90-mode-hook
          (lambda ()
            (fci-mode 1)
            (whitespace-mode 1)
            )
          )

(provide 'setup-fortran)
