;;  rd形式のリージョンをtextile形式に変換して、キーバッファに保存する
(defun raf2textile-region ()
  (interactive)
  (setq npoint (point))
  (setq show-cmd-rb "/home/XXX/bin/raf2textile")
  (setq show-cmd-tmp "/tmp/emacs.raf2textile.tmp")
  (setq rd-str (buffer-substring (region-beginning) (region-end)))
  (call-process-region (region-beginning) (region-end) "tee" nil nil nil show-cmd-tmp)
  (goto-char npoint)
  (setq command-list
        (shell-command-to-string (concat show-cmd-rb " " show-cmd-tmp)))
  (message command-list)
  (kill-new command-list)
  (shell-command-to-string (concat "rm" " " show-cmd-tmp)))
(global-set-key "\C-xR" 'raf2textile-region)  ;; RedmineのR