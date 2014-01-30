;; multi-web-mode enables switching major mode contexts within a
;; single file, which is useful for web related files that often
;; combine JavaScript, HTML, and CSS in the same file.

(require 'multi-web-mode)

(setq mweb-default-major-mode 'html-mode
      mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script[^>]*>" "</script>")
                  (css-mode "<style[^>]*>" "</style>"))
      mweb-filename-extensions '("html" "htm" "jinja2" "ctp" "phtml" "php" "php4" "php5" "mak"))

(multi-web-global-mode 1)

(provide 'setup-multi-web)
