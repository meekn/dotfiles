(require 'package)

;; MELPA
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(package-refresh-contents)

(package-install 'use-package)
(package-install 'init-loader)
(package-install 'ag)
(package-install 'anzu)
(package-install 'company)
(package-install 'cython-mode)
(package-install 'helm)
(package-install 'magit)
(package-install 'projectile)
(package-install 'undo-tree)
(package-install 'wgrep)
(package-install 'wgrep-ag)
(package-install 'yasnippet)
(package-install 'jedi-core)
(package-install 'company-jedi)

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
