;; = iparc.el
;; ファイル内にメモを追加する
;; http://www.emacswiki.org/cgi-bin/emacs/ipa.el
(require 'ipa)
(setq ipa-annotation-face 'lazy-highlight)
(setq ipa-context-size 6)

(global-unset-key "\C-xi")
(global-set-key "\C-xm"  'ipa-insert)
(global-set-key "\C-xit" 'ipa-toggle)
(global-set-key "\C-xim" 'ipa-move)
(global-set-key "\C-xin" 'ipa-next)
(global-set-key "\C-xip" 'ipa-previous)
(global-set-key "\C-xip" 'ipa-jump)
(global-set-key "\C-xie" 'ipa-edit)