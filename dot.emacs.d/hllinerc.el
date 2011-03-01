;; = hllinerc
; 現在の行に色を付ける
(defface my-hl-line-face
  '((((class color)
      (background dark))    ;; 背景色が暗い色のとき
;     (:background "#808080"))
;     (:background "#1A690C" :foreground "#ffffff"))
     (:background "#1A690C"))
    (((class color)
      (background light))    ;; 背景色が明るい色のとき
     (:background "#000000"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode)
