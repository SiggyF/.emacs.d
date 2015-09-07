

;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)	

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (visual-line-mode)
            (flyspell-mode)
            (LaTeX-math-mode)
            (turn-on-reftex)
            )
          )

(add-hook 'TeX-mode-hook
          (lambda ()
            (visual-line-mode)
            (flyspell-mode)
            )
          )

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq reftex-plug-into-AUCTeX t)


(provide 'setup-latex)

