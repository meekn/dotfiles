;; Language
(set-language-environment "Japanese")

;; Character code
(prefer-coding-system 'utf-8-unix)

;; Don't make backup files.
(setq make-backup-files nil)

;; Don't show the startup message.
(setq inhibit-startup-message t)

;; Scroll one line at a time.
(setq scroll-step 1)

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
