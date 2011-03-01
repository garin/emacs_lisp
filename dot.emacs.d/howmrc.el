;; ==========  howm 用の設定 ==========
;; 全般
(require 'howm)
;(require 'elscreen-howm)
(add-to-list 'auto-mode-alist '("\\.howm$" . rd-mode))
;(add-to-list 'auto-mode-alist '("\\.howm$" . ac-mode))
;(add-hook 'howm-mode-on-hook 'ac-mode)

(setq howm-menu-lang 'ja)
(global-set-key "\C-c,," 'howm-menu)
(global-set-key "\C-c,." 'howm-create)
(global-set-key "\C-c,f" 'howm-next-memo)
(setq howm-directory "~/doc/howm/")
(setq howm-keyword-file "~/doc/howm/.howm-keys")
(mapc
 (lambda (f)
   (autoload f
     "howm-mode" "Hitori Otegaru Wiki Modoki" t))
 '(howm-menu howm-list-all howm-list-recent
             howm-list-grep howm-create
             howm-keyword-to-kill-ring))


;; メニューファイルの指定(少し早くなる)
(setq howm-menu-file "~/doc/howm/0000-00-00-000000.howm")

;; 進捗状況の記入
(defun my-progress-date ()
  (interactive)
  (beginning-of-line)
  (insert (format-time-string "+ %m/%d %H:%M : ")))
;  (forward-char 2))
(global-set-key "\C-c\C-f" 'my-progress-date)


;; テンプレートの変更
(setq howm-template-date-format "%Y-%m-%d")
(setq howm-template
      '("= [%date]%cursor%title %file\n"))

(defun my-howm-create-date ()
  (setq npoint (point))
  (newline)
  (my-get-date-gen "$Date: %Y-%m-%d %H:%M$")
  (goto-char npoint))

(defun my-howm-create ()
  (interactive)
  (howm-create)
  (my-howm-create-date))
;(global-set-key "\C-c,c" 'my-howm-create)
(global-set-key "\C-c,e" 'my-howm-create) 


;; リンクを TAB で辿る
;(eval-after-load "howm-mode"
;  '(progn
;     (define-key howm-mode-map [tab] 'action-lock-goto-next-link)
;     (define-key howm-mode-map [(meta tab)] 'action-lock-goto-previous-link)))
;; 「最近のメモ」一覧時にタイトル表示
(setq howm-list-recent-title t)
;; 全メモ一覧時にタイトル表示
(setq howm-list-all-title t)
;; メニューを 2 時間キャッシュ
(setq howm-menu-expiry-hours 168) ; 168時間 7日
;; howm の時は auto-fill で
;;(add-hook 'howm-mode-on-hook 'auto-fill-mode)

;; RET でファイルを開く際, 一覧バッファを消す
;; C-u RET なら残る
(setq howm-view-summary-persistent nil)


;; メニューの予定表の表示範囲
;; 10 日前から
(setq howm-menu-schedule-days-before 7)
;; 3 日後まで
(setq howm-menu-schedule-days 40)
;; Todo の表示件数
(setq howm-menu-todo-num 20)
;; 最近 の表示件数
(setq howm-menu-recent-num 10)

(setq howm-schedule-menu-types "[@]")  ;; 予定表
(setq howm-todo-menu-types "[-+~!]")   ;; todo 一覧


;; 旧式
;(setq howm-schedule-types "[~@]")  ;; 予定表
;(setq howm-todo-types "[-+@~.]")  ;; todo 一覧
(setq howm-schedule-types "[!~@.-+ ]")

;; howm のファイル名
;; 以下のスタイルのうちどれかを選んでください
;; で，不要な行は削除してください
;; 1 メモ 1 ファイル (デフォルト)
;;(setq howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.howm")
;;(setq howm-file-name-format "%Y-%m-%d-%H%M%S.howm")
;; 1 日 1 ファイルであれば
;;(setq howm-file-name-format "date/XXXXX/%Y/%m/%Y-%m-%d.howm")
(setq howm-file-name-format (concat "date/" system-name "/%Y/%m/%Y-%m-%d.howm"))

(setq howm-view-grep-parse-line
      "^\\(\\([a-zA-Z]:/\\)?[^:]*\\.howm\\):\\([0-9]*\\):\\(.*\\)$")
;; 検索しないファイルの正規表現 (遅い)
;(setq howm-excluded-file-regexp "misc_sagyou.howm")
(setq howm-excluded-file-regexp
      "/\\.#\\|[~#]$\\|\\.bak$\\|/CVS/\\|\\.doc$\\|\\.pdf$\\|\\.ppt$\\|\\.xls$\\|\\.git$")

;; 大文字小文字を区別しない
(setq howm-keyword-case-fold-search t)
;; 検索にgrepを使う(高速)。
;; この場合, ローマ字検索を使うには migemo-server を動かしておく必要あり
;(setq howm-view-use-grep t)

;; いちいち消すのも面倒なので
;; 内容が 0 ならファイルごと削除する
;(if (not (memq 'delete-file-if-no-contents after-save-hook))
;    (setq after-save-hook
;          (cons 'delete-file-if-no-contents after-save-hook)))
;(defun delete-file-if-no-contents ()
;  (when (and
;         (buffer-file-name (current-buffer))
;         (string-match "\\.howm" (buffer-file-name (current-buffer)))
;         (= (point-min) (point-max)))
;    (delete-file
;     (buffer-file-name (current-buffer)))))

;; http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?SaveAndKillBuffer
;; C-cC-c で保存してバッファをキルする
(defun my-save-and-kill-buffer ()
  (interactive)
  (when (and
         (buffer-file-name)
         (string-match "\\.howm"
                       (buffer-file-name)))
    (save-buffer)
    (kill-buffer nil)))
(eval-after-load "howm-mode"
  '(progn
     (define-key howm-mode-map
       "\C-c\C-c" 'my-save-and-kill-buffer)))

;; M-x calendar しといて M-x howm-from-calendar
;;         → その日付を検索
(defun howm-from-calendar ()
  (interactive)
  (require 'howm-mode)
  (let* ((mdy (calendar-cursor-to-date t))
         (m (car mdy))
         (d (second mdy))
         (y (third mdy))
         (key (format-time-string
               howm-date-format
               (encode-time 0 0 0 d m y))))
    (howm-keyword-search key)))

;カレンダーの上で d を押すと grep
(add-hook 'initial-calendar-window-hook
          '(lambda ()
             (local-set-key
              "d" 'howm-from-calendar)))

;howm のメニューで d でカレンダー
(add-hook 'howm-menu-hook
          '(lambda ()
             (local-set-key "d" 'calendar)))


;; 外部ビュワー
(setq howm-view-external-viewer-assoc
      '(
        ("[.]\\(jpg\\|gif\\|png\\)$" . "xv %s")
        ("[.]dvi$" . "xdvi %s")
        ("[.]\\(html\\|htm\\)$" . "firefox %s")
       ))


;; 色
;(set-face-foreground 'howm-mode-keyword-face "red") ;; <<<
;(set-face-foreground 'howm-mode-ref-face "magenta") ;; >>>
(set-face-background 'howm-mode-wiki-face "#505050") ;; [[]] の背景
(set-face-foreground 'howm-mode-title-face "#ffd700")
;(set-face-background 'howm-mode-title-face "#0f284b") ;; = の背景
(set-face-background 'howm-mode-title-face "#14458A")


;(set-face-foreground 'action-lock-face "blue") ;; 下線文字
(set-face-underline 'action-lock-face t) ;; 下線は文字と同色 (Emacs 21)
;(set-face-underline 'action-lock-face "dark cyan") ;; 下線 (Emacs 21)
;(set-face-foreground 'howm-menu-key-face "orange") ;; メニューの shortcut

;; howmで検索対象にするディレクトリ
(setq howm-search-path '("~/doc/raf" "~/git/sabakan/doc")) ;; スペース区切り
(setq howm-search-other-dir t) ;; 別のディレクトリ検索を有効にする

 ;; メニューを自動更新
(setq howm-menu-refresh-after-save nil)
;; 下線を引き直し
(setq howm-refresh-after-save nil)

;; howmお小遣い帳
;(load "howmoney")

;; test - howm memo C-cs
;; transient-mark-mode でないと, この設定は無視される
(setq howm-content-from-region t)


;; howmモードホック
(add-hook 'text-mode-hook 'howm-mode)
(add-hook 'rd-mode-hook 'howm-mode)
(add-hook 'rd-mode-hook 'outline-minor-mode nil)
;(add-hook 'mime-view-mode-hook 'howm-mode)
(add-hook 'log-edit-mode-hook 'howm-mode nil)

;; 今日と明日の日付は, [YYYY-MM-DD] の形式だけ着色
(setq howm-highlight-date-regexp-format (regexp-quote "[%Y-%m-%d]"))

;; 一覧時にウィンドウ分割を壊さない
;(setq riffle-keep-window t) 
;(setq riffle-window-initializer nil)

;; 一覧バッファと内容バッファを横に並べる
;(setq howm-view-split-horizontally t)
;; howm-menu で vi キーバインド
(define-key howm-menu-mode-map "j" 'next-line)
(define-key howm-menu-mode-map "k" 'previous-line)

;; howm-view-summary(タイトルリスト) で vi キーバインド
;(define-key howm-view-summary-mode-map "j" 'next-line)
;(define-key howm-view-summary-mode-map "k" 'next-line)

;; todo 完了時に, ↓みたいに時刻まで記録
;; [2010-11-24 22:53]. [2010-11-22]:+ ほげほげ
;; howm-test100702 でテスト
;; http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?DoneTime
(defadvice howm-action-lock-done-done (around with-time activate)
  (let ((howm-reminder-today-format howm-dtime-format))
    ad-do-it))
