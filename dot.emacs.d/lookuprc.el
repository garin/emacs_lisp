;; ----- lookuprc
(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)
;; キーバインドの設定
(define-key ctl-x-map "l" 'lookup)                        ; C-x l
(define-key ctl-x-map "y" 'lookup-region)                 ; C-x y
(define-key ctl-x-map "w" 'lookup-pattern)                ; C-x w
;(setq lookup-search-agents '((ndtp "localhost") (ndspell)))
;; 辞書
(setq lookup-search-agents
      '(
        (ndeb "/home/XXX/save/epwing/genius")
        (ndeb "/home/XXX/save/epwing/daijirin")
        (ndeb "/home/XXX/save/epwing/wikipedia")
;        (ndeb "~/.emacs.d/dic/WDIC")
        ))
