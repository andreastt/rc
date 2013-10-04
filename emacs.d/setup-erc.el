(require 'znc)

;; Don't part channels on killing the buffers.
(setq znc-detach-on-kill nil
      znc-servers (quote (("sny.no" 6697 t ((sny "ato" ""))))))

;; Default full name and user ID
(setq erc-user-full-name "Andreas Tolfsen"
      erc-email-userid "ato@sny.no")

;; Logging
(setq erc-log-insert-log-on-open nil
      erc-log-channels t
      erc-log-channels-directory "~/irclogs"
      erc-save-buffer-on-part t
      erc-hide-timestamps nil)

;; Limit the buffers
(setq erc-max-buffer-size 20000)

;; Use wildcards in server names since actual server names can be
;; different.
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#selenium")
        (".*\\.ircnet.net" "#e-tjenesten")
        (".*\\.w3.org" "#testing")))

;; Track discussions involving me in channels, but I don't care about
;; people entering, leaving, &c.
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))

;; Don't show these lines.
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;; Start or switch to existing ERC session.  Will also highlight the
;; most recent buffer.
(defun erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667")
      (erc-track-switch-buffer 1)
    (when (y-or-n-p "IRC, yez? ")
      (erc :server "irc.freenode.net" :port 6667 :nick "andreastt")
      (erc :server "open.ircnet.net" :port 6667 :nick "ato")
      (erc :server "irc.w3.org" :port 6667 :nick "andreastt"))))

(provide 'setup-erc)
