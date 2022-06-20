(use-package treemacs)

(use-package dirvish
  :defer nil)
;;; Dired
(use-package all-the-icons-dired)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(use-package dired
  :straight nil
  :demand
  :config
  (add-hook 'dired-mode-hook
            (lambda ()
              (dired-hide-details-mode)))
  (add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
  
  (setq-default dired-omit-files-p t)
  (setq dired-omit-files "^\\.DS_Store")
  (setq delete-by-moving-to-trash t)

  (defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header 
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))

  :bind
  (:map dired-mode-map
        (("j" . dired-next-line)
         ("k" . dired-previous-line)
         ("h" . dired-up-directory)
         ("l" . dired-find-file)
         ("i" . peep-dired))) 
  )

(use-package peep-dired
  :demand
  :config
  (setq peep-dired-cleanup-on-disable t)
  :bind
  (:map peep-dired-mode-map
        ("j" . peep-dired-next-file)
        ("k" . peep-dired-prev-file))
  )

(use-package dired-x
  :straight nil
  :demand)

(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  ;; (setq dired-sidebar-theme 'vscode)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))





(when (string= system-type "darwin")       
  (setq dired-use-ls-dired nil))
