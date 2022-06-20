
;;; Pdf

(use-package pdf-tools
  :init
  (pdf-loader-install)
  (setq pdf-view-use-scaling t)
  (setq-default pdf-view-display-size 'fit-page)
  ;; The following helps if image is blurry
  (defadvice pdf-info-renderpage (before double-width-arg activate)
    (ad-set-arg 1 (* 2 (ad-get-arg 1))))

  :config

  ;; Add retina support for MacOS users
  (eval-when! IS-MAC
              (defun +pdf-view-create-page-a (page &optional window)
                "Create an image of PAGE for display on WINDOW."
                :override #'pdf-view-create-page
                (let* ((size (pdf-view-desired-image-size page window))
                       (width (if (not (pdf-view-use-scaling-p))
                                  (car size)
                                (* 2 (car size))))
                       (data (pdf-cache-renderpage
                              page width width))
                       (hotspots (pdf-view-apply-hotspot-functions
                                  window page size)))
                  (pdf-view-create-image data
                                         :width width
                                         :scale (if (pdf-view-use-scaling-p) 0.5 1)
                                         :map hotspots
                                         :pointer 'arrow)))

              (defvar +pdf--scaled-p nil)
              (defadvice! +pdf--scale-up-on-retina-display-a (orig-fn &rest args)
                "Scale up the PDF on retina displays."
                :around #'pdf-util-frame-scale-factor
                (cond ((not pdf-view-use-scaling) 1)
                      ((and (memq (pdf-view-image-type) '(imagemagick image-io))
                            (fboundp 'frame-monitor-attributes))
                       (funcall orig-fn))
                      ;; Add special support for retina displays on MacOS
                      ((and (eq (framep-on-display) 'ns)
                            (not +pdf--scaled-p)
                            EMACS27+)
                       (setq-local +pdf--scaled-p t)
                       2)
                      (1)))

              (defadvice! +pdf--use-scaling-on-ns-a ()
                :before-until #'pdf-view-use-scaling-p
                (and (eq (framep-on-display) 'ns)
                     EMACS27+))

              (defadvice! +pdf--supply-width-to-create-image-calls-a (orig-fn &rest args)
                :around '(pdf-annot-show-annotation
                          pdf-isearch-hl-matches
                          pdf-view-display-region)
                (letf! (defun create-image (file-or-data &optional type data-p &rest props)
                         (apply create-image file-or-data type data-p
                                :width (car (pdf-view-image-size))
                                props))
                       (apply orig-fn args))))

  )

(setq TeX-view-program-selection '((output-pdf "pdf-tools"))
      TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view"))
      TeX-source-correlate-mode t
      TeX-source-correlate-start-server t
      )

;; Update PDF buffers after successful LaTeX runs
;;Autorevert works by polling the file-system every auto-revert-interval seconds, optionally combined with some event-based reverting via file notification. But this currently does not work reliably, such that Emacs may revert the PDF-buffer while the corresponding file is still being written to (e.g. by LaTeX), leading to a potential error.

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)



(setq doc-view-resolution 200)
;; Open pdfs in emacs
(add-hook 'org-mode-hook
          '(lambda ()
             (setq org-file-apps
                   (append '(
                             ("\\.pdf\\'" . emacs)
                             ) org-file-apps ))))

(use-package nov)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(provide 'pdf)

