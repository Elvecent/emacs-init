(setq custom-vars
      (append custom-vars
	      (list
	       '(coq-indent-semicolon-tactical 0)
	       '(coq-script-indent t)
	       '(proof-layout-windows-on-visit-file t)
	       '(proof-next-command-insert-space nil)
	       '(proof-three-window-mode-policy (quote hybrid))
 
	       '(haskell-process-show-debug-tips nil))))

;; Coq

(add-to-list 'load-path "~/.opam/system/share/emacs/site-lisp/")
(load "~/.emacs.d/lisp/PG/generic/proof-site")
(require 'ob-coq)

(eval-after-load "proof-script" '(progn
 (define-key proof-mode-map [(control n)] 
   'proof-assert-next-command-interactive)
 
 (define-key proof-mode-map [(control b)]
   'proof-undo-last-successful-command)))

(add-hook 'coq-mode-hook #'company-coq-mode)

;; Haskell
(require 'inf-haskell)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(require 'hindent)
(add-hook 'haskell-mode-hook 'hindent-mode)

;; Agda
(add-hook 'agda2-mode-hook
	  (lambda ()
	    (push '("->" . ?→) prettify-symbols-alist)
	    (push '("forall" . ?∀) prettify-symbols-alist)
	    (setq prettify-symbols-unprettify-at-point t)
	    (prettify-symbols-mode)))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
