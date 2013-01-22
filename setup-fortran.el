;; These are also fortran files
(setq auto-mode-alist
      (cons '("\\.F90" . f90-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.ftn" . f90-mode) auto-mode-alist))


;; Show some punch card stuff
;; (require 'whitespace)
;; (setq whitespace-style '(face empty tabs lines-tail trailing))
;; (global-whitespace-mode t)
;; (add-hook 'f90-mode-hook (lambda () (interactive) (column-marker-1 80)))
;; (add-hook 'fortran-mode-hook (lambda () (interactive) (column-marker-1 80)))
;; (add-hook 'f90-mode-hook (lambda () (interactive) (column-marker-2 132)))
;; (add-hook 'fortran-mode-hook (lambda () (interactive) (column-marker-2 132)))

;; (add-hook 'f90-mode-hook (lambda () (interactive) (column-marker-1 80)))
(provide 'setup-fortran)
