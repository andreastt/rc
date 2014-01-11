(autoload 'password-cache "password-cache" t)
(autoload 'tramp "tramp" t)

(setq password-cache-expiry nil    ;; If required to enter password,
                                   ;; save it forever
      tramp-default-method "scp")  ;; Uses ControlMaster auto

(provide 'setup-tramp)
