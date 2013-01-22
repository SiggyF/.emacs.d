;; mac friendly font
(set-face-attribute 'default nil :font "Monaco-16")

;; keybinding to toggle full screen mode
(global-set-key (kbd "M-s-ƒ") 'ns-toggle-fullscreen)

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

(provide 'mac)
