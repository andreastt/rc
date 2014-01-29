(defun insert-date-time ()
  "Insert current date-time string in full
ISO 8601 format.
Example: 2010-11-29T23:23:35-08:00
See: URL `http://en.wikipedia.org/wiki/ISO_8601'
"
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end)))
  (insert
   (concat
    (format-time-string "%Y-%m-%dT%T")
    ((lambda (x) (concat (substring x 0 3) ":" (substring x 3 5)))
     (format-time-string "%z")))))
