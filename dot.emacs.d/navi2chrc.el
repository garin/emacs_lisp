;; Navi2ch

(require 'navi2ch)
(require 'navi2ch-mona)
;(require 'navi2ch-migemo)
(add-hook 'navi2ch-article-arrange-message-hook
        'navi2ch-mona-arrange-message)
;(setq navi2ch-net-http-proxy "192.168.0.1:8080") ;; 環境変数 HTTP_PROXY="http://192.168.0.1:8080" で対応
(setq navi2ch-mona-enable-board-list '("mona"))  ;; モナフォント
(setq navi2ch-list-bbstable-url "http://menu.2ch.net/bbsmenu.html")

