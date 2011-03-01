;; = rd-mode
;; rdtools, rdtool-elisp のパッケージに入ってる
;; http://howm.sourceforge.jp/cgi-bin/hiki/hiki.cgi?RdModePlus ;; rd-mode-plus
;; http://howm.sourceforge.jp/a/rd-mode-plus.el
(load "rd-mode-plus.el")
(autoload 'rd-mode "rd-mode" "major mode for ruby document formatter RD" t)
;(load "rdindex-init")


;; rd-mode にする拡張子
(add-to-list 'auto-mode-alist '("\\.rd$" . rd-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . rd-mode))

;; C-c C-n で次の項を移動する
;; rd-outline-prev-heading が実装されていないので C-c C-p は定義できない
(define-key rd-mode-map "\C-c\C-n" 'rd-outline-next-heading)

(add-hook
 'rd-mode-hook
 (lambda ()
   ;; rd ファイル のフォルダで rake を実行
   (define-key rd-mode-map "\M-\\" 'comment-dwim)
   (setq comment-start "#")
   (setq comment-end "")
   (setq comment-style 'plain)
   (orgtbl-mode t) ;; table mode from org-mode
   (define-key rd-mode-map "\C-cc" 'compile)
   (set (make-local-variable 'compile-command)
        (concat "rake"))
   ))

;; C-x l で目次を表示
;; rd-show-label-list は occur を使っている
(defun occur-show-label-list ()
 "Show RD Label list through temporary buffer."
 (interactive)
 (occur-by-moccur (concat "^\\(=+\\s-\\|\\+\\|\\s-*---\\)") 0))

(add-hook
 'rd-mode-hook
 (lambda ()
   (define-key rd-mode-map "\C-xl" 'occur-show-label-list)
   ))

;; M-n, M-p でセクションを移動する。
(defun rd-next-section ()
  (interactive)
  (move-end-of-line 1)
  (re-search-forward "^[=+]+ ")
  (recenter 5)
  (move-beginning-of-line 1))
(defun rd-previous-section ()
  (interactive)
  (move-beginning-of-line 1)
  (re-search-backward "^[=+]+ ")
  (recenter 5)
  (move-beginning-of-line 1))
(add-hook
 'rd-mode-hook
 (lambda ()
   (define-key rd-mode-map "\M-n" 'rd-next-section)
   (define-key rd-mode-map "\M-p" 'rd-previous-section)
   ))
