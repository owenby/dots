;;; God mode

(use-package god-mode
  ;;:defer nil
  :config
  (god-mode-all)
  (god-local-mode)
  (global-set-key (kbd "<escape>") 'god-local-mode)


 (add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)
(define-key god-local-mode-map (kbd "[") #'backward-paragraph)
(define-key god-local-mode-map (kbd "]") #'forward-paragraph)
 )

 (defun my-update-cursor ()
   (setq cursor-type (if (or god-local-mode buffer-read-only)
                         'box
                       'bar)))


;;; Keybinds





(setq mac-option-modifier 'meta)
;(setq mac-command-modifier 'control)

(define-key input-decode-map 
    (kbd "C-[") 
    [control-bracketleft])

;; navigation
(bind-key "C-{" 'beginning-of-buffer)
(bind-key "C-}" 'end-of-buffer)
(bind-key "<control-bracketleft>" 'backward-paragraph)
(bind-key "C-]" 'forward-paragraph)

;(bind-key "M-n" "\C-u1\C-v")
;(bind-key "M-p" "\C-u1\M-v")

(bind-key "C-f" 'forward-word)
(bind-key "C-b" 'backward-word)
(bind-key "C-o" 'evil-newline)
(bind-key "C-a" 'smart-beginning-of-line)

(bind-key "C-w" 'copy-region-as-kill)
(bind-key "C-S-w" 'kill-region)
(bind-key "C-;" 'comment-line)
;; (bind-key* "C-d" 'kill-whole-line)
(bind-key "C-<backspace>" 'kill-to-beginning)
(bind-key* "C-d" 'kill-whole-line)
;; windows
(bind-key "C-q" 'kill-buffer-and-window)
(bind-key "C-x C-d" 'dired)
(bind-key* "M-d" 'dired-jump)

(global-set-key (kbd "s-<up>") 'windmove-up)
(bind-key* "C-x C-h" 'split-window-right)
(bind-key* "C-x C-j" 'split-window-below)
(bind-key* "C-x C-k" 'split-window-below)
(bind-key* "C-x C-l" 'split-window-right)
(bind-key* "C-c C-h" 'windmove-left)
(bind-key* "C-c C-j" 'windmove-down)
(bind-key* "C-c C-k" 'windmove-up)
(bind-key* "C-c C-l" 'windmove-right)
   ;; "C-m C-j" 'split-window-below
  ;; "C-m C-l" 'split-window-right  
(bind-key "C-c C-p" 'popout)

;; (bind-key "C-s" 'swiper-isearch)
;; (bind-key "C-r" 'swiper-isearch-backward)
(bind-key "C-c C-TAB" 'indent-for-tab-command)
(bind-key "C-c C-b" 'eval-buffer)
(bind-key "C-c C-g" 'magit)

;(bind-key "C-c C-;" 'counsel-M-x)
(bind-key "C-c C-:" 'eval-expression)
(bind-key "C-c C-i" 'ibuffer)
(bind-key "C-c C-r" 'replace-string)
(bind-key "C-c C-e" 'count-words)
(bind-key* "C-c C-n" 'next-buffer)
(bind-key* "C-c C-p" 'previous-buffer)
(bind-key "C-c C-f" 'lsp-find-definition)
(bind-key "C-c C-m C-m" 'emms-browser)
(bind-key "C-c C-s" 'rgrep)
(bind-key "C-c C-c" 'projectile-find-other-file)
                                        ;"m c" 'emms-stop


   ;; Open stuff
(bind-key* "M-o M-o" 'open-emacs-config)
(bind-key* "C-x C-o C-b" 'open-book)
(bind-key* "M-o M-p" 'open-pictures)
(bind-key* "M-o M-c" 'open-config)

(bind-key* "C-x C-x" 'tmtxt/open-current-dir-in-terminal)

;(bind-key "<escape>" 'keyboard-escape-quit)
(bind-key "`" "\\" )

(define-key input-decode-map [?\C-m] [C-m])
(global-set-key (kbd "<C-m>")   'emms-pause)














;;; Functions that bind directly to keymaps

(defun backward-line ()
    (interactive)
  (forward-line -1))

;; Term
(defun open-term ()
  (interactive)
  (split-window-vertically)
  (eshell))
;; Open config file
(defun open-emacs-config ()
  (interactive)
  (find-file "~/.config/emacs/src/"))
;; Open book folder
(defun open-book ()
  (interactive)
  (find-file "~/Documents/Books"))
;; Open uni folder
(defun open-uni ()
  (interactive)
  (find-file "~/University"))
;; Open C
(defun open-pictures ()
  (interactive)
  (find-file "~/Pictures/"))
;; Open dissertation
(defun open-dissertation ()
  (interactive)
  (find-file "~/Work/"))
;; Open config files
(defun open-config ()
  (interactive)
  (find-file "~/dotfiles/"))
;; New framme
(defun popout ()
  (interactive)
  (make-frame)
  (other-frame 1))

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(defun kill-to-beginning ()
  "Delete backwards until beginning of line is hit"
  (interactive)
  (kill-line 0))

(defun evil-newline ()
  "Insert new line under current one and jump to it"
  (interactive)
  (end-of-line)
  (newline-and-indent))









(provide 'keybinds)

