;; If there is no server running, be the one.
(require 'server)
(unless (server-running-p)
  (server-start))

;; Language
(set-language-environment "Japanese")

;; Character code
(prefer-coding-system 'utf-8-unix)

;; Don't make backup files.
(setq make-backup-files nil)

;; Hide menu bar.
(menu-bar-mode 0)

;; Don't show the startup message.
(setq inhibit-startup-message t)

;; Start with empty scratch buffer.
(setq initial-scratch-message "")

;; Don't recenter unless the cursor overruns 1024 lines outside of the buffer.
(setq scroll-conservatively 1024)

;; Don't use tabs for indent.
(setq-default indent-tabs-mode nil)

;; Show line numbers.
(global-linum-mode t)

;; Line number style
(setq linum-format "%4d ")

;; Disable beep.
(setq ring-bell-function '(lambda ()))

;; Color shell-mode buffer.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Show the column number.
(column-number-mode t)

;; Enable transient mark mode.
(setq transient-mark-mode t)

;; Emphasize pairs of parentheses.
(show-paren-mode t)

;; yes/no to y/n.
(fset 'yes-or-no-p 'y-or-n-p)

;; Hide passwords.
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; Don't open the target of symbolic link when it is version-controlled.
(setq vc-follow-symlinks nil)

;; Enable case conversions.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Ignore case in file name completion.
(setq completion-ignore-case t)

;; Key binds
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-g" 'goto-line)

;; Split ediff buffers horizontally.
(setq ediff-split-window-function 'split-window-horizontally)

;; Visualize whitespaces.
(setq whitespace-style '(face spaces tabs trailing space-mark tab-mark))

(setq whitespace-space-regexp "\\(\u3000+\\)")

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])))

(global-whitespace-mode 1)

(set-face-attribute 'whitespace-space nil
                    :background "color-235")

(set-face-attribute 'whitespace-tab nil
                    :background "color-235"
                    :underline t)

(set-face-attribute 'whitespace-trailing nil
                    :background "color-235"
                    :underline t)

;; Use directory names as suffixes in case of buffer name collision.
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Set color theme.
(load-theme 'tango-dark t)

;; Treat ".h" files as C++ headers
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
