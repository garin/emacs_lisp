;; = ~/.emacs
;; ===== 基本設定 ==========================================
;; ----- 文字コードセット
(load "~/.emacs.d/utf8rc.el")

;; ----- 外部関数
(load "~/.emacs.d/defuncrc.el")

;; ----- ロードパス
(let ((default-directory "/usr/share/emacs/site-lisp"))
  (setq load-path (cons default-directory load-path))
  (normal-top-level-add-subdirs-to-load-path))

;; ----- テスト用スクリプト
;(load "~/.emacs.d/scrap.el")

;; ===== 全般 ==========================================
(setq inhibit-startup-message t)       ;; ---- スタートアップ画面を表示しない
(setq initial-major-mode 'text-mode)   ;; ---- 起動時のデフォルトモード
(setq default-major-mode 'text-mode)   ;; ---- 新規バッファのデフォルトモード

(setq auto-save-default nil)           ;; ----- オートセーブ
(setq auto-save-interval 1000)         ;; ----- オートセーブ間隔(文字)
(setq auto-save-timeout  300)          ;; ----- オートセーブのタイムアウト
(setq make-backup-files nil)           ;; ----- バックアップ

(setq display-warning-suppressed-classes '(font))   ;; ----- フォントエラーの抑止

;; ===== 音・外観 ======================================
(setq vasible-bell t)                  ;; ----- ベルを止める
(tool-bar-mode  0)                     ;; ----- ツールバー
(menu-bar-mode -1)                     ;; ----- メニューバー
(set-scroll-bar-mode nil)           ;; ----- スクロールバー('right)
(line-number-mode t)                   ;; ----- 行番号表示
(global-linum-mode 0)                ;; ----- 行番号をマージンに表示
(blink-cursor-mode 0)                  ;; ----- カーソルの点滅

(transient-mark-mode 1)                ;; ----- リージョンに色を付ける
(set-default 'line-spacing 0)          ;; ----- 行間(ピクセル)
(setq scroll-step 1)                   ;; ----- スクロール幅



;; ===== 表示 ======================================
(setq-default show-trailing-whitespace nil)         ;; ----- 行末の空白を表示(w3m 等の空白も表示してしまうので中止)
(set-face-background 'trailing-whitespace "red")    ;; ----- 空白の色

(setq-default indicate-empty-lines t)               ;; ----- EOB を表示
(setq-default indicate-buffer-boundaries 'left)     ;; ----- EOB の表示位置
(load "~/.emacs.d/hllinerc.el")                     ;; ----- カレント行に色を付ける
(load "~/.emacs.d/viewrc.el")                       ;; ----- view-mode
(load "~/.emacs.d/uniquifyrc.el")                   ;; ----- 同じファイル名が複数あるとディレクトリ名を表示

;; ----- フォント
(set-default-font "さざなみゴシック-11")
(set-face-font 'variable-pitch "さざなみゴシック-11")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("さざなみゴシック" . "unicode-bmp"))

;; (set-default-font "Inconsolata-20")
;; (set-face-font 'variable-pitch "Inconsolata-12")
;; (set-fontset-font (frame-parameter nil 'font)
;;                   'japanese-jisx0208
;;                   '("VL ゴシック" . "unicode-bmp"))

;; ===== 入力支援 ======================================
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40)) ;; ---------- Tab 幅
(setq kill-whole-line nil)                          ;; ----- C-k で行全体を削除
(fset 'yes-or-no-p 'y-or-n-p)                       ;; ----- "yes or no"を"y or n"に
(setq comment-empty-lines t)                        ;; ----- リージョンをコメントする時に空白行もコメントアウトする
(define-key minibuffer-local-completion-map "\C-w" 'backward-kill-word) ;; minibuffer で C-w で前の単語を削除
(epa-file-disable)                                  ;; PGP ファイルを自動で展開する
(add-hook 'before-save-hook 'delete-trailing-whitespace)  ;; セーブする時に自動で行末の空白を削除する


(load "~/.emacs.d/daterc.el")                 ;; ----- 日付入力
(load "~/.emacs.d/textadjustrc.el")           ;; ----- 日本語整形
(load "~/.emacs.d/iparc.el")                  ;; ----- ファイルにメモを貼る
(load "~/.emacs.d/occurirc.el")               ;; ----- 文字列検索&一覧表示
(load "~/.emacs.d/copycommand.el")            ;; ----- 情報を  C-x + 大文字1文字でコピーする
(load "~/.emacs.d/manuedrc.el")               ;; ----- 真鵺道
(load "~/.emacs.d/pointundorc.el")            ;; ----- ポイントの位置を移動する

(load "~/.emacs.d/abbrevrc.el")               ;; ----- abbrev
(load "~/.emacs.d/yasnippetrc.el")            ;; ----- スニペット
(load "~/.emacs.d/hippierc.el")               ;; ----- 略語展開
(load "~/.emacs.d/goto-chgrc.el")	      ;; ----- 最後の変更箇所にジャンプ
(load "~/.emacs.d/summaryerc.el")	      ;; ----- バッファのサマリを表示する


;; ===== キーバインド(グローバル) ======================================
(global-set-key "\C-\\" 'undo)                       ;; C-\ を undo に割り当て
;(set-extended-key-translate-table exkey-S-tab \F24)
(global-set-key "\M-\\" 'tab-to-tab-stop)           ;; ----- M-\ でタブを入力
(global-set-key "\C-q" 'universal-argument)         ;; ----- C-u のわりに C-q を使う。
(global-set-key "\C-h" 'backward-delete-char)       ;; ----- C-h でバックスペース


;; ===== バッファ・レジトリ ======================================
;; ---------- バッファの移動
(global-set-key [?\C-,] 'bs-cycle-next)       ;; 次のバッファに移動
(global-set-key [?\C-.] 'bs-cycle-previous)   ;; 前のバッファに移動

;; ----------- レジストリリスト
;; http://www.bookshelf.jp/elc/list-register.el
(require 'list-register)
(global-set-key "\C-xrl" 'list-register)     ; レジトリリストを表示
(global-set-key "\C-xrp" 'point-to-register) ; ポインタをレジストに登録

;; ---------- リージョンの内容をキルバッファとクリップボードにコピー
(set-clipboard-coding-system 'utf-8-unix)
(unless (<= 23 emacs-major-version)
  (set-selection-coding-system 'compound-text-unix))
(cond (window-system (setq x-select-enable-clipboard t) ))

;; ===== キルリング ======================================
;;---------- kill-summary
;; http://www.bookshelf.jp/soft/meadow_32.html#SEC456
;; http://mibai.tec.u-ryukyu.ac.jp/~oshiro/Programs/elisp/kill-summary.el
;; C-n, C-p : アイテムを移動
;; SPC  : 選択しているものをバッファに表示
;; RET  : 終了(現在バッファに表示している状態で終わる。注:選択ではない)
;; \C-g : キャンセル
(autoload 'kill-summary "kill-summary" nil t)
(global-set-key "\M-y" 'kill-summary)

;; ===== アプリケーション ======================================
;; ----- ddskk
(load "~/.emacs.d/skkrc.el")  ;; + ~/.skk
(load "~/.emacs.d/toggle-point.el")           ;; ----- セットしたポイントと行き来する(SKK よりも後に定義する)
(load "~/.emacs.d/colorthemerc.el")           ;; ----- カラーテーマ(SKKの後に読み込む)

;; ----- elscreen
(load "~/.emacs.d/elscreenrc.el")

;; ----- ruby doc
(load "~/.emacs.d/rdrc.el")

;; ----- howm
(load "~/.emacs.d/howmrc.el")

;; ----- raf
(load "~/.emacs.d/raf.el")

;; ----- migemo
(setq migemo-command "/usr/bin/ruby1.8")
(load "migemo.el")

;; ----- anything
(load "~/.emacs.d/anything")

;; ----- lookup
(load "~/.emacs.d/lookuprc")

;; ----- w3m
(load "~/.emacs.d/w3mrc.el")

;; ----- Twitter
(load "~/.emacs.d/twitterrc.el")

;; ----- jabber
(require 'jabber-autoloads)

;; ----- SGML/XML
(load "~/.emacs.d/sgmlrc.el")

;; ----- mymemo
(load "~/.emacs.d/mymemo.el")

;; ----- navi2ch
(load "~/.emacs.d/navi2chrc.el")

;; ----- puppet
(load "~/.emacs.d/puppetrc.el")

;;----- dired
(require 'dired-x)
(load "dired-x")

;; ===== メール ==============================
(load "~/.emacs.d/mailrc.el")

;; ===== プログラム ==============================
;; ----- ruby
(load "~/.emacs.d/rubyrc.el")
