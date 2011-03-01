;; = datarc : 日付入力
;; 日付
(defun my-get-date-gen (form)
  (insert (format-time-string form))
  (skk-latin-mode t))

(defun my-get-date ()
  (interactive)
  (my-get-date-gen "= [%Y-%m-%d]"))
(defun my-get-dtime ()
  (interactive)
  (my-get-date-gen "= [%Y-%m-%d %H:%M]"))
(defun my-get-time ()
  (interactive)
  (my-get-date-gen "%H:%M:%S"))
(global-set-key "\C-c\C-e" 'my-get-date)
(global-set-key "\C-c\C-d" 'my-get-dtime)
(global-set-key "\C-c\C-t" 'my-get-time)

(defun my-get-jtime ()
  (interactive)
  (my-get-date-gen "%Y-%m-%d (%H:%M): "))
(global-set-key "\C-c\C-r" 'my-get-jtime)
