
;;; Packages

;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; Setting up use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(setq use-package-always-defer nil)
;; (setq straight-check-for-modifications nil)

;; garbage collection
(setq gc-cons-threshold 1000000000)
(setq garbage-collection-messages t)

;; Load modules

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.config/emacs/src")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Base

(load-user-file "src/keybinds.el")
(load-user-file "src/appearance.el")
;(load-user-file "src/dashboard.el")
;(load-user-file "src/doom.el")

(load-user-file "src/modules.el")
(load-user-file "src/dired.el")

;;; Documents
(load-user-file "src/org.el")
;; (load-user-file "src/pdf.el")

;;; Programming Languages
(load-user-file "src/programming.el")

;;; Development

;;; Live inside emacs
(load-user-file "src/emms.el")
(load-user-file "src/elfeed.el")









(use-package async
  :ensure t
  :defer t
  :init
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1)
  :custom (async-bytecomp-allowed-packages '(all)))











(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "025acf94eb56f1b569f853f77effb1aa5006947a9df3a913f52fcb8daf9a15b2" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
