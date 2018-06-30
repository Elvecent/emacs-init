(setq custom-vars
      (append custom-vars
	      (list
	       '(org-default-notes-file (concat org-directory "/notes.org"))
	       '(org-refile-use-outline-path (quote file))
	       '(org-agenda-files (list "~/org"))
	       '(org-hide-leading-stars t)
	       '(org-confirm-babel-evaluate nil)
	       '(org-src-fontify-natively t)
	       '(org-src-tab-acts-natively t)
	       '(org-tags-column -65)
	       '(org-catch-invisible-edits (quote (show-and-error)))
	       '(org-cycle-emulate-tab (quote whitestart))
	       '(org-adapt-indentation t)
	        '(org-file-apps
		  (quote
		   (("\\.pdf\\'" . emacs)
		    (auto-mode . emacs)
		    ("\\.mm\\'" . default)
		    ("\\.x?html?\\'" . default))))
	       '(org-format-latex-options
		 (quote
		  (:foreground
		   default
		   :background default
		   :scale 1.25
		   :html-foreground "Black"
		   :html-background "Transparent"
		   :html-scale 1.0
		   :matchers
		   ("begin" "$1" "$" "$$" "\\(" "\\["))))
	       )))

(setq org-todo-keywords '((sequence
			   "TODO" "TOBREAK"
			   "|"
			   "DONE" "CANCELLED")))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)
   (haskell . t)
   (racket . t))
 )

(setq org-refile-targets
      '(("learning.org" :maxlevel . 5)
	("formalities.org" :maxlevel . 5)
	("personal.org" :maxlevel . 5)))

(org-link-set-parameters
 "w3m" :follow
 (lambda (path) (w3m-goto-url (concat "http:" path))))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
