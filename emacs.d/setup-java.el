(autoload 'compile "compile" t)

;(defvar java-mode-plus-map (make-sparse-keymap)
;  "Keymap for the java-mode-plus minor mode.")

;; Make sure ant's output is in a format emacs likes
(setenv "ANT_ARGS" "-emacs")

(defun my-java-mode-hook ()
  (set-fill-column 100)

  (define-key c-mode-base-map "\C-c\C-p" 'show-previous-error)
  (define-key c-mode-base-map "\C-c\C-n" 'show-next-error)

  ;; Locate closest build.xml file, run `ant compile` without any user
  ;; interaction
  ;;
  ;; TODO: Close the new comint buffer if compile succeeds, but keep
  ;; it open if something goes wrong.
  (global-set-key (kbd "C-<f9>")
                  '(lambda () (interactive)
                     (save-buffer)
                     (ant-compile-target "compile")))
  
  (lambda ()
    (auto-fill-mode 1)

    ;; JavaDoc lookup
    (require 'javadoc-lookup)
    (javadoc-add-roots< "/usr/share/doc/openjdk-7-jdk/api"
                       "~/dev/goth/client/docs")
    (global-set-key (kbd "C-h j") 'javadoc-lookup) ;; TODO: Move to keys.el

    ;; When doing Java, use ECB's speedbar
    (when window-system
      (speedbar t))))

(add-hook 'my-java-mode-hook 'google-set-c-style)
(add-hook 'my-java-mode-hook 'google-make-newline-indent)

;; Ant project
(require 'ant-project-mode)

(provide 'setup-java)