
;;; Music

(use-package emms
  :config
  (emms-default-players)
  (setq emms-source-file-default-directory "~/Music/music/")
  (setq emms-browser-covers 'emms-browser-cache-thumbnail-async)
  (setq emms-player-list '(emms-player-afplay
                                        ;emms-player-mpg123
                                        ;emms-player-mplayer
                           ))
  (define-key dired-mode-map "!" 'emms-add-dired)

  (require 'emms-player-simple)
  (require 'emms-setup)
  (emms-all)
  (setq emms-playlist-buffer-name "*Music*")
  (setq emms-info-asynchronously t)
  (require 'emms-mode-line)
  (emms-mode-line 1)
  (require 'emms-playing-time)
  (emms-playing-time 1)
  ;; (require 'emms-history)
  ;; (emms-history-load)

  )




(require 'emms-mode-line)
(emms-mode-line 1)

(require 'emms-playing-time)
(emms-playing-time 1)

(setq emms-mode-line-icon-enabled-p nil)



(defun myplay ()
  (interactive)
  (emms-browser-clear-playlist)
  (emms-browser-add-tracks-and-play)) 

(use-package emms-browser
  :straight nil
  :config

(require 'emms-player-vlc)
(emms-standard)
(emms-default-players)
(setq emms-player-vlc-command-name
      "/Applications/VLC.app/Contents/MacOS/VLC")



                                        ;(evil-define-key 'normal emms-browser-mode-map "h" 'emms-browser-toggle-subitems)
                                        ;(evil-define-key 'normal emms-browser-mode-map "j" 'evil-next-visual-line)
                                        ;(evil-define-key 'normal emms-browser-mode-map "k" 'evil-previous-visual-line)
                                        ;(evil-define-key 'normal emms-browser-mode-map "l" 'emms-browser-toggle-subitems)

(define-key emms-browser-mode-map (kbd "RET") #'myplay)

    (global-set-key (kbd "M-c") 'emms-pause)
    (global-set-key (kbd "M-p") 'emms-previous)
    (global-set-key (kbd "M-n") 'emms-next)


  )
