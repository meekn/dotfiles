(unless (package-installed-p 'color-theme-solarized)
  (package-install 'color-theme-solarized))

(load-theme 'solarized-dark t)
