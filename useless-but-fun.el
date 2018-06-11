(unless mobile
  (setq custom-vars
	(append custom-vars
		(list
		 '(selectric-mode t)))))

(require 'zone)
(zone-when-idle 120)
