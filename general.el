(custom-set-variables
 '(custom-enabled-themes (quote (tango)))
 '(inhibit-startup-screen t)
 
 '(column-number-mode t)
 '(display-battery-mode t)
 '(show-paren-mode t)
 (unless mobile
  '(tool-bar-mode nil))

 '(org-catch-invisible-edits (quote (show-and-error)))
 '(org-cycle-emulate-tab (quote (whitestart))))

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
