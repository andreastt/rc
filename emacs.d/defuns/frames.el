(defun setup-frame-hook (frame)
  "This function will be applied to all new Emacs frames."
  (set-frame-parameter frame 'alpha '(95 95)) ;; translucency
  (mouse-avoidance-mode 'cat-and-mouse)       ;; avoid mouse
  (fringe-mode 5)                             ;; make fringes smaller
  (tool-bar-mode 0)                           ;; no toolbar
  (menu-bar-mode 0)                           ;; no menubar
  (set-frame-parameter (selected-frame) 'alpha '(95 95))  ;; translucency
  (color-theme-charcoal-black))

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))
