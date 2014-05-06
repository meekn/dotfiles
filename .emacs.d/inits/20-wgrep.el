(unless (package-installed-p 'wgrep)
  (package-install 'wgrep))

(unless (package-installed-p 'wgrep-ag)
  (package-install 'wgrep-ag))
