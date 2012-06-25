;; Show diary entries automatically, and week starts on Monday
(setq mark-diary-entries-in-calendar t
      calendar-week-start-day 1)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;; Week numbers in calendar
(copy-face font-lock-constant-face 'calendar-iso-week-face)
(set-face-attribute 'calendar-iso-week-face nil
                    :height 0.7)
(setq calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'calendar-iso-week-face))

(provide 'setup-diary)