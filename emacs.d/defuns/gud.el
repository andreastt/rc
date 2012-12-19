(defun gud-point-in-gud-overlay (pos)
  (find-if (lambda (ov) (gud-overlay-p ov))
           (overlays-at pos)))

(defun gud-overlay-p (ov)
  "Determine whether overlay OV was created by gud."
  (and (overlayp ov) (overlay-get ov 'gud-overlay)))

(defun gud-toggle-breakpoint (file line-no)
  "If a breakpoint exists for current buffer and line, remove it;
otherwise set a new breakpoint."
  (interactive (list
                (buffer-name (current-buffer))
                (line-number-at-pos (point))))
  (if (gud-point-in-gud-overlay (point))
      (gud-fdb-remove-breakpoint file line-no)
    (gud-fdb-set-breakpoint file line-no)))

(defun gud-fdb-set-breakpoint (file line-no)
  "Set a breakpoint."
  (save-excursion
    (with-current-buffer file
      (goto-line line-no)
      (gud-break nil)
      (gud-fdb-refresh-breakpoint-overlays))))

(defun gud-fdb-remove-breakpoint (file line-no)
  "Remove a breakpoint from the current buffer."
  (save-excursion
    (with-current-buffer file
      (goto-line line-no)
      (gud-remove nil)
      (gud-fdb-refresh-breakpoint-overlays))))

(defun gud-fdb-refresh-breakpoint-overlays ()
  "Send an info request to fdb - filter will catch the reply.."
  (gud-list-breakpoints nil))
