(setcdr evil-normal-state-map nil)
(setcdr evil-insert-state-map nil)
(setcdr evil-motion-state-map nil)
(setcdr evil-visual-state-map nil)


(define-key evil-normal-state-map "z" 'reload-dotemacs-file)



(define-key evil-motion-state-map "i" 'evil-backward-char)
(define-key evil-motion-state-map "a" 'evil-next-line)
(define-key evil-motion-state-map "h" 'evil-previous-line)
(define-key evil-motion-state-map "o" 'evil-forward-char)

(define-key evil-motion-state-map "I" 'evil-beginning-of-line)
(define-key evil-motion-state-map "A" 'evil-goto-line)
(define-key evil-motion-state-map "H" 'evil-goto-first-line)
(define-key evil-motion-state-map "O" 'evil-end-of-line)

(define-key evil-normal-state-map "u" 'evil-insert)
(define-key evil-normal-state-map "U" 'evil-append)
(define-key evil-normal-state-map ";" 'evil-delete)
(define-key evil-normal-state-map "r" 'evil-open-below)
(define-key evil-normal-state-map "R" 'evil-open-above)
(define-key evil-normal-state-map "f" 'evil-paste-after)
(define-key evil-normal-state-map "F" 'evil-paste-before)
(define-key evil-normal-state-map "q" 'find-file)


(define-key evil-normal-state-map "(" 'evil-delete-char)
(define-key evil-normal-state-map "l" 'evil-yank)
(define-key evil-normal-state-map "L" 'evil-yank-line)

(define-key evil-normal-state-map "e" 'evil-undo)
(define-key evil-normal-state-map "E" 'evil-redo)
(define-key evil-normal-state-map "s" 'evil-save)
(define-key evil-normal-state-map "S" 'quickrun)

(define-key evil-motion-state-map "\C-g" 'kill-buffer)
(define-key evil-emacs-state-map "\C-g" 'kill-buffer)
(define-key evil-normal-state-map "\C-n" 'query-replace)

(define-key evil-normal-state-map "p" 'list-buffers)
(define-key evil-normal-state-map "P" 'switch-to-buffer)
(define-key evil-normal-state-map "m" 'python-indent-shift-left)
(define-key evil-normal-state-map "M" 'python-indent-shift-right)

(define-key evil-normal-state-map "_" 'xah-comment-dwim)
;;(define-key evil-normal-state-map
(global-set-key  (kbd "<C-tab>") 'xah-next-user-buffer)
(global-set-key (kbd "C-S-<iso-lefttab>") 'xah-previous-user-buffer)

(progn
  (define-prefix-command 'my-bookmark-map)
  (define-key my-bookmark-map "l" 'list-bookmarks)
  (define-key my-bookmark-map "s" 'bookmark-set)
  (define-key my-bookmark-map "j" 'bookmark-jump)
  (define-key my-bookmark-map "d" 'bookmark-delete) 
  )
(define-key evil-normal-state-map "b" 'my-bookmark-map)

;; ==  define a prefix keymap for WINDOW keys
(progn
  (define-prefix-command 'my-win-map)
  (define-key my-win-map  "v" 'split-window-vertically)
  (define-key my-win-map  "n" 'other-window)
  (define-key my-win-map  "h" 'split-window-horizontally)
  (define-key my-win-map  "d" 'delete-window) 
  )
(define-key evil-normal-state-map "w" 'my-win-map)

(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map [escape] 'evil-normal-state)
(define-key evil-visual-state-map [escape] 'evil-normal-state)

(define-key evil-normal-state-map "V" 'evil-visual-line)
(define-key evil-normal-state-map "v" 'evil-visual-char)
