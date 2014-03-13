(require 'package)

(setq my-packages
      '(
        auto-complete-c-headers
        js2-mode
        clojure-mode
        go-mode
        google-c-style
        multi-term
        helm-ls-git
        helm
        git
        autopair
        zoom-frm
        smooth-scrolling
        multi-web-mode
        mark-multiple
        javadoc-lookup
        gtags
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

(provide 'setup-package)
