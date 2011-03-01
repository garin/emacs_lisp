; -- twitterrc
;;(require 'un-define)
(require 'twittering-mode)
;;(setq twittering-username "XXXXX@gmail.com")
;;(setq twittering-password "XXXXX") ; This is optional

;; ミニバッファで入力
;; 動かなかった
;; (setq twittering-update-status-function "twittering-update-status-from-minibuffer")

;; (setq twittering-timer-interval 300)         ; Update your timeline each 300 seconds (5 minutes)
;; (setq twittering-tmp-dir "/tmp/twmode-images-XXXXX") ; Directory to store buddy icons
;; (setq twittering-use-wget nil)
;; (twittering-icon-mode nil)                       ; Show icons (requires wget-el)

;; つぶやきフォーマットの変更
;; (setq twittering-status-format "%i %s,  %@:¥n  %t // from %f%L")  ; デフォルト
(setq twittering-status-format "%i %C{%m-%d %H:%M} @%s %t %R")
;;  %s - screen_name
;;  %S - name
;;  %i - profile_image
;;  %d - description
;;  %l - location
;;  %L - \" [location]\"
;;  %r - \" sent to user\" (use on direct_messages{,_sent})
;;  %r - \" in reply to user\" (use on other standard timeline)
;;  %R - \" (retweeted by user)\"
;;  %u - url
;;  %j - user.id
;;  %p - protected?
;;  %c - created_at (raw UTC string)
;;  %C{time-format-str} - created_at (formatted with time-format-str)
;;  %@ - X seconds ago
;;  %T - raw text
;;  %t - text filled as one paragraph
;;  %' - truncated
;;  %FACE[face-name]{...} - strings decorated with the specified face.
;;  %FILL[prefix]{...} - strings filled as a paragraph. The prefix is optional.
;;                       You can use any other specifiers in braces.
;;  %FOLD[prefix]{...} - strings folded within the frame width.
;;                       The prefix is optional. This keeps newlines.
;;                       You can use any other specifiers in braces.
;;  %f - source
;;  %# - id

;; RTフォーマット
;; twittering-retweet-format "RT: %t (via @%s)" デフォルト
(setq twittering-retweet-format "RT @%s %t")

;; PINコードを保存
;; (setq twittering-use-master-password t)

;; twittering-mode 時のキーバインド
(add-hook
  'twittering-mode-hook
  (lambda ()
    (define-key twittering-edit-mode-map "\C-c\C-t" 'twittering-edit-post-status)))


