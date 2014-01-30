(defun view-source (url)
  "Ask user for a URL and display headers and source in a new
buffer."
  (interactive "sURL: ")
  (start-process "curl" (get-buffer-create "*view-source*")
                 "curl" "-si" url)
  (split-window-vertically)
  (switch-to-buffer "*view-source*"))
