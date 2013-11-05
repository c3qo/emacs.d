;;;; commonlisp development env setting

;; notes:
;; 1. install sbcl (apt-get in debian or brew in mac)
;; 2. install slime, download it from offical website and zip it in .emacs.d

;; always end a file with a newline
(setq require-final-newline 'query)

;;the path may need to change when switch of between mac and debian
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(add-to-list 'load-path "~/.emacs.d/slime/")
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

;;auto complete using slime
(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
    (if (or (looking-back "^\\s-*") (bolp))
          (call-interactively 'lisp-indent-line)
          (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
 '(progn
    (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))

(require 'init-paredit)
