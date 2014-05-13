(auto-insert-mode t)
(setq auto-insert-directory "~/.emacs.d/templates/")

(defvar template-replacements-alist
  '(
    ("%file%" . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%file-without-ext%" . (lambda () 
                              (setq file-without-ext (file-name-sans-extension
                                                      (file-name-nondirectory (buffer-file-name))))))
    ("%author%" . user-full-name)
    ("%mail%" . (lambda () (identity user-mail-address)))
    ("%year%" . (lambda () (substring (current-time-string) -4)))
    ("%month%" . (lambda () (substring (current-time-string) 4 7)))
    ("%day%" . (lambda () (substring (current-time-string) 8 10)))))

(defun my-template ()
  (time-stamp)
  (mapc #'(lambda(c)
            (progn
              (goto-char (point-min))
              (replace-string (car c) (funcall (cdr c)) nil)))
        template-replacements-alist)
  (goto-char (point-max))
  (message "done."))

(setq auto-insert-alist
      (nconc '(
               ("\\.py$" . ["template.py" my-template])
               ("\\.tex$" . ["template.tex" my-template])
               ) auto-insert-alist))
