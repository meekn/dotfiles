(require 'package)

;; MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(package-install 'use-package)
(package-install 'init-loader)
(package-install 'ag)
(package-install 'anzu)
(package-install 'auto-complete)
(package-install 'cython-mode)
(package-install 'helm)
(package-install 'magit)
(package-install 'projectile)
(package-install 'undo-tree)
(package-install 'wgrep)
(package-install 'wgrep-ag)
(package-install 'yasnippet)

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
