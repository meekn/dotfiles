(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))

(yas-global-mode 1)
