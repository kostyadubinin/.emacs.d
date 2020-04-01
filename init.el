;; Run package-install-selected-packages

(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(csv-separators (quote ("," "	" ";")))
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
    ("84890723510d225c45aaff941a7e201606a48b973f0121cb9bcb0b9399be8cba" "bfdcbf0d33f3376a956707e746d10f3ef2d8d9caa1c214361c9c08f00a1c8409" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ibuffer-formats
   (quote
    ((mark modified read-only locked " "
	   (name 45 45 :left :elide)
	   " "
	   (size 9 -1 :right)
	   " "
	   (mode 18 18 :left :elide)
	   " " filename-and-process)
     (mark " "
	   (name 16 -1)
	   " " filename))))
 '(package-selected-packages
   (quote
    (csv-mode nginx-mode zenburn-theme markdown-mode dockerfile-mode solarized-theme go-mode typescript-mode yaml-mode haml-mode undo-tree ace-window avy magit)))
 '(require-final-newline t)
 '(scroll-bar-mode nil)
 '(split-width-threshold 120))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default fill-column 80)

(setq mac-command-modifier 'control)
;; (setq mac-command-modifier 'meta)
;; (setq mac-option-modifier 'control)

(setq js-indent-level 2)
(setq backup-inhibited t)    ; disable backup
(setq auto-save-default nil) ; disable auto save

;; (global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "M-i") 'other-window)
(global-set-key (kbd "M-p") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(icomplete-mode 99)
(savehist-mode 1)
(global-undo-tree-mode)

(add-to-list 'default-frame-alist '(width  . 120))
(add-to-list 'default-frame-alist '(height . 72	))
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook 'subword-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

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

(setq inhibit-splash-screen t)

;;;; Go

;; If you want to automatically run ‘gofmt’ before saving a file,
;; add the following hook to your emacs configuration:
(add-hook 'before-save-hook #'gofmt-before-save)

;; If you want to use ‘godef-jump’ instead of etags (or similar),
;; consider binding godef-jump to ‘M-.’, which is the default key
;; for ‘find-tag’:
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") #'godef-jump)))

;; Please note that godef is an external dependency. You can install
;; it with

;; go get github.com/rogpeppe/godef

;;;; Flymake

(setq flymake-start-on-flymake-mode nil)
(add-hook 'ruby-mode-hook #'flymake-mode)
(require 'flymake)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)

(add-to-list 'default-frame-alist '(font . "SF Mono-14"))
(setq-default line-spacing 2)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
