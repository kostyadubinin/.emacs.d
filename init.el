;; Run package-install-selected-packages
;; TODO: Add new line at the end of the file.

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(gofmt-command "goimports")
 '(package-selected-packages
   (quote
    (zenburn-theme markdown-mode dockerfile-mode flymake-cursor solarized-theme go-mode typescript-mode yaml-mode flymake-haml haml-mode undo-tree ace-window avy rubocop flymake-ruby magit)))
 '(require-final-newline t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(server-start)

(setq-default fill-column 80)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'control)
(setq js-indent-level 2)
(setq column-number-mode t)
(setq backup-inhibited t)    ; disable backup
(setq auto-save-default nil) ; disable auto save
(setq dired-listing-switches "-alh")

(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "M-i") 'other-window)
(global-set-key (kbd "M-p") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(scroll-bar-mode -1)
(icomplete-mode 99)
(savehist-mode 1)
(global-undo-tree-mode)

(add-to-list 'default-frame-alist '(width  . 162))
(add-to-list 'default-frame-alist '(height . 72	))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'flymake-ruby)
(require 'flymake-haml)

(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'haml-mode-hook 'flymake-haml-load)
(add-hook 'ruby-mode-hook #'rubocop-mode)

(add-hook 'dired-load-hook
	  (lambda ()
	    (load "dired-x")
	    ;; Set dired-x global variables here.  For example:
	    ;; (setq dired-guess-shell-gnutar "gtar")
	    ;; (setq dired-x-hands-off-my-keys nil)
	    ))
(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; Set dired-x buffer-local variables here.  For example:
	    ;; (dired-omit-mode 1)
	    ))

(add-hook 'before-save-hook #'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") #'godef-jump)))

(setq inhibit-splash-screen t)
(eval-after-load 'flymake '(require 'flymake-cursor))
