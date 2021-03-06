(setq
 custom-vars
 (append custom-vars
	 (list
	  '(package-selected-packages
	    (quote
	     (smooth-scrolling
	      buffer-move 
	      org 
	      org-brain 
	      w3m 
	      selectric-mode 
	      multiple-cursors 
	      hindent 
	      haskell-mode 
	      google-translate 
	      company-coq 
	      auctex)))

	  '(browse-url-browser-function (quote eww-browse-url))
	  
	  '(custom-enabled-themes (quote (tango)))
	  '(inhibit-startup-screen t)
	  '(create-lockfiles nil)
	  	  
	  '(column-number-mode t)
	  '(display-battery-mode t)
	  '(show-paren-mode t))))


;; package

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/"))
(add-to-list
 'package-archives
 '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package try
	:ensure t)

(use-package which-key
	:ensure t 
	:config
	(which-key-mode))

(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

(unless mobile
  (progn
    (setq
     custom-vars
     (append custom-vars
	     (list
	      '(tool-bar-mode
		nil))))))

(global-set-key (kbd "<s-up>")     'buf-move-up)
(global-set-key (kbd "<s-down>")   'buf-move-down)
(global-set-key (kbd "<s-left>")   'buf-move-left)
(global-set-key (kbd "<s-right>")  'buf-move-right)

;; Transparency/opacity
(defvar active-opacity 80)
(defvar inactive-opacity 50)

(set-frame-parameter (selected-frame) 'alpha active-opacity)

(defun toggle-opacity ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
	  (cons active-opacity inactive-opacity)
	'(100 . 100)))))

(global-set-key (kbd "s-o") 'toggle-opacity)

(pdf-tools-install)
