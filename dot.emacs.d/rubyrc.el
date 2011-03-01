;; ----- Ruby -----
; refe
;(require 'refe)

;; ---- rcodetools
;; http://eigenclass.org/hiki.rb?rcodetools
;; M-x xmp
;(require 'rcodetools)

;; ----- Epo + Ruby
;(autoload 'epo "epo" "Editing Process Organizer" t)
;(add-hook 'ruby-mode-hook 'epo)

;; ----- ruby-mode plus
;; これは普通のruby
(load "ruby-mode.el")
(setq ruby-indent-level 2)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

;; ----- align
;; http://d.hatena.ne.jp/rubikitch/20080227/1204051280
;; (add-to-list 'align-rules-list
;;              '(ruby-comma-delimiter
;;                (regexp . ",\\(\\s-*\\)[^# \t\n]")
;;                (repeat . t)
;;                (modes  . '(ruy-mode))))
;; (add-to-list 'align-rules-list
;;              '(ruby-hash-literal
;;                (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
;;                (repeat . t)
;;                (modes  . '(ruby-mode))))
;; (add-to-list 'align-rules-list
;;              '(ruby-assignment-literal
;;                (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
;;                (repeat . t)
;;                (modes  . '(ruby-mode))))
;; (add-to-list 'align-rules-list          ;TODO add to rcodetools.el
;;              '(ruby-xmpfilter-mark
;;                (regexp . "\\(\\s-*\\)# => [^#\t\n]")
;;                (repeat . nil)
;;                (modes  . '(ruby-mode))))

; --- rails mode
;http://tam.qmix.org/wiki/EmacsRailsMode.html
;(require 'rails)
;http://rubyforge.org/frs/?group_id=1484&release_id=11217
;http://www.kazmier.com/computer/snippet.el
;(defun try-complete-abbrev (old)
; (if (expand-abbrev) t nil))

;(setq hippie-expand-try-functions-list
;     '(try-complete-abbrev
;       try-complete-file-name
;       try-expand-dabbrev))
;(require 'rails)
;; view <-> controler
;(define-key rails-minor-mode-map "\C-q" 'rails-lib:run-primary-switch)


;; two-mode-mode
;(require 'two-mode-mode) ; ruby-modeから抜けると RoRモードが消えてしまう

;; auto-mode-aliast
(add-to-list 'auto-mode-alist '("\\.rhtml$" . html-mode))
;(add-to-list 'auto-mode-alist '("\\.rhtml$" . two-mode-mode))

;; el4r
;(add-to-list 'load-path "/usr/share/emacs/site-lisp")
;(require 'el4r)
;(el4r-boot)

;; Compile バッファのファイルをRubyで実行
(add-hook
 'ruby-mode-hook
 (lambda ()
   (define-key ruby-mode-map "\M-\\" 'comment-dwim)
   (define-key ruby-mode-map "\C-cc" 'compile)
   (define-key ruby-mode-map "\C-xl" 'se/make-summary-buffer)   ;; --- summarye.el
   (set (make-local-variable 'compile-command)
        (concat "ruby -cv " buffer-file-name))))

;; ----- electric
;; http://d.hatena.ne.jp/authorNari/20081203/1228285596
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;(setq ruby-electric-expand-delimiters-list '( ?\{))
(setq ruby-electric-expand-delimiters-list nil)

;; ruby-electric-modeにてSKKで日本語入力できるようにする。
;; electric-mode の読み込み順序を最下位にする
;; http://www.nabble.com/-ruby-list:45510--ruby-electric.elと日本語入力-td19591779.html
(let ((rel (assq 'ruby-electric-mode minor-mode-map-alist)))
  (setq minor-mode-map-alist (append (delete rel minor-mode-map-alist) (list rel))))


;; --- rspec
;; http://barelyenough.org/projects/rspec-mode/
;; **require** mode-compile
;; # git clone git://github.com/pezra/rspec-mode.git
;; # cd rspec-mode
;; # cp *.el /usr/share/emacs/site-lisp
;(require 'snippet)
;; snippet.el で、addrev に定型文を追加する
;(require 'rspec-mode)

