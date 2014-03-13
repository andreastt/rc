(require 'package)

(setq my-packages
      '(
        auto-complete-c-headers
        autopair
        clojure-mode
        dired-details
        frame-cmds
        frame-fns
        git
        go-mode
        google-c-style
        gtags
        helm-ls-git
        javadoc-lookup
        js2-mode
        mark-multiple
        multi-term
        multi-web-mode
        zoom-frm
        ))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (pkg my-packages)
  (when (and (not (package-installed-p pkg))
             (assoc pkg package-archive-contents))
    (package-install pkg)))

(defun package-list-unaccounted-packages ()
  "Like `package-list-packages', but shows only the packages that
are installed and are not in `my-packages`.  Useful for cleaning
out unwanted packages."
  (interactive)
  (package-show-package-list
   (remove-if-not (lambda (x) (and (not (memq x my-packages))
                                   (not (package-built-in-p x))
                                   (package-installed-p x)))
                  (mapcar 'car package-archive-contents))))

(provide 'packages)
