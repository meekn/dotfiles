(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))

(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

(setq ac-auto-show-menu 0.05)
(setq ac-quick-help-delay 0.05)

(setq ac-auto-start t)
(setq ac-use-menu-map t)
