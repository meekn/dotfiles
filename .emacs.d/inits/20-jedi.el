(unless (package-installed-p 'jedi)
  (package-install 'jedi)
  (jedi:install-server))

(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:complete-on-dot t)
