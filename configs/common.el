;;;; common config

;;Personal information
(setq user-full-name "moroumo")
(setq user-mail-address "moroumo@gmail.com")

;; Add plugins to load-path.
;; We will put some tiny plugins in it
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/configs")

;; install plugins
(load "~/.emacs.d/configs/install.el")

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format "emacs@%b")

;; default to unified diffs
(setq diff-switches "-u")

;show the line number for buffer
(require 'linum)    ;M-x linum-mode
(global-linum-mode 1)

(tool-bar-mode -1)  ;close emacs toolbar
(menu-bar-mode -1)   ;close emacs menubar
(setq visible-bell nil)
(setq inhibit-startup-message t)
(setq column-number-mode t)
(setq mouse-yank-at-point t)
(setq kill-ring-max 200)
;(setq default-major-mode 'text-mode)
;; Disable the welcome message
(setq inhibit-startup-message t)
;; Display time
(display-time)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;; Use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)
;; Make the mouse wheel scroll Emacs
(mouse-wheel-mode t)
;; move the mouse pointer when cursor is near the mouse pointer
(setq mouse-avoidance-mode 'animate)
;;set cursor as a bar showing
(setq-default cursor-type 'bar)

(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

;ido
(require 'ido)
(ido-mode t)

;; set new method of kill a whole line 
(defadvice kill-ring-save (before slickcopy activate compile)
           "When called interactively with no active region, copy a single line instead."
           (interactive
             (if mark-active (list (region-beginning) (region-end))
               (list (line-beginning-position)
                     (line-beginning-position 2)))))

(defadvice kill-region (before slickcut activate compile)
           "When called interactively with no active region, kill a single line instead."
           (interactive
             (if mark-active (list (region-beginning) (region-end))
               (list (line-beginning-position)
                     (line-beginning-position 2)))))
;;auto-complete
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete/")

(add-to-list 'load-path "~/.emacs.d/el-get/popup/")
(require 'auto-complete)
(global-auto-complete-mode)

(add-to-list 'load-path
             "~/.emacs.d/el-get/yasnippet/")
(require 'yasnippet)
(yas-global-mode 1)

(setq ace-jump-mode-case-fold t)
(setq ace-jump-mode-scope 'window) ; limit scope to current buffer(window)
(setq ace-jump-mode-submode-list
      '(ace-jump-word-mode ; C-c SPC
         ace-jump-line-mode ; C-u C-c SPC
         ace-jump-char-mode)) ; C-u C-u C-c SPC
;; you can select the key you prefer to
(global-set-key (kbd "M-l") 'ace-jump-mode)

;; undo tree
(add-to-list 'load-path "~/.emacs.d/el-get/undo-tree/")
(require 'undo-tree)
(global-undo-tree-mode)
;
;; session
(add-to-list 'load-path "~/.emacs.d/el-get/session/")
(require 'session)
(progn
  (if (not (daemonp))
    (progn
      (add-hook 'after-init-hook 'session-initialize)
      (load "desktop")
      (setq desktop-path '("."))
      (desktop-save-mode))))

; smex
(add-to-list 'load-path "~/.emacs.d/el-get/smex/")
(require 'smex)
(setq smex-save-file "~/.emacs.d/.smex-items")
;(global-set-key [(meta x)] (lambda ()
;                             (interactive)
;                             (or (boundp 'smex-cache)
;                                 (smex-initialize))
;                             (global-set-key [(meta x)] 'smex)
;                             (smex)))
;
;(global-set-key [(shift meta x)] (lambda ()
;                                   (interactive)
;                                   (or (boundp 'smex-cache)
;                                       (smex-initialize))
;                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
;                                   (smex-major-mode-commands)))
(setq debug-on-error t)
(cond 
  ((= 24 emacs-major-version)
   (progn
     (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
     (load-theme 'solarized-dark t)))
   ((= 23 emacs-major-version)
    (progn
      (require 'color-theme)
      (eval-after-load "color-theme"
                       '(progn
                          (color-theme-initialize)
                          (color-theme-subtle-hacker))))))
(ansi-color-for-comint-mode-on)

;;auto-pair and highlight-parentheses
(require 'highlight-parentheses)
(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
                     (if autopair-handle-action-fns
                       autopair-handle-action-fns
                       '(autopair-default-handle-action))
                     '((lambda (action pair pos-before)
                         (hl-paren-color-update)))))))

(add-to-list 'load-path "~/.emacs.d/el-get/sr-speedbar/")
(require 'sr-speedbar)

(global-set-key (kbd "<f8>") (lambda()
                               (interactive)
                               (sr-speedbar-toggle)))


;highlight-symbol
(add-to-list 'load-path "~/.emacs.d/el-get/highlight-symbol/")
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev) 
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)
 
;idle-highlight-mode
(add-to-list 'load-path "~/.emacs.d/el-get/idle-highlight-mode/")
(add-hook 'find-file-hook 'idle-highlight-mode)

;highlight line
(global-hl-line-mode)
