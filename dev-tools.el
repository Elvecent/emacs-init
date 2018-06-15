(setq custom-vars
      (append custom-vars
	      (list
	       '(coq-indent-semicolon-tactical 0)
	       '(coq-script-indent t)
 
	       '(haskell-process-show-debug-tips nil))))

;; Coq
(load "~/.emacs.d/lisp/PG/generic/proof-site")

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
