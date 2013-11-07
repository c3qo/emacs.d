;; install plugins using el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get/")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
    (url-retrieve-synchronously
      "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(require 'el-get-status)

(setq my-packages
  '(el-get
;     emacs-goodies-el
     ace-jump-mode
     auto-complete
     yasnippet
     smex
     color-theme
     switch-window
     css-mode
     jedi
     flymake-cursor
     python-mode
     paredit
     autopair
     undo-tree
     highlight-parentheses
     highlight-symbol
     init-paredit
     idle-highlight-mode
     ascope
     sr-speedbar
     smart-operator
     session))
(el-get 'sync my-packages)


