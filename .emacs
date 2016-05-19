(setq py-install-directory "~/.emacs.d/python-mode-6.2.0")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)


(add-to-list 'load-path "~/.emacs.d/packages/")
;; Set emacs defaults
;; Set fill-column to 72 for comments
(setq-default fill-column 72)
;; set highlight line on by default
(global-hl-line-mode 1)
;; line by line scrolling instead of jumping
(setq scroll-step 1)
;; tabs insert 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;; put backups in their own directory
;; Enable backup files.
(setq make-backup-files t)
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
;; line numbering
;; Show line-number in the mode line
(line-number-mode 1)
;; Show column-number in the mode line
(column-number-mode 1)
;; showing line lines in buffer is off by default
(linum-mode 0)
;; change the line number format for proper view
(setq linum-format "%3d\u2502 ")
;; highlight region between point and mark
(setq transient-mark-mode t)
;;(set-face-background 'hl-line "#00ff7f")
(set-face-background 'hl-line "#696969")
;(set-face-background 'hl-line "gray13")
;(set-face-background 'hl-line "1c1c1c")
;; turn off top menu bar
(menu-bar-mode -1)
;; always end a file with a newline
(setq require-final-newline t)
;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; highlight incremental search
(setq search-highlight t)
;; delete auto-save files upon save
(setq delete-auto-save-files t)
;; delete old version
(setq delete-old-versions t)
;; set default mode
(setq default-major-mode 'text-mode)
; match parens by default
(show-paren-mode 1)


;; ido mode
(require 'ido)
(ido-mode t)

;; fill column indicator
(require 'fill-column-indicator)
(add-to-list 'load-path "~/.emacs.d/")
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(setq fci-rule-color "red")
(setq-default fci-rule-column 80)
;;(setq-default fci-rule-column 72)

;; package installers
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; ack grep
(defvar ack-history nil
  "History for the `ack' command.")

(defun ack (command-args)
  (interactive
   (let ((ack-command "ack-grep --nogroup --with-filename  "))
     (list (read-shell-command "Run ack (like this): "
                               ack-command
                               'ack-history))))
  (let ((compilation-disable-input t))
    (compilation-start (concat command-args " < " null-device)
                       'grep-mode)))

(defun cuack (command-args)
  (interactive
   (let ((ack-command "ack-grep --nogroup --with-filename  "))
     (list (read-shell-command "Run ack (like this): "
                               ack-command
                               'ack-history))))
  (let ((compilation-disable-input t))
    (compilation-start (concat command-args " /home/mlathrop/src/git/cloud-ui/* < " null-device)
                       'grep-mode)))


(add-to-list 'load-path "~/.emacs.d/vendor/Pymacs/")
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "bd115791a5ac6058164193164fd1245ac9dc97207783eae036f0bfc9ad9670e0" default)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/packages/yasnippet/")
(require 'yasnippet)
(yas-global-mode 1)

(add-hook 'python-mode-hook 'flyspell-prog-mode)

;;Projectile
;;(setq projectile-global-mode t)
