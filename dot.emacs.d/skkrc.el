;; = skkrc.el
;; Main configuration file is ~/.skk

;; ----- skk 日本語入力モード
;(global-set-key "\C-x\C-j" 'skk-kakutei)
(global-set-key "\C-l" 'skk-kakutei)
(global-set-key "\C-xj" 'skk-kakutei)
(global-set-key "\C-cu" 'skk-undo-kakutei)

;; ----- アイコンの表示
(setq skk-show-icon t)
;; ----- azik
;(setq skk-use-azik t)

;; ----- 送り仮名の厳密度
(setq skk-process-okuri-early nil)           ;; 送りありエントリのみを表示する
(setq skk-henkan-strict-okuri-precedence t)  ;; 送りありエントリを優先する

;; ----- 自動確定
(setq skk-kakutei-when-unique-candidate t)   ;; 候補が1つしかない時に自動で確定する
(setq skk-kakutei-search-prog-limit 10)      ;; 候補として検索するskk-search-prog-listの上限
;(setq skk-kakutei-jisyo )                 ;; 確定専用辞書の候補に一致すれば確定(http://www.bookshelf.jp/texi/skk/skk_5.html#SEC90)

;; ----- スティッキービット
;; \ で漢字入力モードになる
;; http://mail.ring.gr.jp/skk/200801/msg00005.html
(setq skk-sticky-key "\\")
(require 'skk-sticky)

;; ----- モードホック
(setq text-mode-hook  'skk-mode)
(setq php-mode-hook   'skk-mode)
(setq lisp-mode-hook  'skk-mode)
;(setq ruby-mode-hook  'skk-mode)
;(setq howm-mode-hook 'skk-mode)


;; ---- skk-abbrev-mode の確定時に半角スペースを付加
(defun skk-kakutei-ex (&optional arg)
  (interactive "P")
  (setq skk-abbrev-mode-flg skk-abbrev-mode)
  (skk-kakutei arg)
  (if skk-abbrev-mode-flg
      (if (string-match "[a-zA-Z]" (char-to-string (char-before)))
	  (unless (string-match " " (char-to-string (following-char)))
	    (insert ""))))
      )

;(defun skk-kakutei-ex()
;  (interactive)
;  (setq str (char-to-string (char-before)))
;  (if (string-match "[a-zA-Z]" (char-to-string (char-before)))
;      (unless (string-match " " (char-to-string (following-char)))
;	(insert " ")) )
;  )



;; viewモードのjと被るので使用しない
;(key-chord-define-global "jj"  'skk-kakutei)

;; skk-mode が事前に有効でないとうまく動かない
(skk-mode)
;; (key-chord-define skk-j-mode-map       "jj" 'skk-kakutei-ex)
;; (key-chord-define skk-latin-mode-map   "jj" 'skk-kakutei-ex)
;; (key-chord-define skk-abbrev-mode-map  "jj" 'skk-kakutei-ex)
;; (key-chord-define skk-jisx0208-latin-mode-map "jj" 'skk-kakutei-ex)


;; --- skk-abbrev-mode
;; skkのabbrevモードを無効にして、skk-abbrev-mode 中の <SPC> を
;; 単純な半角スペースにする。

;; 半角スペースを入力
(defun skk-space (&optional arg)
  (interactive "P")
  (insert " "))

;; -- skk-abbrev-mode時に入力した文字をcapitalizeする
;; skk.el の skk-toggle-character を書き換え
(defun skk-toggle-capitalize (arg)
  "skk-abbrev-mode時に入力した文字をcapitalizeする"
  (interactive "P")
  (cond
   ((eq skk-henkan-mode 'on)
    (let (char)
      (skk-save-point
       (goto-char skk-henkan-start-point)
       (while (and (>= skk-save-point (point))
                   ;; (not (eobp))
                   (or
                    ;; "ー" では文字種別が判別できないので、ポイントを進める。
                    (looking-at "ー")
                    (eq 'unknown (setq char (skk-what-char-type)))))
         (forward-char 1)))
      (skk-henkan-skk-region-by-func
       (cond ((eq char 'ascii) #'capitalize-region))
       ;; `skk-katakana-region' の引数 VCONTRACT または
       ;; `skk-hiragana-region' の引数 VEXPAND を与える。
       (memq char '(hiragana katakana)))))
   ((and (skk-in-minibuffer-p)
         (not skk-j-mode))
    ;; ミニバッファへの初突入時。
    (skk-j-mode-on))
   (t
    (setq skk-katakana (not skk-katakana))))
  (skk-kakutei)
  nil)


;; -- skk-abbrev-mode時に入力した文字をupppercaseにする
;; skk.el の skk-toggle-character を書き換え
(defun skk-toggle-uppercase (arg)
  "skk-abbrev-mode時に入力した文字をuppercaseにする"
  (interactive "P")
  (cond
   ((eq skk-henkan-mode 'on)
    (let (char)
      (skk-save-point
       (goto-char skk-henkan-start-point)
       (while (and (>= skk-save-point (point))
                   ;; (not (eobp))
                   (or
                    ;; "ー" では文字種別が判別できないので、ポイントを進める。
                    (looking-at "ー")
                    (eq 'unknown (setq char (skk-what-char-type)))))
         (forward-char 1)))
      (skk-henkan-skk-region-by-func
       (cond ((eq char 'ascii) #'upcase-region))
       ;; `skk-katakana-region' の引数 VCONTRACT または
       ;; `skk-hiragana-region' の引数 VEXPAND を与える。
       (memq char '(hiragana katakana)))))
   ((and (skk-in-minibuffer-p)
         (not skk-j-mode))
    ;; ミニバッファへの初突入時。
    (skk-j-mode-on))
   (t
    (setq skk-katakana (not skk-katakana))))
  (skk-kakutei)
  nil)


;; 1度変換して確定する
(defun skk-abbrev-henkan-kakutei (&optional arg)
  (interactive "P")
  (skk-start-henkan arg)
  (skk-kakutei))

;; hippie-expand で展開してから確定する
(defun skk-abbrev-kautei-hippie-expand (&optional args)
  (interactive "P")
  (hippie-expand args)
  (skk-kakutei))

;; skk-macs.el の skk-abbrev-mode-on を上書き
(defun skk-abbrev-mode-on ()
  (setq skk-mode t
        skk-abbrev-mode t
        skk-latin-mode nil
        skk-j-mode nil
        skk-jisx0208-latin-mode nil
        skk-jisx0201-mode nil
        )
  (skk-setup-keymap)
  ; skk-setup-keymap のあとでキーを追加
  (define-key skk-abbrev-mode-map " " 'skk-space)

  ;; abbrevのトグルを「半角←→全角」ではなく、「先頭を大文字(capitalize)」に変更
  (define-key skk-abbrev-mode-map "\C-q" 'skk-toggle-capitalize)

  ;; C-@ で小文字→大文字に変換する
  (define-key skk-abbrev-mode-map "\C-@" 'skk-toggle-uppercase)

  ;; abbrev-modeの時は\で確定にする
  ;; **注** .skkでz-\で\を入力できるように設定する
  (define-key skk-abbrev-mode-map "\\" 'skk-kakutei-ex)
  ;; skk-abrev-mode 時に C-i でアスキー文字列変換をする  ;;(define-key skk-abbrev-mode-map "\C-i" 'skk-start-henkan)
;;  (define-key skk-abbrev-mode-map "\C-i" 'skk-abbrev-henkan-kakutei)
  (define-key skk-abbrev-mode-map "\C-i" 'skk-abbrev-kautei-hippie-expand)
  (skk-update-modeline 'abbrev)
  (skk-cursor-set))

; (define-key skk-abbrev-mode-map "\C-q" 'skk-toggle-characters)

;; skk-abrev-mode時のnext-line,previouse-line
(defun skk-abbrev-next-line (&optional arg)
  (interactive "P")
  (skk-kakutei)
  (next-line))

(defun skk-abbrev-previous-line (&optional arg)
  (interactive "P")
  (skk-kakutei)
  (previous-line))

(define-key skk-abbrev-mode-map "\C-n" 'skk-abbrev-next-line)
(define-key skk-abbrev-mode-map "\C-p" 'skk-abbrev-previous-line)

;; 漢字モードの時に c で確定する(間違えて▽モードに入った時は c を押せばよい)
(define-key skk-j-mode-map "c" 'skk-kakutei-ex)

;; 漢字モードの時に C-c C-[alo] で rd のリスト表記を行う
(defun skk-kakutei-and-rd-same-level-item (&optional arg)
  (interactive "P")
  (skk-kakutei-ex)
  (rd-same-level-item))
(defun skk-kakutei-and-rd-lower-level-item (&optional arg)
  (interactive "P")
  (skk-kakutei-ex)
  (rd-lower-level-item))
(defun skk-kakutei-and-rd-higher-level-item (&optional arg)
  (interactive "P")
  (skk-kakutei-ex)
  (rd-higher-level-item))
(define-key skk-j-mode-map "\C-c\C-a" 'skk-kakutei-and-rd-same-level-item)
(define-key skk-j-mode-map "\C-c\C-l" 'skk-kakutei-and-rd-lower-level-item)
(define-key skk-j-mode-map "\C-c\C-o" 'skk-kakutei-and-rd-higher-level-item)


;; 動的候補表示
;; (setq skk-dcomp-activate nil)			 ; 動的補完
;; (setq skk-dcomp-multiple-activate t) ; 動的補完の複数候補表示
;; (setq skk-dcomp-multiple-rows 10)	 ; 動的補完の候補表示件数
;; ;; 動的補完の複数表示群のフェイス
;; (set-face-foreground 'skk-dcomp-multiple-face "Black")
;; (set-face-background 'skk-dcomp-multiple-face "LightGoldenrodYellow")
;; (set-face-bold-p 'skk-dcomp-multiple-face nil)
;; ;; 動的補完の複数表示郡の補完部分のフェイス
;; (set-face-foreground 'skk-dcomp-multiple-trailing-face "dim gray")
;; (set-face-bold-p 'skk-dcomp-multiple-trailing-face nil)
;; ;; 動的補完の複数表示郡の選択対象のフェイス
;; (set-face-foreground 'skk-dcomp-multiple-selected-face "White")
;; (set-face-background 'skk-dcomp-multiple-selected-face "LightGoldenrod4")
;; (set-face-bold-p 'skk-dcomp-multiple-selected-face nil)
;; ;; 動的補完時に下で次の補完へ
;; (define-key skk-j-mode-map (kbd "<down>") 'skk-completion-wrapper)
