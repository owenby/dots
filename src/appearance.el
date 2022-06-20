Content-Type: text/enriched
Text-Width: 70


;; <x-color><param>#6f7787</param>Set default font
</x-color>(set-face-attribute 'default nil
                    ;; <x-color><param>#6f7787</param>:family "Iosevka Term"
</x-color>                    <x-color><param>#81A1C1</param>:family</x-color> <x-color><param>#A3BE8C</param>"Iosevka Comfy"</x-color>
                    <x-color><param>#81A1C1</param>:height</x-color> 175
                    <x-color><param>#81A1C1</param>:weight</x-color> 'light
                    <x-color><param>#81A1C1</param>:width</x-color> 'normal)


;; <x-color><param>#6f7787</param>(use-package all-the-icons)

</x-color>

;; <x-color><param>#6f7787</param>(use-package highlight-indent-guides
</x-color>  ;; <x-color><param>#6f7787</param>:defer nil
</x-color>  ;; <x-color><param>#6f7787</param>:config
</x-color>  ;; <x-color><param>#6f7787</param>(setq highlight-indent-guides-method 'character)
</x-color>  ;; <x-color><param>#6f7787</param>(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
</x-color>  ;; <x-color><param>#6f7787</param>)

</x-color>

;;; <x-color><param>#6f7787</param>POWER

</x-color>

(<x-color><param>#81A1C1</param>use-package</x-color> <x-color><param>#81A1C1</param>kaolin-themes</x-color>
  <x-color><param>#81A1C1</param>:defer</x-color> nil
  <x-color><param>#81A1C1</param>:config</x-color>
  ;; <x-color><param>#6f7787</param>(load-theme 'kaolin-temple t)
</x-color>  ;; <x-color><param>#6f7787</param>(load-theme 'kaolin-breeze t)
</x-color>  ;; <x-color><param>#6f7787</param>(load-theme 'kaolin-valley-light t)
</x-color>  ;; <x-color><param>#6f7787</param>(kaolin-treemacs-theme)

</x-color>  )



(<x-color><param>#81A1C1</param>use-package</x-color> <x-color><param>#81A1C1</param>doom-themes</x-color>

  <x-color><param>#81A1C1</param>:config</x-color>

  (load-theme 'doom-nord t))



;;; <x-color><param>#6f7787</param>FOLDING
</x-color>(<x-color><param>#81A1C1</param>use-package</x-color> <x-color><param>#81A1C1</param>hideshow</x-color>
  <x-color><param>#81A1C1</param>:hook</x-color> (prog-mode . hs-minor-mode)
  <x-color><param>#81A1C1</param>:bind</x-color> (<x-color><param>#81A1C1</param>:map</x-color> hs-minor-mode-map
              (<x-color><param>#A3BE8C</param>"C-c  C"</x-color> . hs-toggle-hiding)))
(<x-color><param>#81A1C1</param>use-package</x-color> <x-color><param>#81A1C1</param>bicycle</x-color>
  <x-color><param>#81A1C1</param>:after</x-color> outline
  <x-color><param>#81A1C1</param>:bind</x-color> (<x-color><param>#81A1C1</param>:map</x-color> outline-minor-mode-map
              (<x-color><param>#A3BE8C</param>"<<C-tab>"</x-color> . bicycle-cycle)
              (<x-color><param>#A3BE8C</param>"<<backtab>"</x-color> . bicycle-cycle-global)))
;;;; <x-color><param>#6f7787</param>Display hex colors in emacs
</x-color>(<x-color><param>#81A1C1</param>use-package</x-color> <x-color><param>#81A1C1</param>rainbow-mode</x-color>
  <x-color><param>#81A1C1</param>:defer</x-color> t <x-color><param>#81A1C1</param>:commands</x-color> (rainbow-mode))


;;; <x-color><param>#6f7787</param>Modeline

</x-color>


;; <x-color><param>#6f7787</param>(defun mode-line-fill (face reserve)
</x-color>;;   <x-color><param>#6f7787</param>"Return empty space using FACE and leaving RESERVE space on the right."
</x-color>;;   <x-color><param>#6f7787</param>(unless reserve
</x-color>;;     <x-color><param>#6f7787</param>(setq reserve 20))
</x-color>;;   <x-color><param>#6f7787</param>(when (and window-system (eq 'right (get-scroll-bar-mode)))
</x-color>;;     <x-color><param>#6f7787</param>(setq reserve (- reserve 3)))
</x-color>;;   <x-color><param>#6f7787</param>(propertize " "
</x-color>;;               <x-color><param>#6f7787</param>'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
</x-color>;;               <x-color><param>#6f7787</param>'face face))

</x-color>

;; <x-color><param>#6f7787</param>(setq-default mode-line-format (list
</x-color>;;                                 <x-color><param>#6f7787</param>" "
</x-color>;;                                 <x-color><param>#6f7787</param>'mode-name
</x-color>;;                                 <x-color><param>#6f7787</param>"   "
</x-color>;;                                 <x-color><param>#6f7787</param>'(:eval (abbreviate-file-name default-directory))
</x-color>;;                                 <x-color><param>#6f7787</param>'mode-line-buffer-identification
</x-color>;;                                 <x-color><param>#6f7787</param>"   "
</x-color>;;                                 <x-color><param>#6f7787</param>"%l:%c"
</x-color><x-color><param>#84686E</param>;;                                 'mode-line-misc-info
;;                                 ;; 'buffer-file-name
;;                                 ;; 'mode-line-modes
;;                                 ;; `(vc-mode vc-mode)
;;                                ;; Fill until the end of line but 10 characters
;;                                 ;; (mode-line-fill 'mode-line 8)

</x-color>                                

<x-color><param>#84686E</param>;;                                 ))

</x-color>








(<x-color><param>#c86d6d</param>use-package</x-color> <x-color><param>#cea2ca</param>tree-sitter-langs</x-color>
  <x-color><param>#feb193</param>:defer</x-color> nil)



(<x-color><param>#c86d6d</param>use-package</x-color> <x-color><param>#cea2ca</param>tree-sitter</x-color>
  <x-color><param>#feb193</param>:config</x-color>
  (<x-color><param>#c86d6d</param>require</x-color> '<x-color><param>#cea2ca</param>tree-sitter-langs</x-color>)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))







<x-color><param>#84686E</param>;; (defgroup toggle-theme nil "The group of customizations for the toggle-theme library."
;;   :prefix "toggle-theme/" :group 'mp)

</x-color>

<x-color><param>#84686E</param>;; (defcustom default-theme 'kaolin-valley-dark "This theme is loaded when the library is loaded.")

;; (defcustom light-theme 'kaolin-mono-light "The standard light theme when toggling themes."
;;   :group 'toggle-theme)

;; (defcustom dark-theme 'kaolin-mono-dark "The standard dark theme when toggling themes."
;;   :group 'toggle-theme)

;; (defvar mp/current-theme default-theme "This library keeps track of the currently loaded theme via this variable.")

</x-color>





<x-color><param>#84686E</param>;; (defun mp/theme-toggle ()
;;   "Toggle between dark and light theme."
;;   (interactive)
;;   (let ((newtheme nil))
;;     (if (eq light-theme mp/current-theme)
;; 	(setq newtheme dark-theme)
;;       (setq newtheme light-theme)
;;       )
;;     (disable-theme mp/current-theme)
;;     (setq mp/current-theme newtheme)

</x-color>    

<x-color><param>#84686E</param>;;     (load-theme newtheme t)
;;     )
;;   )

</x-color>

<x-color><param>#84686E</param>;; (define-key global-map (kbd "<<f2>") #'mp/theme-toggle)

</x-color>

<x-color><param>#84686E</param>;; (load-theme default-theme t)

</x-color>







<x-color><param>#84686E</param>;;; MY STUFF
</x-color>(<x-color><param>#c86d6d</param>defvar</x-color> <x-color><param>#cea2ca</param>gv/is-termux</x-color>
  (string-suffix-p
   <x-color><param>#A1A0C5</param>"Android"</x-color> (string-trim (shell-command-to-string <x-color><param>#A1A0C5</param>"uname -a"</x-color>)))
  <x-color><param>#787096</param>"Truthy value indicating if Emacs is currently running in termux."</x-color>)
(<x-color><param>#c86d6d</param>defvar</x-color> <x-color><param>#cea2ca</param>gv/is-terminal</x-color>
  (not window-system)
  <x-color><param>#787096</param>"Truthy value indicating if Emacs is currently running in a terminal."</x-color>)
(<x-color><param>#c86d6d</param>defvar</x-color> <x-color><param>#cea2ca</param>gv/my-system</x-color>
  (<x-color><param>#c86d6d</param>if</x-color> (string-equal user-login-name <x-color><param>#A1A0C5</param>"gavinok"</x-color>)
      t
    nil)
  <x-color><param>#787096</param>"Non-nil value if this is my system."</x-color>)


<x-color><param>#84686E</param>;;; MODELINE
</x-color>(<x-color><param>#c86d6d</param>unless</x-color> gv/is-termux
  (<x-color><param>#c86d6d</param>require</x-color> '<x-color><param>#cea2ca</param>battery</x-color>))
(<x-color><param>#c86d6d</param>defun</x-color> <x-color><param>#A1DDD7</param>simple-mode-line-render</x-color> (left right)
  <x-color><param>#787096</param>"Return a string of `<x-color><param>#cea2ca</param>window-width</x-color>' length.
Containing LEFT, and RIGHT aligned respectively."</x-color>
  (<x-color><param>#c86d6d</param>let</x-color> ((available-width
         (- (window-total-width)
            (+ (length (format-mode-line left))
               (length (format-mode-line right))))))
    (append left
            (list (format (format <x-color><param>#A1A0C5</param>"%%%ds"</x-color> available-width) <x-color><param>#A1A0C5</param>" "</x-color>))
            right)))
(<x-color><param>#c86d6d</param>unless</x-color> gv/is-terminal
  (<x-color><param>#c86d6d</param>setq-default</x-color> left-margin-width 0)
  (<x-color><param>#c86d6d</param>setq-default</x-color> right-margin-width 0))
(set-window-buffer nil (current-buffer))
(<x-color><param>#c86d6d</param>setq-default</x-color> mode-line-format
      '((<x-color><param>#feb193</param>:eval</x-color>
         (format-mode-line
          (simple-mode-line-render
           <x-color><param>#84686E</param>;; Left
</x-color>           '(<x-color><param>#A1A0C5</param>" "</x-color>
             (<x-color><param>#feb193</param>:eval</x-color> (propertize
                     (<x-color><param>#c86d6d</param>if</x-color> (<x-color><param>#c86d6d</param>and</x-color> (not buffer-read-only) (buffer-modified-p))
                         <x-color><param>#A1A0C5</param>"● "</x-color>
                       <x-color><param>#A1A0C5</param>"  "</x-color> ) <x-color><param>#f3c91f</param>'face 'error))</x-color>
             mode-line-buffer-identification
             <x-color><param>#84686E</param>;; value of current line number
</x-color>             <x-color><param>#A1A0C5</param>" %l:%c"</x-color>
             (<x-color><param>#feb193</param>:eval</x-color> (propertize
                     (concat <x-color><param>#A1A0C5</param>" %p%%"</x-color> <x-color><param>#A1A0C5</param>" "</x-color>
                             <x-color><param>#84686E</param>;; (if god-local-mode " 😇 " "  ")
</x-color>                             <x-color><param>#A1A0C5</param>" ( %m ) "</x-color>) <x-color><param>#f3c91f</param>'face 'shadow))</x-color>
             mode-line-misc-info
             )
           <x-color><param>#84686E</param>;; Right
</x-color>           '((<x-color><param>#feb193</param>:eval</x-color> (propertize
                     (format-time-string <x-color><param>#A1A0C5</param>"%a, %b %d %I:%M%p"</x-color>)
                     'face 'font-lock-keyword-face))
             <x-color><param>#A1A0C5</param>" "</x-color>
             (<x-color><param>#feb193</param>:eval</x-color> (<x-color><param>#c86d6d</param>unless</x-color> gv/is-termux
                      (battery-format
                       <x-color><param>#A1A0C5</param>"[%p]"</x-color>
                       (funcall battery-status-function))) )
             <x-color><param>#A1A0C5</param>"    "</x-color>))))))







  <x-color><param>#84686E</param>;; (load-user-file "lisp/spaceway/spaceway-theme.el")
</x-color>  <x-color><param>#84686E</param>;; (global-hl-line-mode t)
</x-color>  <x-color><param>#84686E</param>;; (set-cursor-color "#dc322f")
</x-color>  <x-color><param>#84686E</param>;; (when gv/my-system
</x-color>  <x-color><param>#84686E</param>;;   (set-frame-parameter (selected-frame) 'alpha '(100 100))
</x-color>  <x-color><param>#84686E</param>;;   (add-to-list 'default-frame-alist '(alpha 100 100)))
</x-color>  <x-color><param>#84686E</param>;; (load-theme 'spaceway t)

</x-color>



<x-color><param>#84686E</param>;;; ORG
;; (load (concat user-emacs-directory
</x-color>              <x-color><param>#84686E</param>;; "lisp/org-config.el"))

</x-color>

(<x-color><param>#c86d6d</param>use-package</x-color> <x-color><param>#cea2ca</param>fish-completion</x-color>
  <x-color><param>#feb193</param>:after</x-color> eshell
  <x-color><param>#feb193</param>:config</x-color>
  (<x-color><param>#c86d6d</param>when</x-color> (<x-color><param>#c86d6d</param>and</x-color> (executable-find <x-color><param>#A1A0C5</param>"fish"</x-color>)
             (<x-color><param>#c86d6d</param>require</x-color> '<x-color><param>#cea2ca</param>fish-completion</x-color> nil t)))
  (global-fish-completion-mode))





(<x-color><param>#c86d6d</param>provide</x-color> '<x-color><param>#cea2ca</param>appearance</x-color>)

