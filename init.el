;;; init.el --- Initialize emacs
;;; Commentary:
;;; The main initialization file, most is deferred to specific setup-..

;;; Code:
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(setq user-lisp-dir
      (expand-file-name "lisp" user-emacs-directory))
	  
;; Add the predictive path early
(add-to-list 'load-path (expand-file-name "predictive" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-lisp-dir)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-lisp-dir))
(load custom-file)

;; Set up appearance early
(require 'appearance)

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(exec-path-from-shell
     magit
     paredit                            ; for lisp
     move-text
     gist
     htmlize
     visual-regexp
     flycheck                           ; make on the fly
     flx                                ; fuzzy matching
     flx-ido                            ; fuzzy matchin in ido
     css-eldoc
     yasnippet                          ; snippets
     smartparens                        ; parenthesis around regions
     ido-vertical-mode                  ; shows ido options in a vertical list
     ido-at-point
     simple-httpd                       ; webserver
     guide-key                          ; overview of key chords for C x r
     nodejs-repl
     restclient
     highlight-escape-sequences         ; highlights escape in java and ruby
     whitespace-cleanup-mode
     elisp-slime-nav
     git-commit-mode
     gitconfig-mode
     gitignore-mode
     clojure-mode
     groovy-mode
     prodigy
     cider
     magit-svn
     god-mode                           ; emacs like
     ess                                ; for R
     r-autoyas                          ; r extra
     auctex                             ; latex
     epc                                ; communicating with jedi
     rainbow-mode                       ; for css colors
     ein                                ; ipython notebook
     virtualenv                         ; python virtual envs
     jedi                               ; auto complete in emacs
     cython-mode                        ; cython
     switch-window                      ; window suggestion
     esqlite                            ; sqlite
     zenburn-theme                      ; theme
     solarized-theme                    ; theme
     w3m                                ; browse
     coffee-mode                        ; coffee script
     achievements                       ; monsterstroke....
     ac-etags                           ; autocomplete tags
     mmm-mako                           ; Mako templates
     rvm                                ; Default ruby
     fortpy                             ; fortran auto complete
     latex-preview-pane                 ; preview latex
     erc-social-graph                   ;; social graph of irc
     glsl-mode                          ; shaders
     )))



;; Evaluate later
;; (cons 'elnode marmalade)
;; (cons 'abl-mode melpa)



(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Setup environment variables from the user's shell.
(when is-mac
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

;; guide-key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x v" "C-x 8" "C-x +"))
(guide-key-mode 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'org '(require 'setup-org))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'grep '(require 'setup-rgrep))
(eval-after-load 'shell '(require 'setup-shell))
(eval-after-load 'python '(require 'setup-python))
(eval-after-load 'auto-complete '(require 'setup-autocomplete))
(eval-after-load 'god-mode '(require 'setup-god))
(eval-after-load 'predictive '(require 'setup-predictive))
(eval-after-load 'rainbow-delimiters '(require 'setup-rainbow-delimiters))
(eval-after-load 'ess-site '(require 'setup-ess))
(eval-after-load 'slime '(require 'setup-slime))
(eval-after-load 'helm'(require 'setup-helm))

;; Predictive mode

(add-to-list 'load-path (expand-file-name "predictive/html" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "predictive/latex" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "predictive/texinfo" user-emacs-directory))
(require 'predictive)

(require 'ess-site)
(require 'fold-this)
(require 'god-mode)
(require 'auto-complete)
(require 'rainbow-delimiters)
(require 'slime)
(require 'helm)
(require 'keyfreq)
(keyfreq-mode 1)

(require 'achievements)
;; We're setting up fortran by hand
(require 'setup-fortran)
(require 'setup-latex)
(require 'setup-hippie)
(require 'setup-yasnippet)
(require 'setup-perspective)
(require 'setup-ffip)
(require 'setup-html-mode)
(require 'setup-paredit)

(require 'prodigy)
(global-set-key (kbd "C-x M-m") 'prodigy)

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          java-mode
          ruby-mode
          markdown-mode
          python-mode-hook
          f90-mode-hook
          ess-mode-hook
          ruby-mode
          groovy-mode)
  (add-hook it 'turn-on-smartparens-mode))

;; Language specific setup files
(eval-after-load 'js2-mode '(require 'setup-js2-mode))
(eval-after-load 'ruby-mode '(require 'setup-ruby-mode))
(eval-after-load 'clojure-mode '(require 'setup-clojure-mode))
(eval-after-load 'markdown-mode '(require 'setup-markdown-mode))

;; Load stuff on demand
(autoload 'skewer-start "setup-skewer" nil t)
(autoload 'skewer-demo "setup-skewer" nil t)
(autoload 'flycheck-mode "setup-flycheck" nil t)
(autoload 'auto-complete-mode "auto-complete" nil t)

;; Map files to modes
(require 'mode-mappings)

;; Highlight escape sequences
(require 'highlight-escape-sequences)
(hes-mode)
(put 'font-lock-regexp-grouping-backslash 'face-alias 'font-lock-builtin-face)

;; Visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'expand-region)
(require 'multiple-cursors)
(require 'delsel)
(require 'jump-char)
(require 'eproject)
(require 'wgrep)
(require 'smart-forward)
(require 'change-inner)
(require 'multifiles)



;; Fill column indicator
(require 'fill-column-indicator)
(setq fci-rule-color "#111122")

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

;; Setup key bindings
(require 'key-bindings)

;; Misc
(require 'project-archetypes)
(require 'my-misc)
(when is-mac (require 'mac))


;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

;; Email, baby
(require 'setup-mu4e)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Run at full power please
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Conclude init by setting up specifics for the current user
(when (file-exists-p user-settings-dir)
  (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))
