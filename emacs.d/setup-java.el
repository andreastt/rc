(require 'ant-project-mode)

(defun my-java-mode-hook ()
  ;; Java is indeed a verbose language, and we no longer live in
  ;; VT100's.
  (set-fill-column 100)

  ;; Make sure ant's output is in a format Emacs likes.
  (setenv "ANT_ARGS" "-emacs")

  ;; Locate closest build.xml file, run `ant compile` without any user
  ;; interaction.
  ;;
  ;; TODO(ato): Close the new comint buffer if compile succeeds, but
  ;; keep it open if something goes wrong.
  (define-key java-mode-map (kbd "C-<f9>")
    '(lambda () (interactive)
       (save-buffer)
       (ant-compile-target "build")))

  (define-key java-mode-map (kbd "C-b") 'eclim-java-find-declaration)
  (define-key java-mode-map (kbd "C-u") 'eclim-java-find-references)
  (define-key java-mode-map (kbd "S-<f6>") 'eclim-java-refactor-rename-symbol-at-point)
  (define-key java-mode-map (kbd "C-c d") 'eclim-java-show-documentation-for-current-element)
  (define-key java-mode-map (kbd "C-c h") 'eclim-java-hierarchy)
  (define-key java-mode-map (kbd "C-i") 'eclim-java-import-organize)

  (lambda ()
    (auto-fill-mode 1)

    ;; ;; JavaDoc lookup
    ;; (require 'javadoc-lookup)
    ;; (javadoc-add-roots "/usr/share/doc/openjdk-7-jdk/api"
    ;;                    "~/dev/goth/client/docs")
    ;; (global-set-key (kbd "C-h j") 'javadoc-lookup) ;; TODO: Move to keys.el

    ;; ;; When doing Java, use ECB's speedbar
    ;; (when window-system
    ;;   (speedbar t))))
    ))

(add-hook 'java-mode-hook 'my-java-mode-hook)

;; Use Google C style to indent Java as well.  It almost mostly okay.
(add-hook 'java-mode-hook 'google-set-c-style)
(add-hook 'java-mode-hook 'google-make-newline-indent)

;; Ant project
;;(require 'ant-project-mode)

;; (require 'flymake)
;; (defun my-flymake-init ()
;;   (list "my-java-flymake-checks"
;;         (list (flymake-init-create-temp-buffer-copy
;;                'flymake-create-temp-with-folder-structure))))
;; (add-to-list 'flymake-allowed-file-name-masks
;;              '("\\.java$" my-flymake-init flymake-simple-cleanup))

(provide 'setup-java)
