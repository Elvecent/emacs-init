(setq custom-vars
      (append custom-vars
	      (list
	       '(custom-enabled-themes (quote (tango)))
	       '(inhibit-startup-screen t)
	       
	       '(column-number-mode t)
	       '(display-battery-mode t)
	       '(show-paren-mode t)
	       
	       '(org-catch-invisible-edits (quote (show-and-error)))
	       '(org-cycle-emulate-tab (quote (whitestart))))))

(unless mobile
  (setq custom-vars
	(append custom-vars
		(list '(tool-bar-mode nil)))))

(setq create-lockfiles nil)

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
