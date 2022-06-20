;;; lsp-mode

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :config
  ;; (setq lsp-ui-sideline-enable t)
  (setq lsp-headerline-breadcrumb-enable-diagnostics nil)
  (setq lsp-idle-delay 0)
  (setq lsp-completion-show-detail nil)
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-modeline-diagnostics-enable nil)

  (setq lsp-enable-semantic-highlighting nil)
  
  :hook
  (
   (c++-mode . lsp)
   (c-mode . lsp)
   (python-mode . lsp)
   (latex-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; (use-package eglot
;;   :defer nil
;;   :config
;;   (add-hook 'c-mode-hook 'eglot-ensure)
;;   (add-hook 'c++-mode-hook 'eglot-ensure)
;;   (add-hook 'python-mode-hook 'eglot-ensure)
;;   )


;; (use-package company
;;   :defer nil
;;   :config
;;   (setq company-idle-delay 0)
;;   (setq company-tooltip-idle-delay 0)
;;   (setq company-minimum-prefix-length 2)
;;   (bind-key "C-=" 'company-complete) 
;;   (global-company-mode)
;;   ;; (setq company-icon-size 1)

;;   (setq company-tooltip-limit 10)
;;   (setq company-dabbrev-downcase 0)
;;   (setq company-echo-delay 1)
;;   (setq company-tooltip-maximum-width 100)

;;   (setq company-backends
;;         '((company-files
;;            company-keywords
;;            company-capf
;;            )
;;            ;; (company-clang
;;            ;; company-gtags
;;            ;; company-etags
;;           ;; company-dabbrev-code)
;;         ))

;;   ;; cycle through completions on hitting tab. No need to use arrows
;;     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
;;     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
;;     ;; select previous completion on shift + tab
;;     (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
;;     (define-key company-active-map (kbd "<backtab>") 'company-select-previous)

;;     ;; cancel selections by typing non-matching characters
;;     (setq company-require-match 'never)
;;     ;; keys like SPC do NOT finish completion (have to press enter to select completion)
;;     (setq company-auto-complete nil)

;;     (define-key company-active-map (kbd "C-c C-a C-d") #'my/company-show-doc-buffer)
    
;;     )





;; (use-package corfu
;;    :hook (lsp-completion-mode . kb/corfu-setup-lsp) ; Use corfu for lsp completion
 
;;   ;; Optional customizations
;;   :custom
;;   ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
;;   (corfu-auto t)                 ;; Enable auto completion
;;   (corfu-auto-prefix 2)
;; ;; (corfu-auto-delay 0.25)
;;   (corfu-auto-delay 0)
  
;; (corfu-min-width 80)
;; (corfu-max-width corfu-min-width)       ; Always have the same width
;; (corfu-count 14)
;; (corfu-scroll-margin 4)
;; (corfu-cycle nil)
;; (lsp-completion-provider :none) 

;;   ;; (corfu-separator ?\s)          ;; Orderless field separator
;;   ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
;;   ;; (corfu-preview-current nil)    ;; Disable current candidate preview
;;   ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
;;   ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
;;   ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
;;   ;; (corfu-scroll-margin 5)        ;; Use scroll margin

;;   ;; This is recommended since dabbrev can be used globally (M-/).
;;   :init
;;   (corfu-global-mode)
;;   :config
;;     (defun kb/corfu-setup-lsp ()
;;     "Use orderless completion style with lsp-capf instead of the
;; default lsp-passthrough."
;;     (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
;;           '(orderless)))
;;     )

;; ;; Optionally use the `orderless' completion style. See `+orderless-dispatch'
;; ;; in the Consult wiki for an advanced Orderless style dispatcher.
;; ;; Enable `partial-completion' for files to allow path expansion.
;; ;; You may prefer to use `initials' instead of `partial-completion'.
;; (use-package orderless
;;   :init
;;   ;; Configure a custom style dispatcher (see the Consult wiki)
;;   ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
;;   ;;       orderless-component-separator #'orderless-escapable-split-on-space)
;;   (setq completion-styles '(orderless)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles . (partial-completion))))))

;; ;; Use dabbrev with Corfu!
;; ;; (use-package dabbrev
;; ;;   ;; Swap M-/ and C-M-/
;; ;;   :bind (("M-/" . dabbrev-completion)
;; ;;          ("C-M-/" . dabbrev-expand)))

;; ;; A few more useful configurations...
;; (use-package emacs
;;   :init
;;   ;; TAB cycle if there are only few candidates
;;   (setq completion-cycle-threshold 3)

;;   ;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
;;   ;; Corfu commands are hidden, since they are not supposed to be used via M-x.
;;   ;; (setq read-extended-command-predicate
;;   ;;       #'command-completion-default-include-p)

;;   ;; Enable indentation+completion using the TAB key.
;;   ;; `completion-at-point' is often bound to M-TAB.
;;   (setq tab-always-indent 'complete))




;; (use-package cape
;;   :defer nil
;;   ;; Bind dedicated completion commands
;;   :bind (("C-c p p" . completion-at-point) ;; capf
;;          ("C-c p t" . complete-tag)        ;; etags
;;          ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
;;          ("C-c p f" . cape-file)
;;          ("C-c p k" . cape-keyword)
;;          ("C-c p s" . cape-symbol)
;;          ("C-c p a" . cape-abbrev)
;;          ("C-c p i" . cape-ispell)
;;          ("C-c p l" . cape-line)
;;          ("C-c p w" . cape-dict)
;;          ("C-c p \\" . cape-tex)
;;          ("C-c p _" . cape-tex)
;;          ("C-c p ^" . cape-tex)
;;          ("C-c p &" . cape-sgml)
;;          ("C-c p r" . cape-rfc1345))
;;   :init
;;   ;; Add `completion-at-point-functions', used by `completion-at-point'.
;;   (add-to-list 'completion-at-point-functions #'cape-file)
;;   (add-to-list 'completion-at-point-functions #'cape-tex)
;;   (add-to-list 'completion-at-point-functions #'cape-dabbrev)
;;   (add-to-list 'completion-at-point-functions #'cape-keyword)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-ispell)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-dict)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
;;   ;;(add-to-list 'completion-at-point-functions #'cape-line)
;;   )





;;  (defun my/ignore-elisp-keywords (cand)
;;    (or (not (keywordp cand))
;; 	(eq (char-after (car completion-in-region--data)) ?:)))

;; (defun my/setup-elisp ()
;;    (setq-local completion-at-point-functions
;; 		`(,(cape-super-capf
;; 		    (cape-capf-predicate
;; 		     #'elisp-completion-at-point
;; 		     #'my/ignore-elisp-keywords)
;; 		    #'cape-dabbrev)
;; 		  cape-file)
;; 		cape-dabbrev-min-length 5))
;; (add-hook 'emacs-lisp-mode-hook #'my/setup-elisp)






(use-package svg-lib)
(use-package kind-icon
  :ensure t
  :after corfu
  :custom
   (kind-icon-use-icons t)
  (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))









;;; C/C++

;; Indenting 4 big
(setq-default c-basic-offset 2)
;; Treat header files as cpp
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(use-package dumb-jump
  :defer nil
  :init
  (dumb-jump-mode)
  :config
  ;; (setq dumb-jump-selector 'ivy)
  )
 
;; (use-package opencl-mode)
(add-to-list 'auto-mode-alist '("\\.cl\\'" . c-mode))
(use-package make-mode
  :ensure t)


;; Syntax highlighting
;; https://emacs-tree-sitter.github.io/syntax-highlighting/customization/
;; (use-package tree-sitter)
;; (use-package tree-sitter-langs)
;; (add-hook 'c-mode-hook #'tree-sitter-mode)
;; (add-hook 'c++-mode-hook #'tree-sitter-mode)
;; ;; (global-tree-sitter-mode) ;; Just the C++ files
;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)


;;; R
;; (use-package ess)

;;; Latex

;; Making emacs find latex (so that C-c C-x C-l works on orgmode)
(setenv "PATH" (concat ":/Library/TeX/texbin/" (getenv "PATH")))
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin/"))  
(setq exec-path (append exec-path '("/Library/TeX/texbin/")))
(add-to-list 'exec-path "/Library/TeX/texbin/")
(add-to-list 'exec-path "/usr/local/opt/llvm/bin/")
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; AucTeX
(use-package auctex
  :defer nil
  :config
                                        ;(setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-PDF-mode t)
  (setq TeX-save-query nil)

  )

;;; Web

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
)

;; Matlab
;; (use-package matlab-mode
;;   :defer nil
;;   :config
;;   (setq matlab-indent-function-body t)
;;   (setq matlab-shell-command "/Applications/MATLAB_R2020b.app/bin/matlab")
;;   (setq matlab-shell-command-switches (list "-nodesktop"))
;;   (setq matlab-indent-function t)
;;  )
;;    (add-to-list
;;   'auto-mode-alist
;;   '("\\.m$" . matlab-mode))


;;; Syntax checking

;;; Selection

(use-package flycheck
  :ensure t
  :defer nil
  :config
  ;; (global-flycheck-mode)
  )
(use-package flycheck-pkg-config)

(use-package yasnippet
  :defer nil
  :config
  (add-to-list 'load-path "~/.config/emacs/snippets")
  (yas-global-mode)
  (yas-minor-mode))

;(outline-minor-mode)

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-\ C-c") 'mc/edit-lines))

;;; Mini buffer

(use-package which-key
  :defer nil
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5
        which-key-idle-secondary-delay 0.1)

  (which-key-enable-god-mode-support) 
  )






;;; COMPLETION
(use-package vertico
  :init
;;;; Out Of Order Compleiton
  (use-package orderless
    :commands (orderless)
    :custom (completion-styles '(orderless flex)))

;;;; Extra Completion Functions
  (use-package consult
    :defer t
    :bind (("C-c l"       . consult-line)
           ("C-c L"       . consult-line-multi)
           ("C-c i"       . consult-imenu)
           ("C-x b"       . consult-buffer)
           ("C-x C-k C-k" . consult-kmacro)
           ("M-y"         . consult-yank-pop)
           ("M-g g"       . consult-goto-line)
           ("M-g M-g"     . consult-goto-line)
           ("M-g f"       . consult-flymake)
           ("M-g i"       . consult-imenu)
           ("M-s l"       . consult-line)
           ("M-s L"       . consult-line-multi)
           ("M-s u"       . consult-focus-lines)
           ("M-s g"       . consult-ripgrep)
           ("C-x C-SPC"   . consult-global-mark)
           ("C-x M-:"     . consult-complex-command)
           ("C-c n"       . consult-org-agenda)
           ("C-c f"       . consult-find)
           ("C-c g"       . consult-ripgrep)
           ("C-c S-n"     . gv/notegrep)
           :map dired-mode-map
           ("O" . consult-file-externally)
           :map help-map
           ("a" . consult-apropos))
    :custom
    (completion-in-region-function #'consult-completion-in-region)
    :config
    (defun gv/notegrep ()
      "Use interactive grepping to search my notes"
      (interactive)
      (consult-ripgrep org-directory))
    (add-hook 'completion-setup-hook #'hl-line-mode)
    (recentf-mode t))


  (use-package marginalia
    :custom
    (marginalia-annotators
     '(marginalia-annotators-heavy marginalia-annotators-light nil))
    :init
    (marginalia-mode))
  (vertico-mode)
  :config
  ;; Used for the vertico-directory extension
  (add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))







;;;; Code Completion
(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)           ;; allows cycling through candidates
  (corfu-auto t)            ; Enable auto completion
  (corfu-auto-prefix 2)     ; Enable auto completion
  (corfu-auto-delay 0.0)    ; Enable auto completion
  (corfu-quit-at-boundary t)
  (corfu-echo-documentation 0.25)   ; Enable auto completion
  (corfu-preview-current 'insert)         ; Do not preview current candidate
  (corfu-preselect-first nil)

  ;; Optionally use TAB for cycling, default is `corfu-complete'.
  :bind (:map corfu-map
              ("RET"     . nil) ;; leave my enter alone!
              ("TAB"     . corfu-next)
              ([tab]     . corfu-next)
              ("S-TAB"   . corfu-previous)
              ([backtab] . corfu-previous))

  :init
  (global-corfu-mode))

;; Add extensions
(use-package cape
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  :config
  ;; Silence then pcomplete capf, no errors or messages!
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)

  ;; Ensure that pcomplete does not write to the buffer
  ;; and behaves as a pure `completion-at-point-function'.
  (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify)
  (add-hook 'eshell-mode-hook
            (lambda () (setq-local corfu-quit-at-boundary t
                              corfu-quit-no-match t
                              corfu-auto nil)
              (corfu-mode))))

(use-package pcmpl-args)








;;; popup window managment
(use-package popper
  :ensure t ; or :straight t
  :bind (("M-`"   . popper-toggle-latest)
         ("M-~"   . popper-cycle)
         ("C-x M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "\\*Warnings\\*"
          "\\*xref\\*"
          "\\*Backtrace\\*"
          "\\*eldoc\\*"
          "\\*compilation\\*"
          "^*tex"
          "^\\*sly-[^s]"
          "\\*Ement Notifications\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          "\\*Dtache Shell Command\\*"
          "\\*mu4e-update\\*"
          help-mode
          compilation-mode))
  (popper-mode +1))















;; Compile mode
(require 'compile)

;; (setq compilation-read-command nil)

(defun my-compile ()
  "Run compile and resize the compile window"
  (interactive)
  (progn
    (save-buffer)
    (call-interactively 'compile)
    (setq cur (selected-window))
    (setq w (get-buffer-window "*compilation*"))
    (select-window w)
    (setq h (window-height w))
    (shrink-window (- h 12))
    (select-window cur)
    )
  )

(defun my-compile-faces ()
  "Buffer-local face remapping for 'compilation mode'."
  (face-remap-add-relative 'default
                           :background "#1D1D1D"
                           :foreground "#F2F2F2"))
(add-hook 'compilation-mode-hook #'my-compile-faces)




(require 'cc-mode)
(require 'python)
(require 'tex-mode)

(define-key c++-mode-map (kbd "C-<return>") 'recompile)
(define-key c-mode-map (kbd "C-<return>") 'recompile)
(define-key python-mode-map (kbd "C-<return>") 'recompile)
(eval-after-load 'LaTeX-mode
  '(define-key LaTeX-mode-map (kbd "C-<return>") 'TeX-command-run-all))




(require 'prog-mode)


  (add-hook 'prog-mode-hook 'hs-minor-mode)
  (add-hook 'prog-mode-hook 'outline-minor-mode)
  (add-hook 'prog-mode-hook (lambda ()
                              (setq show-trailing-whitespace t)))
  (add-hook 'emacs-lisp-mode-hook
            (lambda () (add-hook 'local-write-file-hooks 'check-parens)))
  (add-hook 'emacs-lisp-mode-hook 'prettify-symbols-mode)
  (add-hook 'lisp-mode-hook 'prettify-symbols-mode)
  (add-hook 'lisp-mode-hook #'(lambda ()
                                (setq indent-tabs-mode nil)))
;;;;; Smart Indentation
  (defun infer-indentation-style ()
    ;; if our source file uses tabs, we use tabs, if spaces spaces, and if
    ;; neither, we use the current indent-tabs-mode
    (let ((space-count (how-many "^  " (point-min) (point-max)))
          (tab-count (how-many "^\t" (point-min) (point-max))))
      (if (> space-count tab-count) (setq indent-tabs-mode nil))
      (if (> tab-count space-count) (setq indent-tabs-mode t))))
  (add-hook 'prog-mode-hook 'infer-indentation-style)


























(provide 'programming)

