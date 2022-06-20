



;; default terminal application path
(defvar tmtxt/macos-default-terminal-app-path
  "/Applications/kitty.app" "The default path to terminal application in MacOS")
;;; function to open new terminal window at current directory
(defun tmtxt/open-current-dir-in-terminal ()
  "Open current directory in dired mode in terminal application.
For MacOS only"
  (interactive)
  
  (shell-command (concat "open -a "
			 (shell-quote-argument tmtxt/macos-default-terminal-app-path)
			 " "
			 (shell-quote-argument (file-truename default-directory))
                         )))



;; (use-package popper
;;   :ensure t ; or :straight t
;;   :bind (("C-`"   . popper-toggle-latest)
;;          ("M-`"   . popper-cycle)
;;          ("C-M-`" . popper-toggle-type))
;;   :init
;;   (setq popper-reference-buffers
;;         '("\\*Messages\\*"
;;           "Output\\*$"
;;           "\\eshell\\*"
;;           help-mode
;;           compilation-mode))
;;   (popper-mode +1)
;;   (popper-echo-mode +1))                ; For echo area hints



;; (add-hook 'eshell-mode-hook '(lambda() (set (make-local-variable 'god-local-mode) nil)))




;;; Term

;; A Full terminal 
(use-package vterm)

;; Kindly donated by witchmacs
;; (setq eshell-prompt-regexp "^[^αλ\n]*[αλ] ")
;; (setq ehell-prompt-function
;;       (lambda nil
;;         (concat
;;          (if (string= (eshell/pwd) (getenv "HOME"))
;;              (propertize "~" 'face `(:foreground "#99CCFF"))
;;            (replace-regexp-in-string
;;             (getenv "HOME")
;;             (propertize "~" 'face `(:foreground "#99CCFF"))
;;             (propertize (eshell/pwd) 'face `(:foreground "#99CCFF"))))
;;          (if (= (user-uid) 0)
;;              (propertize " α " 'face `(:foreground "#FF6666"))
;;            (propertize " λ " 'face `(:foreground "#A6E22E"))))))

(setq eshell-highlight-prompt nil)

(defun eshell-here ()
      "Opens up a new shell in the directory associated with the
    current buffer's file. The eshell is renamed to match that
    directory to make multiple eshell windows easier."
      (interactive)
      (let* ((parent (if (buffer-file-name)
                         (file-name-directory (buffer-file-name))
                       default-directory))
             (height (/ (window-total-height) 3))
             (name   (car (last (split-string parent "/" t)))))
        (split-window-vertically (- height))
        (other-window 1)
        (eshell "new")
        (rename-buffer (concat "*eshell: " name "*"))

        (insert (concat "ls"))
        (eshell-send-input)))

    (global-set-key (kbd "C-!") 'eshell-here)

;; leave eshell
 (defun eshell/x ()
      (insert "exit")
      (eshell-send-input)
      (delete-window))


(use-package svg-clock)
(use-package csv-mode)

;;; Project

(use-package magit
  :bind
  ;; (:map magit-status-mode-map
        ;; ("j" . magit-next-line)
        ;; ("k" . magit-previous-line)
  ;; )
)

;; projectile
(use-package projectile
  :defer nil 
  :config
  (projectile-global-mode)
  ;; (setq projectile-completion-system 'ivy)
)
  




(provide 'modules)

