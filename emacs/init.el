;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(fill-column 70)
 '(helm-follow-mode-persistent t)
 '(package-selected-packages
   (quote
    (dumb-jump helm-ag helm typescript-mode go-mode markdown-mode magit org runner lua-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Backup files and Autosave settings
(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-default nil)

;; Menubar
(menu-bar-mode -1)

;; Toolbar
(tool-bar-mode -1)

;; Tabs
(setq default-tab-width 2)
(setq-default tab-width 2)

;; Initial Buffer
(setq inhibit-startup-screen t
      initial-buffer-choice nil)
(setq initial-scratch-message "")

;; F1 for bookmark-list
(global-set-key (kbd "<f1>") 'helm-filtered-bookmarks)

;; Auto reload file
(global-auto-revert-mode -1)

;; Set files ending in ".p8" to open in lua-mode
(add-to-list 'auto-mode-alist '("\\.p8\\'" . lua-mode))

;(global-set-key (kbd "; Load Path
(add-to-list 'load-path "~/.emacs.d/elisp")

;; Xah Run Current File
(load "xah-run-current-file.el")
(global-set-key (kbd "<f8>") 'xah-run-current-file)

;; Show Parens
(show-paren-mode 1)

;; Turn off beeping
(setq bell-volume 0)

;; Increase font size
;;(set-face-attribute 'default nil :height 140)

;; Path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/Cellar/go/1.10.1/bin/"))

;; Go
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;; Window movement
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; Indenting Tabs and Spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Helm / Searching
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-s") 'helm-ag-this-file)
(global-set-key (kbd "C-x C-b") 'helm-mini)

;; Line Numbers
(global-display-line-numbers-mode 1)

;; Dumb Jump
(dumb-jump-mode 1)
(global-set-key (kbd "C-o") 'dumb-jump-go)

;; Symlinks
(setq vc-follow-symlinks t)