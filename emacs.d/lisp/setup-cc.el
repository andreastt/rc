;;; Default options for c-mode-common, which implicitly affects all C
;;; like languages and modes such as c-mode, c++-mode, java-mode, &c.

;; Change scroll behaviour of compilation
(setq compilation-scroll-output 'first-error)

;; ;; global is used for looking up tags and symbols.
;; (defun my-gtags-hook ()
;;   ;; Find a tag
;;   (local-set-key (kbd "M-.") 'gtags-find-tag)

;;   ;; Find reverse tag
;;   (local-set-key (kbd "M-,") 'gtags-find-rtag))
;; (add-hook 'gtags-mode-hook 'my-gtags-hook)

(defun my-c-common-hook ()
  ;; Kill compilation
  ;; (local-key-set (kbd "C-<f2>") 'kill-compilation)
  (define-key c-mode-base-map (kbd "C-<f2>") 'kill-compilation)

  ;; Traverse compile errors
  (define-key c-mode-base-map (kbd "C-c n") 'next-error)
  (define-key c-mode-base-map (kbd "C-c p") 'previous-error)

  ;; Auto complete with default config
  (require 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default)

  ;; Allow auto completion (using auto-complete) of C and C++ headers.
  ;; One can ask clang to search for include directories using `clang
  ;; -xc++ -E -v -`.
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '" /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include"))
(add-hook 'c-mode-common-hook 'my-c-common-hook)

(provide 'setup-cc)
