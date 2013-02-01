

(require 'whitespace)
(add-hook 'f90-mode-hook
          (lambda ()
            (fci-mode 1)
	    (setq f90-mode t)
            (setq fci-column 70)
            (whitespace-mode 1)
            )
          )

(provide 'setup-fortran)
