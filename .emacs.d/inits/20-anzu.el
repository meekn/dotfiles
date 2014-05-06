(unless (package-installed-p 'anzu)
  (package-install 'anzu))

(global-anzu-mode +1)
