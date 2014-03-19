;; Thanks to Lars Magne Ingebrigtsen!
;; http://lars.ingebrigtsen.no/2014/03/10/offensive-code/

(defvar roman-numeral-mapping
  '((1000 . "M") (500 . "D") (100 . "C") (50 . "L")
    (10 . "X") (5 . "V") (1 . "I")))

(defun format-roman-numeral (number)
  "Format NUMBER into a Roman numeral.
Roman numerals look like \"XCVII\"."
  (let ((mapping roman-numeral-mapping)
        values roman elem subtract)
    ;; Add the subtractive elements ("IV", etc) to the mapping.
    (while (setq elem (pop mapping))
      (push elem values)
      ;; We use the feature that the subtractive element is alternatively
      ;; one or two elements further along in the list.
      (when (setq subtract (elt mapping (mod (1+ (length mapping)) 2)))
        (push (cons (- (car elem) (car subtract))
                    (concat (cdr subtract) (cdr elem)))
              values)))
    ;; Compute the Roman numeral.
    (dolist (value (nreverse values))
      (while (>= number (car value))
        (push (cdr value) roman)
        (setq number (- number (car value)))))
    (apply 'concat (nreverse roman))))
