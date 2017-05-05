
;;; Code:
(setq *include "/cloud/classes/winter_2016/kernel_496/naut-bdwgc/include")
(setq *clang-wno '("-Wno-unused-function" "-Wno-incompatible-library-redeclaration"))
(setq *clang-include '("autoconf.h"))

;;(setq *clang-args '("-includeautoconf.h"))
(if (file-exists-p "/cloud/")
    (setq path-pref "/cloud/.pref/")
  (setq path-pref "~/.pref/"))


(defun load-packages ()
  (require 'package)
  (setq package-user-dir (concat path-pref "elpa24"))
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (package-initialize)
  
  (define-key dired-mode-map (kbd "w") 'dired-previous-line)
  (define-key dired-mode-map (kbd "s") 'dired-next-line)

  ;; flycheck
  (global-flycheck-mode)
  (setq flycheck-clang-args (concat "-isystem" *include))
  (setq flycheck-clang-include-path  *include)
  (setq flycheck-clang-includes *clang-include)
  (setq flycheck-clang-args *clang-wno)

  ;; company-mode (autocompletion-c/cxx)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-clang-arguments (mapcar (lambda (x) (concat "-include" x))
                                        *clang-include))
  (global-set-key (kbd "C-e") 'company-complete)

  ;; helm -> emacs qol auto completion features
  (require 'helm-config)
  (helm-mode 1)
  (semantic-mode 1)
  (global-semanticdb-minor-mode)
  (setq helm-semantic-fuzzy-match t)
  
  ;;(global-set-key (kbd "C-h") 'helm-command-prefix)
  (global-set-key (kbd "M-x") 'helm-M-x)
  ;;(global-set-key (kbd "M-1") 'helm-find-files)
  (global-set-key (kbd "M-2") 'helm-buffers-list)
  
  ;; projectile -> project management & helm integration
  ;;  commands (with helm-prjectile): 
  ;;   helm-projectile-switch-project
  ;;   helm-projectile-find-file
  ;;   helm-projectile-find-file-in-known-projects
  ;;   helm-projectile-find-file-dwim
  ;;   helm-projectile-find-dir
  ;;   helm-projectile-recentf
  ;;   helm-projectile-switch-to-buffer
  ;;   helm-projectile-grep (can be used for both grep or ack)
  ;;   helm-projectile-ag
  (projectile-mode)
  (require 'helm-projectile)
  (helm-projectile-on)
  ;;(global-set-key (kbd "C-c p g") 'helm-projectile-grep)
  (global-unset-key (kbd "C-p"))

  ;;(define-key projectile-mode-map (kbd "C-c p g") 'helm-projectile-grep)
  ;;(define-key projectile-mode-map (kbd "M-3") 'helm-projectile-find-file)
  (define-key projectile-mode-map (kbd "C-p g") 'helm-projectile-grep)
  (define-key projectile-mode-map (kbd "C-p f") 'helm-projectile-find-file)
  
  ;; markdown-mode
  (add-hook 'markdown-mode-hook
            (lambda ()
              (local-set-key (kbd "C-l l") 'markdown-insert-link) 
              (local-set-key (kbd "C-l p") 'markdown-live-preview-mode)))
  
  

  ;; slime
  (if (file-exists-p "/usr/bin/sbcl" )
      (progn
        (load (expand-file-name "/cloud/.pref/quicklisp/slime-helper.el"))
        (setq inferior-lisp-program "/usr/bin/sbcl")
        (global-set-key (kbd "M-z") 'slime-repl-clear-buffer)))
  
  ;; js2-mode
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode))


  ;; Haskell
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  
  ;; autopair
  (run-with-idle-timer 0 nil (lambda () (require 'autopair)))
  (run-with-idle-timer 0 nil (lambda () (autopair-global-mode))))


(defun load-packages-v23 ()
  (load (concat path-pref "package.el"))
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
  (setq package-user-dir (concat path-pref "elpa23"))
  (package-initialize))


;; (if (version< emacs-version "24")
;;     (load-packages-v23)
;;   (load-packages))

(load-packages)

;;; emacs-packages ends here
