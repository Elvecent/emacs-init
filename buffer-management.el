(require 'multiple-cursors)
(if (window-system)

    (progn
     (global-set-key (kbd "C-<") 'mc/unmark-next-like-this)
     (global-set-key (kbd "C->") 'mc/unmark-previous-like-this)
     (global-set-key (kbd "C-.") 'mc/mark-next-like-this)
     (global-set-key (kbd "C-,") 'mc/mark-previous-like-this))

  (progn
   (global-set-key (kbd "C-c <") 'mc/unmark-next-like-this)
   (global-set-key (kbd "C-c >") 'mc/unmark-previous-like-this)
   (global-set-key (kbd "C-c .") 'mc/mark-next-like-this)
   (global-set-key (kbd "C-c ,") 'mc/mark-previous-like-this)))
