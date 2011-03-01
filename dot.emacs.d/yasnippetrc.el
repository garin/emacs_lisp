;; yasnippetrc.el
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;; snippet起動キー
;; (setq yas/trigger-key " ")   ;; 有効にならなかった
(setq yas/trigger-key nil)
(setq yas/trigger-key (kbd "SPC"))
(setq yas/next-field-key (kbd "TAB"))

;; skkモードの時に入力中の文字を確定してからyas/expnadを実行する。
;; max-lisp-eval-depth のエラーで上手く動作しなかった
;; バグ(?): http://code.google.com/p/yasnippet/issues/detail?id=93
;; (defun skk-kakutei-and-yas-expand (&optional arg)
;;   (interactive "P")
;;   (skk-kakutei)
;;   (yas/expand)
;; )
;; (global-set-key [?\C-#] 'skk-kakutei-and-yas-expand)

