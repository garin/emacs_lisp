;; ----- copy command
;; C-x + 大文字1文字 で情報をコピーする
;; 

;; 現在のバッファのファイル名を取得して kill-ring に追加する
(defun copy-current-file-name ()
  "copy to kill-ring of current buffer file name"
  (interactive)
  (message buffer-file-name)
  (kill-new buffer-file-name))
(global-set-key "\C-xF" 'copy-current-file-name)

;; 現在のバッファのディレクトリ名を取得して kill-ring に追加する
(defun copy-current-directory-name ()
  "copy to kill-ring of current buffer directory name"
  (interactive)
  (setq current-directory-name (file-name-directory buffer-file-name))
  (if current-directory-name
      (progn
	(message current-directory-name)
	(kill-new current-directory-name))))
(global-set-key "\C-xD" 'copy-current-directory-name)

;; RDドキュメントのコマンドリストを実行可能なコマンドリストに変更する
;; 変換には show-command-list.rb の Rubyスクリプトを使用
;; // RDドキュメント
;;   $ cd /etc
;;   $ ls
;; // 出力
;; cd /etc &&
;; ls
(defun beginning-point-of-line ()
  (interactive)
  (beginning-of-line)
  (point)
)
(defun end-point-of-line ()
  (interactive)
  (end-of-line)
  (point)
 )
(defun show-command-list ()
  (interactive)
  (setq npoint (point))
  (setq show-cmd-rb "/home/XXX/src/shell/show-command-list.rb")
  (setq show-cmd-tmp "/tmp/emacs.show-command-line.tmp")
  (if mark-active
      (setq command-str (buffer-substring (region-beginning) (region-end)))
    (setq command-str (buffer-substring (beginning-point-of-line) (end-point-of-line)))
    )
  (if mark-active
      (call-process-region (region-beginning) (region-end) "tee" nil nil nil show-cmd-tmp)
    (call-process-region (beginning-point-of-line) (end-point-of-line) "tee" nil nil nil show-cmd-tmp)
    )
  (goto-char npoint)
  (setq command-list
	(shell-command-to-string (concat show-cmd-rb " " show-cmd-tmp)))
  (message command-list)
  (kill-new command-list)
  (shell-command-to-string (concat "rm" " " show-cmd-tmp)))
(global-set-key "\C-xC" 'show-command-list)

;; RDドキュメントのブロックリストを整形する
;; // RDドキュメント
;;   rdのブロックは
;;   2つの空白を行頭に置く
;; // 出力
;; rdのブロックは
;; 2つの空白を行頭に置く
(defun show-block-list ()
  (interactive)
  (setq npoint (point))
  (setq show-blk-rb "/home/XXX/src/shell/show-block-list.rb")
  (setq show-blk-tmp "/tmp/emacs.show-blk-line.tmp")
  (if mark-active
      (setq command-str (buffer-substring (region-beginning) (region-end)))
    (setq command-str (buffer-substring (beginning-point-of-line) (end-point-of-line)))
    )
  (if mark-active
      (call-process-region (region-beginning) (region-end) "tee" nil nil nil show-blk-tmp)
    (call-process-region (beginning-point-of-line) (end-point-of-line) "tee" nil nil nil show-blk-tmp)
    )
  (goto-char npoint)
  (setq command-list
	(shell-command-to-string (concat show-blk-rb " " show-blk-tmp)))
  (message command-list)
  (kill-new command-list)
  (shell-command-to-string (concat "rm" " " show-blk-tmp)))
(global-set-key "\C-xB" 'show-block-list)
