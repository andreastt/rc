(autoload 'x-face-decode-message-header "x-face-e21")
(autoload 'x-face-insert "x-face-e21" nil t)
(autoload 'x-face-save "x-face-e21" nil t)
(autoload 'x-face-show "x-face-e21" nil t)
(autoload 'x-face-ascii-view "x-face-e21" nil t)
(autoload 'x-face-turn-off "x-face-21")

(add-hook 'mime-edit-translate-hook 'x-face-turn-off)
(add-hook 'mew-make-message-hook 'x-face-turn-off)

(provide 'setup-xface)