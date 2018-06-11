(unless mobile
  (custom-set-variables
   '(selectric-mode t)))

(require 'zone)
(zone-when-idle 120)
