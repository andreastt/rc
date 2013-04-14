;; (setq eclim-auto-save t
;;       eclimd-wait-for-process nil
;;       eclimd-default-workspace "~/dev"
;;       help-at-pt-display-when-idle t
;;       help-at-pt-timer-delay 0.1)

;; ;; Load both eclim and eclimd (so that we can control eclimd from
;; ;; within Emacs)
;; (require 'eclim)
;; (require 'eclimd)

;; ;; Display compilation error messages in the echo area
;; (help-at-pt-set-timer)
;; (global-eclim-mode)

;; ;; Hook eclim up with auto-complete mode
;; ;(require 'auto-complete-config)
;; ;(ac-config-default)
;; (require 'ac-emacs-eclim-source)
;; (add-hook 'eclim-mode-hook (lambda ()
;;                              (add-to-list 'ac-sources 'ac-source-emacs-eclim)))
;; ;                             (add-to-list 'ac-sources 'ac-source-emacs-eclim-c-dot)))

;; (provide 'setup-eclim)

(require 'eclim)
(global-eclim-mode)

(setq eclim-auto-save t
      eclim-executable "/opt/eclipse/eclim"
      eclimd-executable "/opt/eclipse/eclimd"
      eclimd-wait-for-process nil
      elcimd-default-workspace "~/dev"
      help-at-pt-display-when-idle t
      help-at-pt-timer-delay 0.1
      ac-delay 0.5)

;; Call the help framework with the settings above and activate
;; eclim-mode
(help-at-pt-set-timer)

;; Hook eclim up with auto complete mode
(require 'auto-complete-config)
(ac-config-default)
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(provide 'setup-eclim)