;; = goto-chgrc.el
;; http://www.bookshelf.jp/soft/meadow_44.html#SEC673
;;http://www.emacswiki.org/emacs/download/goto-chg.el
(require 'goto-chg)
(define-key global-map (kbd "<f8>") 'goto-last-change)
(define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)