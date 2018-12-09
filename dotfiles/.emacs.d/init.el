(require 'package)

;; MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
;; (package-refresh-contents)

(package-install 'use-package)
(package-install 'init-loader)
(package-install 'ag)
(package-install 'anzu)
(package-install 'company)
(package-install 'cython-mode)
(package-install 'dockerfile-mode)
(package-install 'markdown-mode)
(package-install 'yaml-mode)
(package-install 'helm)
(package-install 'magit)
(package-install 'projectile)
(package-install 'undo-tree)
(package-install 'wgrep)
(package-install 'wgrep-ag)
(package-install 'yasnippet)
(package-install 'jedi-core)
(package-install 'company-jedi)
(package-install 'irony)
(package-install 'company-irony)
(package-install 'flycheck)
(package-install 'flycheck-irony)
(package-install 'google-c-style)
(package-install 'rtags)


(use-package init-loader
  :config
  (setq init-loader-show-log-after-init nil)
  (init-loader-load "~/.emacs.d/inits"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (jedi-core wgrep company yasnippet wgrep-ag use-package undo-tree projectile magit init-loader helm cython-mode company-jedi anzu ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
