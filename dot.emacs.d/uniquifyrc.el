;; = uniquifyrc.el
;; 同じファイル名が複数あるとディレクトリ名を表示する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
