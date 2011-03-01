;; = abbrevrc.el
;; http://www.bookshelf.jp/soft/meadow_34.html
;; C-x a + で登録
;; リージョンを登録: C-q 0 C-x a +
;; どのモードでも使えるように登録: C-q 0 C-x a g
;; 設定ファイルの編集: M-x edit-abbrevs


;; 保存先を指定する(事前に作成する必要あり)
(setq abbrev-file-name "~/.abbrev_defs")
;; 略称展開のキーバインドを指定する
;;(define-key esc-map  " " 'expand-abbrev) ;; M-SPC
;; 起動時に保存した略称を読み込む
(quietly-read-abbrev-file)
;; 略称を保存する
(setq save-abbrevs t)
