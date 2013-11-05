(add-to-list 'load-path "~/.emacs.d/el-get/python-mode/")
(require 'python-mode)

(add-hook 'python-mode-hook 'jedi:setup)

(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "pycheckers"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))
(load-library "flymake-cursor")
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)

(add-to-list 'load-path "~/.emacs.d/el-get/ascope/")
(require 'ascope)
(global-set-key [?\M-*] 'ascope-pop-mark)
(global-set-key [?\M-,] 'ascope-find-this-text-string)
(global-set-key [?\M-.] 'ascope-find-this-symbol)

;(ascope-init)
