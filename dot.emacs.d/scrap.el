;; save-to-point : 現在のpoint位置を保存
(defun point-to-save (&optional arg)
  (interactive "P")
  (setq my-save-point (point))
  (message "save point"))
(define-key global-map "\C-xp" 'point-to-save)

;; toggle-to-point : 保存したpointと現在のpointと行き来する
(defun toggle-to-point (&optional arg)
  (interactive "P")
  (setq save-point-new (point))
  (goto-char save-point)
  (setq save-point save-point-new)
  )

(defun toggle-save-point (&optional arg)
  (interactive "P")
  (if (my-save-point)
      (message "aruyo")
    (message "naiyo2"))
  )
(define-key global-map "\C-xt" 'toggle-to-point)


;; C-x p(oint to register) で現在のカーソルをレジスタに保存
;; (defun point-to-register-t (&optional arg)
;;   (interactive "P")
;;   (point-to-register ?t))
;; (define-key global-map "\C-xp" 'point-to-register-t)
;; 
;; ;; C-x g(o to register) で直近に保存したレジスタに移動
;; (defun jump-to-register-t (&optional arg)
;;   (interactive "P")
;;   (jump-to-register ?t))
;; (define-key global-map "\C-xg" 'jump-to-register-t)
;; 
;; ;; C-tt で現在のポイントとレジスタを入れ替える
;; (defun jump-to-register-t (&optional arg)
;;   (interactive "P")
;;   (point-to-register point))
;;   (jump-to-register ?t))
;; 
;; ;; 現在のポイントを保存、レジスタの場所に移動、保存したポイントをレジスタに登録
;; ;; 試験用のlisp設定ファイル



;;; タブ, 全角スペースを表示する
;;;　
(defface my-face-b-1 '((t (:background "orange red"))) nil)
(defface my-face-b-2 '((t (:background "SteelBlue"))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)


;; bm.el
;; (require 'bm)
;; (global-set-key (kbd "<C-f8>") 'bm-toggle)
;; (global-set-key (kbd "<f8>")   'bm-next)
;; (global-set-key (kbd "<S-f8>") 'bm-previous)
