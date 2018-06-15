(setq custom-vars
      (append custom-vars
	      (list
	       '(custom-enabled-themes (quote (tango)))
	       '(inhibit-startup-screen t)
	       
	       '(column-number-mode t)
	       '(display-battery-mode t)
	       '(show-paren-mode t)
	       
	       '(org-catch-invisible-edits (quote (show-and-error)))
	       '(org-cycle-emulate-tab (quote whitestart))
	       '(org-adapt-indentation t)
	       '(org-format-latex-options
		 (quote
		  (:foreground default :background default :scale 1.25 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
			       ("begin" "$1" "$" "$$" "\\(" "\\["))))
	       )))

(unless mobile
  (setq custom-vars
	(append custom-vars
		(list '(tool-bar-mode nil)))))

(setq create-lockfiles nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)
   (haskell . t))
 )

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
