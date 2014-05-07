(unless (package-installed-p 'undo-tree)
  (package-install 'undo-tree))

(global-undo-tree-mode)
