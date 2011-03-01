;; hippierc.el
;; hippie-expand
;; http://www.emacswiki.org/emacs/HippieExpand
;; デフォルトでインストール済み(?)
(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))

(global-set-key "\C-i" 'hippie-expand)(setq hippie-expand-try-functions-list
     '(yas/hippie-try-expand
        try-complete-abbrev
       try-complete-file-name-partially
       try-complete-file-name
       try-expand-all-abbrevs
       try-expand-dabbrev-all-buffers
       try-expand-dabbrev-from-kill
       try-expand-list try-expand-line
       try-complete-lisp-symbol-partially
       try-complete-lisp-symbol))