;; Make mh-e the default MUA for sending and reading mail
(setq mail-user-agent 'mh-e-user-agent
      read-mail-command 'mh-rmail)

(setq mh-send-uses-spost-flag t
      mail-header-separator "--------")
