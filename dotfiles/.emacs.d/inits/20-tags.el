(defadvice find-tag (before c-tag-file activate)
  "Create tags file automatically."
  (let ((tag-file (concat default-directory "TAGS")))
    (unless (file-exists-p tag-file)
      (shell-command
       (format "etags `find . %s` -o TAGS 2>/dev/null"
               (mapconcat
                (lambda (x) (format "-name '*.%s'" x))
                '("c" "h" "cc" "cpp" "cxx" "hpp" "hxx" "el" "py" "rb" "java")
                " -o "))))
    (visit-tags-table tag-file)))
