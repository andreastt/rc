;(autoload 'eclim "eclim" t)
(require 'eclim)
(global-eclim-mode)

(setq eclim-auto-save t
      eclim-executable "~/bin/eclipse/eclim"
      eclimd-executable "~/bin/eclipse/eclimd"
      eclimd-wait-for-process nil
      elcimd-default-workspace "~/dev"
      help-at-pt-display-when-idle t
      help-at-pt-timer-delay 0.1
      ac-delay 0.1)

;; Call the help framework with the settings above and activate
;; eclim-mode
(help-at-pt-set-timer)

;; Hook eclim up with auto complete mode
(require 'auto-complete-config)
(ac-config-default)
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

(provide 'setup-eclim)
