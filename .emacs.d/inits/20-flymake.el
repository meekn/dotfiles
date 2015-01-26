;;; flymake
(when (require 'flymake nil t)
  ;; Display messages in mininuffer.
  (defun flymake-show-and-sit ()
    "Displays the error/warning for the current line in the minibuffer"
    (interactive)
    (progn
      (let* ((line-no (line-number-at-pos) )
             (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
             (count (length line-err-info-list)))
        (while (> count 0)
          (when line-err-info-list
            (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
                   (full-file
                    (flymake-ler-full-file (nth (1- count) line-err-info-list)))
                   (text (flymake-ler-text (nth (1- count) line-err-info-list)))
                   (line (flymake-ler-line (nth (1- count) line-err-info-list))))
              (message "[%s] %s" line text)))
          (setq count (1- count)))))
    (sit-for 60.0))
  (global-set-key "\C-cd" 'flymake-show-and-sit)

  ;; Running w/o Makefile
  (defun flymake-simple-generic-init (cmd &optional opts)
    (let* ((temp-file  (flymake-init-create-temp-buffer-copy
                        'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list cmd (append opts (list local-file)))))

  (defun makefile-exists (dir)
    (if (file-exists-p (concat dir "Makefile")) t
      (let ((padir (file-name-directory (directory-file-name dir))))
        (if (and (not (string= dir padir)) padir) (makefile-exists padir) nil))))

  (defun flymake-simple-make-or-generic-init (cmd &optional opts)
    (if (makefile-exists default-directory)
        (flymake-simple-make-init)
      (flymake-simple-generic-init cmd opts)))

  ;; C
  (defun flymake-c-init ()
    (flymake-simple-make-or-generic-init
     "gcc" '("-Wall" "-Wextra" "-pedantic" "-fsyntax-only")))
  (push '("\\.c\\'" flymake-c-init) flymake-allowed-file-name-masks)
  (add-hook 'c-mode-hook '(lambda () (flymake-mode t)))

  ;; C++
  (defun flymake-cc-init ()
    (flymake-simple-make-or-generic-init
     "g++" '("-std=c++11" "-Wall" "-Wextra" "-pedantic" "-fsyntax-only")))
  (push '("\\.\\(cc\\|cpp\\|C\\|CPP\\|hpp\\)\\'" flymake-cc-init)
        flymake-allowed-file-name-masks)
  (add-hook 'c++-mode-hook '(lambda () (flymake-mode t))))
