;;; Dashbaord

(use-package dashboard
  :defer nil
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  ;; (setq dashboard-startup-banner "~/Pictures/Memes/Anime/Asuka.png")
  ;; (setq dashboard-startup-banner "~/Pictures/Memes/eizouken/hegel.png")
  ;;
  (setq dashboard-footer-messages '("Welcome"))
  (setq dashboard-items '((projects . 5)
                          ;(recents  . 5)
                          ;(agenda . 5)
                          ))
  
  ;; (setq dashboard-items nil)
  (setq dashboard-set-footer nil)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-banner-logo-title "Let's get to work.")
 )

