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
    ("%day%" . (lambda () (substring (current-time-string) 8 10)))
    ("%include-guard%" . (lambda () (upcase (replace-regexp-in-string "[^a-zA-Z0-9]" "_" (file-name-nondirectory buffer-file-name)))))))

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
               ("\\.c$" . ["template.c" my-template])
               ("\\.h$" . ["template.h" my-template])
               ("\\.cc$" . ["template.c" my-template])
               ("\\.cpp$" . ["template.c" my-template])
               ("\\.cxx$" . ["template.c" my-template])
               ("\\.hpp$" . ["template.h" my-template])
               ("\\.hxx$" . ["template.h" my-template])
               ("\\.py$" . ["template.py" my-template])
               ("\\.rb$" . ["template.rb" my-template])
               ("\\.tex$" . ["template.tex" my-template])
               ) auto-insert-alist))
