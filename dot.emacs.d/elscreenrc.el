;; =  elscreenrc
(load "elscreen" "ElScreen" t)

;; プレフィックスキー
(elscreen-set-prefix-key "\C-t")
;; タブ機能オン ;; default: t
(setq elscreen-display-tab t)
;; 左端にタブ生成ボタン [!] を表示
(setq elscreen-tab-display-create-screen nil)
;; 左端にタブ消去ボタン [X] を表示
(setq elscreen-tab-display-kill-screen nil)
;; 左端にコントロールバー<->を表示
(setq elscreen-tab-display-control nil)     
