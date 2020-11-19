;;============================================================================
;;
;; Start of: check--test-001
;;

(define (check--test-001)
  (parameterize ((current-output-port (open-output-string)))
    (check (+ 1 1) => 2)
    (get-output-string (current-output-port))))

(define check--test-001--expected-output
  (string-join
   '(
     "\n"
     "(+ 1 1) => 2"
     " ; "
     "correct"
     "\n"
     )
   ""))

(test check--test-001--expected-output (check--test-001))

;;
;; End of: check--test-001
;;
;;============================================================================

;;============================================================================
;;
;; Start of: check-ec--test-001
;;

;; The following test is expected to fail
;;
;; Per the SRFI-78 documentation:
;;
;; "The output could look like this:
;;
;; (let ((e 53) (x 9007199254740992.0)) (= (+ x 1) x)) => #t ; *** failed ***
;;  ; expected result: #f
;;
(define (check-ec--test-001)
  (parameterize ((current-output-port (open-output-string)))
    (check-ec (:range e 100)
              (:let x (expt 2.0 e))
              (= (+ x 1) x) => #f (e x))
    (get-output-string (current-output-port))))

(define check-ec--test-001-expected-output
 (string-join
  '("\n"
    "(let ((e 53) (x 9007199254740992.0)) (= (+ x 1) x)) => #t"
    " ; "
    "*** failed ***"
    "\n"
    " ; "
    "expected result: #f"
    "\n")
  ""))

(test
 check-ec--test-001-expected-output
 (check-ec--test-001))

;;
;; End of: check-ec--test-001
;;
;;============================================================================
