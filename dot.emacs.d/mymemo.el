;; = mymemo.el

;; 必要に応じてキーバインドを追加
(global-set-key "\C-cm" 'my-memo)
(global-set-key "\C-c." 'my-memo-open)
(setq my-memo-dir "~/.memo")

(defun my-memo-today-file()
  (setq today_file
	(expand-file-name (format-time-string "%Y%m%d.txt") my-memo-dir))
  today_file
)

; 今日のメモファイルを開く
(defun my-memo-open (&optional arg)
  (interactive "P")
  (find-file (my-memo-today-file))
  (end-of-buffer)  
)

(defun my-memo (&optional arg)
  (interactive "P")
  (my-memo-open)
  (insert
   (concat
    (format-time-string "\n= [%Y-%m-%d] %k:%M:%S [memo] ")))
)

