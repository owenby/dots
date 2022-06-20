;;; DOOM

(use-package doom-themes
  :defer nil
  :config
  ;; (load-theme 'doom-solarized-dark-high-contrast t)
  ;; (load-theme 'doom-old-hope t)
  ;; (load-theme 'doom-1337 t)
  (load-theme 'doom-nord t)
)

Bloated but simply the most comprehensive 
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 20)
  ;; (setq doom-modeline-bar-width nil)
  ;; (setq doom-modeline-major-mode-icon t)
  ;; (setq doom-modeline-minor-modes nil)
  ;; (setq doom-modeline-modal-icon nil)
  ;; (setq doom-modeline-project-detection 'project)
  ;; (setq doom-modeline-lsp t)
  (setq doom-modeline-github nil)
  (set-face-attribute 'mode-line nil :height 145)
)

