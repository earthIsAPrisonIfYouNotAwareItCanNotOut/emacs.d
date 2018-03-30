;;; package --- Summar
;;; Commentary:
;;; vim like key binding


;;; package

;;; code:

(require-package 'evil)
(evil-mode 1)
(add-hook 'evil-mode-hook 'paredit-everywhere-mode)

(require-package 'evil-nerd-commenter)
(evilnc-toggle-invert-comment-line-by-line)

(require-package 'general)
(general-evil-setup t)

;; (require-package 'evil-escape)
;; (evil-escape-mode 1)
;; (setq-default evil-escape-delay 0.5)
;; (setq evil-escape-excluded-major-modes '(dired-mode))


;;; Status

(loop for (mode . state) in
      '((minibuffer-inactive-mode . emacs)
        (ggtags-global-mode . emacs)
        (grep-mode . emacs)
        (Info-mode . emacs)
        (term-mode . emacs)
        (sdcv-mode . emacs)
        (anaconda-nav-mode . emacs)
        (log-edit-mode . emacs)
        (vc-log-edit-mode . emacs)
        (magit-log-edit-mode . emacs)
        (inf-ruby-mode . emacs)
        (direx:direx-mode . emacs)
        (yari-mode . emacs)
        (erc-mode . emacs)
        (neotree-mode . emacs)
        (w3m-mode . emacs)
        (gud-mode . emacs)
        (help-mode . emacs)
        (eshell-mode . emacs)
        (shell-mode . emacs)
        ;;(message-mode . emacs)
        (fundamental-mode . emacs)
        (weibo-timeline-mode . emacs)
        (weibo-post-mode . emacs)
        (woman-mode . emacs)
        (sr-mode . emacs)
        (profiler-report-mode . emacs)
        (dired-mode . emacs)
        (compilation-mode . emacs)
        (speedbar-mode . emacs)
        (ivy-occur-mode . emacs)
        (messages-buffer-mode . normal)
        (magit-commit-mode . normal)
        (magit-diff-mode . normal)
        (browse-kill-ring-mode . normal)
        (etags-select-mode . normal)
        (js2-error-buffer-mode . emacs)
        (pdf-annot-list-mode . emacs)
        )
      do (evil-set-initial-state mode state))


;;; Evil search

(setq evil-search-module 'evil-search)


;;; Key

;; evil excape
;; (setq-default evil-escape-key-sequence "kj")

;; make regular expression a vim like
(setq evil-ex-search-vim-style-regexp t)

;; scroll page
(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                                                (interactive)
                                                (evil-scroll-up 0)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                                                (interactive)
                                                (evil-scroll-down 0)))

;; redo
(define-key evil-normal-state-map (kbd "C-r") 'undo-tree-redo)

;; paste in a ring with system clipboard
(fset 'evil-visual-update-x-selection 'ignore)

;; make a shell-like cursor move
(define-key evil-normal-state-map (kbd "C-a") 'evil-first-non-blank)
(define-key evil-insert-state-map (kbd "C-a") 'evil-first-non-blank)
(define-key evil-normal-state-map (kbd "C-e") 'evil-end-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-line)
(define-key evil-motion-state-map (kbd "C-e") 'evil-end-of-line)
(define-key evil-motion-state-map (kbd "C-a") 'evil-first-non-blank)

;; make shell-like delete
(define-key evil-insert-state-map (kbd "C-d") 'delete-backward-char)

;; (define-key evil-insert-state-map (kbd "C-f") 'forward-char)

;; evil-nerd-commenter
(general-define-key :states '(normal visual)
                    :prefix "SPC"
                    ;; comment
                    "cl" 'evilnc-comment-or-uncomment-lines
                    "cv" 'evilnc-toggle-invert-comment-line-by-line
                    )
(general-define-key :states '(normal)
                    :prefix "SPC"
                    "SPC" 'hydra-sb/body  ; hydra index
                    ;; comment
                    "cp" 'evilnc-comment-or-uncomment-paragraphs
                    ;; paredit
                    "pk" 'paredit-kill
                    )

;; expand-region
(define-key evil-visual-state-map (kbd "v") 'er/expand-region)
(after-load "evil"
  '(progn
     (setq expand-region-contract-fast-key "z") ; press z contract
     ))

(provide 'init-evil)

;;; init-evil ends here
