(defvar custom-vars '())

(server-start)
(load "~/emacs-init/general.el")
(load "~/emacs-init/org-init.el")
(load "~/emacs-init/buffer-management.el")
(unless mobile
  (load "~/emacs-init/dev-tools.el"))
;; too buggy/annoying
;; (load "~/emacs-init/useless-but-fun.el")

(apply 'custom-set-variables custom-vars)
