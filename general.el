(setq
 custom-vars
 (append custom-vars
	 (list
	  '(package-selected-packages
	    (quote (org
		    org-brain
		    w3m
		    selectric-mode
		    multiple-cursors
		    hindent
		    haskell-mode
		    google-translate
		    company-coq
		    auctex)))
	  
	  '(custom-enabled-themes (quote (tango)))
	  '(inhibit-startup-screen t)
	  '(create-lockfiles nil)
	  
	  '(browse-url-browser-function
	    (quote w3m-browse-url))
	  '(w3m-doc-view-content-types
	    (quote ("application/dvi"
		    "application/postscript")))
	  
	  '(column-number-mode t)
	  '(display-battery-mode t)
	  '(show-paren-mode t))))

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

;; w3m

(add-hook 'w3m-load-hook
	  '(lambda ()
	     (pdf-tools-install)
	     (setf
	      (caddr (assoc "application/pdf"
			    w3m-content-type-alist))
	      (list "emacsclient" (quote file)))))

;; package

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
