;; textadjustrc
;; ----- 日本語整形
;; http://taiyaki.org/elisp/mell/src/mell.el
;; http://taiyaki.org/elisp/text-adjust/src/text-adjust.el
;;     text-adjust-codecheck : 半角カナ, 規格外文字を「〓」に置き換える.
;;     text-adjust-hankaku   : 全角英数文字を半角にする.
;;     text-adjust-kutouten  : 句読点を「, 」「. 」に置き換える.
;;     text-adjust-space     : 全角文字と半角文字の間に空白を入れる.
;;     text-adjust           : これらをすべて実行する.
;;     text-adjust-fill      : 句読点優先で, fill-region をする.
(require 'text-adjust)
(global-set-key "\C-xaa" 'text-adjust-all-and-save)
(global-set-key "\C-xas" 'text-adjust-space-buffer)
(global-set-key "\C-xad" 'delete-whitespace-and-whiteline)  ;; 行末の空白と文末の空行を削除する

;; テキスト整形を全て実施しバッファをセーブする
(defun text-adjust-all-and-save (&optional arg)
  (interactive "P")
  (text-adjust-space-buffer)
  (delete-whitespace-and-whiteline)
  (save-buffer)
  (message "text-adjust and buffer save done")
  )

;; 行末の空白と文末の空行を削除する
(defun delete-whitespace-and-whiteline (&optional arg)
  (interactive "P")
  (delete-trailing-whitespace)
  (delete-end-of-sentence-whiteline)
  )

;; 文末の空行を削除する
(defun delete-end-of-sentence-whiteline (&optional arg)
  (interactive "P")
  (setq npoint (point))
  (end-of-buffer)
  (previous-line)
  (delete-blank-lines)
  (goto-char npoint)
  )