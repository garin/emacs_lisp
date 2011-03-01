;; = pointundorc.el
;; point 位置を戻す
;; http://www.emacswiki.org/cgi-bin/wiki/download/point-undo.el
(require 'point-undo)
;(define-key global-map "\C-xp" 'point-undo)
;(define-key global-map "\C-xP" 'point-redo)
(define-key global-map [f9] 'point-undo)
(define-key global-map [S-f9] 'point-redo)
