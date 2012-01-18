;; mode:-*-emacs-lisp-*-
;; wanderlust

(setq
 elmo-maildir-folder-path "~/.mail"

 mime-edit-split-message nil
 wl-fcc-force-as-read t
 wl-folder-window-width 25
 wl-forward-subject-prefix "Fwd: " ;; use "Fwd: ", not "Forward: "
 ;;wl-insert-message-id nil ;; let SMTP handle message-id
 wl-local-domain "sny.no"  ;; baldr.sny.no
 wl-stay-folder-window t
 wl-summary-always-sticky-folder-list t
 wl-summary-width 150

 wl-from "Andreas Tolf Tolfsen <ato@sny.no>"

 wl-template-alist
 '(
   ("opera"
    (wl-message-id-domain . "opera.com")
    (wl-local-domain . wl-message-id-domain)
    (wl-from . "Andreas Tolf Tolfsen <andreastt@opera.com>")
    ("From" . wl-from)
    ("Organization" . "Opera Software ASA")
    (wl-default-folder . ".Opera/INBOX")
    (wl-draft-folder . ".Opera/Drafts")
    (wl-trash-folder . ".Opera/Trash")
    ;;(wl-spam-folder . ".Opera/Trash")
    (wl-queue-folder . ".Opera/Queue")
    (wl-fcc . ".Opera/Sent"))
   ("personal"
    (wl-message-id-domain . "sny.no")
    (wl-local-domain . wl-message-id-domain)
    (wl-from . "Andreas Tolf Tolfsen <ato@sny.no>")
    ("From" . wl-from)
    (wl-default-folder . ".Personal/INBOX")
    (wl-draft-folder . ".Personal/INBOX.Drafts")
    (wl-trash-folder . ".Personal/INBOX.Deleted Messages")
    ;;(wl-spam-folder . ".Personal/INBOX.Deleted Messages")
    (wl-queue-folder . ".Personal/Queue")
    (wl-fcc . ".Personal/Sent Messages"))
   ("fsfe"
    (wl-message-id-domain . "fsfe.org")
    (wl-local-domain . wl-message-id-domain)
    (wl-from . "Andreas Tolf Tolfsen <ato@fsfe.org>")
    ("From" . wl-from)
    ("Organization" . "Free Software Foundation Europe")
    (wl-default-folder . ".FSFE/INBOX")
    (wl-draft-folder . ".FSFE/Drafts")
    (wl-trash-folder . ".FSFE/INBOX.Trash")
    ;;(wl-spam-folder . ".FSFE/INBOX.Trash")
    (wl-queue-folder . ".FSFE/Queue")
    (wl-fcc . ".FSFE/INBOX.Out"))
   ("etjenesten"
    (wl-message-id-domain . "e-tjenesten.org")
    (wl-local-domain . wl-message-id-domain)
    (wl-from . "Andreas Tolf Tolfsen <ato@e-tjenesten.org>")
    ("From" . wl-from)
    ("Organization" . "E-tjenesten SA")
    (wl-default-folder . ".Etjenesten/INBOX")
    (wl-draft-folder . ".Etjenesten/Drafts")
    (wl-trash-folder . ".Etjenesten/Deleted Messages")
    ;;(wl-spam-folder . ".Etjenesten/Deleted Messages")
    (wl-queue-folder . ".Etjenesten/Queue")
    (wl-fcc . ".Etjenesten/Out"))
   )

 ;; Automatically select the correct template based on which folder
 ;; I'm visiting.
 wl-draft-config-matchone t
 wl-draft-config-alist
 '(

   ;; Personal
   (
    (and (string-match ".*personal" wl-draft-parent-folder))
    (template . "personal")
    )

   ;; Opera
   (
    (and (string-match ".*opera" wl-draft-parent-folder))
    (template . "opera")
    )

   ;; FSFE
   (
    (and (string-match ".*fsfe" wl-draft-parent-folder))
    (template . "fsfe")
    )

   ;; E-tjenesten
   (
    (and (string-match ".*etjenesten" wl-draft-parent-folder))
    (template . "etjenesten")
    )

   )

 ;; Hide many fields from message buffers
 wl-message-ignored-field-list '("^.*:")
 wl-message-visible-field-list
 '("^\\(To\\|Cc\\|Bcc\\):"
   "^Mail-Follow-Up-To:"
   "^Subject:"
   "^\\(From\\|Reply-To\\):"
   "^Organization:"
   "^Date:"
   "^Message-Id:"
   "^\\(Posted\\|Date\\):"
   "^[xX]-[Ff]ace:"
   "^[xX]-[uU]rl:"
   "^[xX]-[dD]iagnostic:"
   "^[xX]-[mM]ailer:"
   "^User-Agent:"
   "^[xX]-[eE]nvelope-to:"
   )
 wl-message-sort-field-list
 '("^From"
   "^Organization:"
   "^X-Attribution:"
   "^Subject"
   "^Date"
   "^To"
   "^Cc")

)

;; Apply wl-draft-config-alist as soon as you enter in a draft buffer.  Without
;; this Wanderlust would apply it only whenactually sending the email.
(add-hook 'wl-mail-setup-hook 'wl-draft-config-exec)

;; Enables auto-fill-mode in the draft buffer
(add-hook 'wl-mail-setup-hook 'auto-fill-mode)

;; ;; ----
;; ;; BBDB
;; ;; ----
;;(require 'bbdb-wl)
;;(bbdb-wl-setup)

;; (setq bbdb-use-pop-up nil ;; disable pop-ups
;;       ;; bbdb-pop-up-target-lines 5  ;; only useful if pop-ups are enabled
;;       )

;; Shows the name of bbdb in the summary.  Defalut value of this
;; variable is wl-summary-default-from whichdoes not use bbdb, but the
;; wanderlust address book instead.
;;(setq wl-summary-from-function 'bbdb-wl-from-func)

;; You can complete the address with bbdb using `M-TAB' in draft buffer.


;; Wanderlust compose becomes bound to C-x m
(autoload 'wl-user-agent-cmpose "wl-draft" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))
