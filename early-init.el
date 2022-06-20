;;; Early loaded settings


;;disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Disable tool bar, menu bar, scroll bar.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; (fringe-mode 2)


(setq-default cursor-type 'bar)
(context-menu-mode 1)
;; Ensures scaling window properly 
(setq frame-resize-pixelwise t)
;; Scrolling
(setq redisplay-dont-pause t
  scroll-margin 3
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; For some reason makes scrolling smoother
(setq jit-lock-defer-time 0)

;; Window decoration
(add-to-list 'default-frame-alist '(undecorated . t))

; smooth scrolling
(setq pixel-scroll-precision-mode t)
;; Mouse autoselect
(setq mouse-autoselect-window t)

(setq-default indent-tabs-mode nil)
;; Highlight current line.
(global-hl-line-mode t)

(setq show-paren-delay 0)
(show-paren-mode 1)
;; Line wrapping
(global-visual-line-mode t)

(blink-cursor-mode 0)
(setq-default cursor-in-non-selected-windows nil)

(fset 'yes-or-no-p 'y-or-n-p)
;; Annoying # files
(setq create-lockfiles nil)
;; Annoying ~ files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq delete-by-moving-to-trash t
      create-lockfiles nil
      auto-save-default nil
      inhibit-startup-screen t
      ring-bell-function 'ignore)

(setq native-comp-async-report-warnings-errors 'silent)
;; A little padding
;(set-frame-parameter nil 'internal-border-width 20)

;; dumb
(setq package-enable-at-startup nil
      package--init-file-ensured t)

;; Bracket matching
;; (setq electric-pair-pairs '(
;;                            (?\{ . ?\})
;;                            (?\( . ?\))
;;                            (?\[ . ?\])
;;                            (?\" . ?\")
;;                            (?\< . ?\>)
;;                             ))
;;(electric-pair-mode t)

;; Line numbers
;; (setq display-line-numbers-type 'relative)
;; (setq display-line-numbers-type t)
;; (global-display-line-numbers-mode)

