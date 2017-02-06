(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("C-c y"   . helm-show-kill-ring)
         ("C-c m"   . helm-man-woman)
         ("C-c o"   . helm-occur)
         :map helm-map
         ("C-h" . delete-backward-char)
         :map helm-find-files-map
         ("C-h" . delete-backward-char))
  :config
  (helm-mode 1))
