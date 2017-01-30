;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq-default fill-column 80)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'control)

(scroll-bar-mode -1)

(setq js-indent-level 2)

(add-to-list 'default-frame-alist '(width  . 162))
(add-to-list 'default-frame-alist '(height . 52	))

(setq column-number-mode t)

(global-set-key (kbd "C-x C-b") 'bs-show)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook 'subword-mode)

(savehist-mode 1)

(icomplete-mode 99)

(global-set-key (kbd "M-i") 'other-window)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

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

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(global-set-key (kbd "M-p") 'avy-goto-word-or-subword-1)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(global-undo-tree-mode)

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(require 'flymake-haml)
(add-hook 'haml-mode-hook 'flymake-haml-load)

(add-hook 'ruby-mode-hook #'rubocop-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (typescript-mode yaml-mode flymake-haml haml-mode undo-tree ace-window avy rubocop flymake-ruby magit))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
