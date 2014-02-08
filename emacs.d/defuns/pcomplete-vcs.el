;;**** Git Completion

(defun pcmpl-git-commands ()
  "Return the most common git commands by parsing the git output."
  ;; TODO(ato): Make this read the alias list in .gitconfig too
  (with-temp-buffer
    (call-process-shell-command "git" nil (current-buffer) nil "help" "--all")
    (goto-char 0)
    (search-forward "available git commands in")
    (let (commands)
      ;; Git aliases
      (push "co" commands)
      (push "st" commands)
      (push "cp" commands)
      (push "squash" commands)
      (push "fixup" commands)
      (push "format-last-patch" commands)
      (while (re-search-forward
	      "^[[:blank:]]+\\([[:word:]-.]+\\)[[:blank:]]*\\([[:word:]-.]+\\)?"
	      nil t)
	(push (match-string 1) commands)
	(when (match-string 2)
	  (push (match-string 2) commands)))
      (sort commands #'string<))))

(defconst pcmpl-git-commands (pcmpl-git-commands)
  "List of `git' commands.")

(defvar pcmpl-git-ref-list-cmd "git for-each-ref refs/ --format='%(refname)'"
  "The `git' command to run to get a list of refs.")

(defun pcmpl-git-get-refs (type)
  "Return a list of `git' refs filtered by TYPE."
  (with-temp-buffer
    (insert (shell-command-to-string pcmpl-git-ref-list-cmd))
    (goto-char (point-min))
    (let (refs)
      (while (re-search-forward (concat "^refs/" type "/\\(.+\\)$") nil t)
	(push (match-string 1) refs))
      (nreverse refs))))

(defun pcmpl-git-remotes ()
  "Return a list of remote repositories."
  (split-string (shell-command-to-string "git remote")))

(defun pcomplete/git ()
  "Completion for `git'."
  ;; Completion for the command argument.
  (pcomplete-here* pcmpl-git-commands)
  (cond
   ((pcomplete-match "help" 1)
    (pcomplete-here* pcmpl-git-commands))
   ((pcomplete-match (regexp-opt '("pull" "push")) 1)
    (pcomplete-here (pcmpl-git-remotes)))
   ;; provide branch completion for the command `checkout'.
   ((pcomplete-match "checkout" 1)
    (pcomplete-here* (append (pcmpl-git-get-refs "heads")
			     (pcmpl-git-get-refs "tags"))))
   (t
    (while (pcomplete-here (pcomplete-entries))))))

;;**** Bzr Completion

(defun pcmpl-bzr-commands ()
  "Return the most common bzr commands by parsing the bzr output."
  (with-temp-buffer
    (call-process-shell-command "bzr" nil (current-buffer) nil "help" "commands")
    (goto-char 0)
    (let (commands)
      (while (re-search-forward "^\\([[:word:]-]+\\)[[:blank:]]+" nil t)
	(push (match-string 1) commands))
      (sort commands #'string<))))

(defconst pcmpl-bzr-commands (pcmpl-bzr-commands)
  "List of `bzr' commands.")

(defun pcomplete/bzr ()
  "Completion for `bzr'."
  ;; Completion for the command argument.
  (pcomplete-here* pcmpl-bzr-commands)
  (cond
   ((pcomplete-match "help" 1)
    (pcomplete-here* pcmpl-bzr-commands))
   (t
    (while (pcomplete-here (pcomplete-entries))))))

;;**** Mercurial (hg) Completion

(defun pcmpl-hg-commands ()
  "Return the most common hg commands by parsing the hg output."
  (with-temp-buffer
    (call-process-shell-command "hg" nil (current-buffer) nil "-v" "help")
    (goto-char 0)
    (search-forward "list of commands:")
    (let (commands
	  (bound (save-excursion
		   (re-search-forward "^[[:alpha:]]")
		   (forward-line 0)
		   (point))))
      (while (re-search-forward
	      "^[[:blank:]]\\([[:word:]]+\\(?:, [[:word:]]+\\)*\\)" bound t)
	(let ((match (match-string 1)))
	  (if (not (string-match "," match))
	      (push (match-string 1) commands)
	    (dolist (c (split-string match ", ?"))
	      (push c commands)))))
      (sort commands #'string<))))

(defconst pcmpl-hg-commands (pcmpl-hg-commands)
  "List of `hg' commands.")

(defun pcomplete/hg ()
  "Completion for `hg'."
  ;; Completion for the command argument.
  (pcomplete-here* pcmpl-hg-commands)
  (cond
   ((pcomplete-match "help" 1)
    (pcomplete-here* pcmpl-hg-commands))
   (t
    (while (pcomplete-here (pcomplete-entries))))))
