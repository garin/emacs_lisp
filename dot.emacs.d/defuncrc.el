;; = defuncrc.el

;; ---------- backward-kill-word-or-kill-region
;; 前の単語を削除する。
;; ただし、リージョンが選択されている場合はリージョンを削除する
(defun backward-kill-word-or-kill-region ()
  (interactive)
  (if mark-active
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)
    ))
(global-set-key "\C-w" 'backward-kill-word-or-kill-region)     ; 前の単語またはリージョンを削除する