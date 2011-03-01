;; toggle-point.el
;; マークしたポイントと現在のポイントを行き来する

;; (defun set-point-to-register (&optional arg)
;;   (interactive "P")
;;   (point-to-register ?x (point))  ;; base
;;   (point-to-register ?y (point))  ;; arrow
;; )
;; 
;; (defun toggle-register-point (&optional arg)
;;   (interactive "P")
;;   (if (boundp 'toggle-point-mark)
;;       (if (equal toggle-point-mark (point))
;; 	    (goto-char toggle-point-arrow)
;; 	(setq toggle-point-arrow (point))
;; 	(goto-char toggle-point-mark)      
	       
(defun set-toggle-point (&optional arg)
  (interactive "P")
  (setq toggle-point-arrow (point))
  (setq toggle-point-mark (point))
  )
(defun toggle-point (&optional arg)
  (interactive "P")
  (if (boundp 'toggle-point-mark)
      (if (equal toggle-point-mark (point))
	    (goto-char toggle-point-arrow)
	(setq toggle-point-arrow (point))
	(goto-char toggle-point-mark)
	)
    )
  )

(global-set-key "\C-xp" 'set-toggle-point)
(global-set-key "\M-g" 'toggle-point)
