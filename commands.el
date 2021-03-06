
;;; Code:
;; Hotkey rebinds
(global-set-key (kbd "M-1") 'find-file)
(global-set-key (kbd "M-2") 'switch-to-buffer)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "M-q") 'back-to-indentation) 
(global-set-key (kbd "M-e") 'move-end-of-line)
(global-set-key (kbd "C-f") 'kill-whole-line)
(global-set-key (kbd "M-f") 'kill-word)
(global-set-key (kbd "M-o") 'View-scroll-half-page-forward) 
(global-set-key (kbd "M-i") 'View-scroll-half-page-backward)   
;;(global-set-key (kbd "M-4") 'delete-other-windows)
(global-set-key (kbd "M-~") 'kill-buffer-and-window)
(global-set-key (kbd "M-3") 'kill-buffer)
(global-set-key (kbd "M-w") 'previous-line)
(global-set-key (kbd "M-s") 'next-line)
(global-set-key (kbd "M-d") 'forward-word)
(global-set-key (kbd "C-d") 'forward-char)
(global-set-key (kbd "M-a") 'backward-word)
(global-set-key (kbd "C-c v") 'erase-buffer)
(global-set-key (kbd "C-x f") 'set-mark-command)


(provide 'emacs-commands)
;;; emacs-commands ends here

