(autoload 'password-cache "password-cache" t)
(autoload 'tramp "tramp" t)
(setq password-cache-expiry nil
      tramp-default-method "scp")

(provide 'setup-tramp)
