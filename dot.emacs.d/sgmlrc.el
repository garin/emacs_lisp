;; -------------------- SGML -----------------------

(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

;;; DocBook,RELAX,RELAX NGもxml-modeで開く
(setq auto-mode-alist
      (append
       '(("\\.\\(xml\\|rlx\\|rng|db\\)$" . xml-mode))
       auto-mode-alist))

(add-hook 'xml-mode-hook
          (function
           (lambda ()
             ;; タブは使わない
             (make-variable-buffer-local 'indent-tabs-mode)
             (setq indent-tabs-mode nil)
             ;; タイムスタンプ
             ;; Last modified:の後に空白かタブが入っていると
             ;; タイムスタンプを挿入
             (make-local-variable 'time-stamp-start)
             (setq time-stamp-start "Last modified:[ \t]")
             (make-local-variable 'time-stamp-end)
             (setq time-stamp-end "$")
             (make-local-variable 'time-stamp-line-limit)
             (setq time-stamp-line-limit 3000)
             ;; sgml-validate-commandでは環境変数を
             ;; 定義されるのでenvを使う
             ;; だってtcsh使ってるんだもん
             ;;(make-local-variable 'sgml-validate-command)
             ;;(setq sgml-validate-command
             ;;      (concat "env " sgml-validate-command))
             ;; カタログのある場所を指定
             (setq sgml-catalog-files
             (append '("catalog" "/etc/xml/catalog")
                     sgml-catalog-files)))))

;; 色付け
(add-hook 'xml-mode-hook
          (function (lambda()
                      (make-face 'sgml-comment-face)
                      (make-face 'sgml-start-tag-face)
                      (make-face 'sgml-end-tag-face)
                      (make-face 'sgml-doctype-face)

                      (set-face-foreground 'sgml-comment-face "orange")
                      (set-face-foreground 'sgml-start-tag-face "SkyBlue1")
                      (set-face-foreground 'sgml-end-tag-face "SkyBlue1")
                      (set-face-foreground 'sgml-doctype-face "DodgerBlue3")

                      (setq sgml-set-face t)
                      (setq sgml-markup-faces
                            '(
                              (comment   . sgml-comment-face)
                              (start-tag . sgml-start-tag-face)
                              (end-tag   . sgml-end-tag-face)
                              (doctype   . sgml-doctype-face)
                              )))))

;; set some psgml variables

;;(setq sgml-auto-activate-dtd )
;;(setq sgml-omittag-transparent t)
;;(setq sgml-balanced-tag-edit t)
(setq sgml-auto-insert-required-elements nil)
;;(setq sgml-live-element-indicator t)
(setq sgml-indent-step 2)
;; paraやscreenでも字下げを行う.
(setq sgml-indent-data t)


; CSS-MODE
(autoload 'css-mode "css-mode")
(setq auto-mode-alist
     (cons '("\\.css\\'" . css-mode) auto-mode-alist))

