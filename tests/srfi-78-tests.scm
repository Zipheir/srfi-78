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
;; Start of: check--test-002
;;

(define (check--test-002)
  (parameterize ((current-output-port (open-output-string)))
    (check (+ 1 1) => 3)
    (get-output-string (current-output-port))))

(define check--test-002--expected-output
  (string-join
   '(
     "\n"
     "(+ 1 1) => 2"
     " ; "
     "*** failed ***"
     "\n"
     " ; "
     "expected result: 3"
     "\n"
     )
   ""))

(test check--test-002--expected-output (check--test-002))

;;
;; End of: check--test-002
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

;;============================================================================
;;
;; Start of: check-ec--test-002
;;

;; Per the SRFI-78 documentation, regarding this test it:
;;
;;   "fails on fixnums"
;;
;; However, on Chicken 5.2.0 it succeeds.
;;
;; After discussion in #chicken, it was decided that this test
;; was not guaranteed to fail on any Scheme, and therefore it's
;; not a valid test on Chicken.
;;
;; However, I'm keeping it here as documentation, and making
;; its success pass the test instead of failing it.
;;
(define (check-ec--test-002)
  (parameterize ((current-output-port (open-output-string)))
    (check-ec (: e 100) (positive? (expt 2 e)) => #t (e))
    (get-output-string (current-output-port))))

(define check-ec--test-002-expected-output
 (string-join
  '("\n"
    "(check-ec (: e 100) (positive? (expt 2 e)) (=> equal?) #t (e))"
    " => "
    "#<unspecified>"
    " ; "
    "correct (100 cases checked)"
    "\n")
  ""))

(test
 check-ec--test-002-expected-output
 (check-ec--test-002))

;;
;; End of: check-ec--test-002
;;
;;============================================================================

;;============================================================================
;;
;; Start of: check-ec--test-003
;;

;; Per the SRFI-78 documentation, this test is expected to fail

(define (check-ec--test-003)
  (parameterize ((current-output-port (open-output-string)))
    (check-ec (: e 100) (:let x (expt 2.0 e)) (= (+ x 1) x) => #f (x))
    (get-output-string (current-output-port))))

(define check-ec--test-003-expected-output
 (string-join
  '("\n"
    "(let ((x 9007199254740992.0)) (= (+ x 1) x))"
    " => "
    "#t"
    " ; "
    "*** failed ***"
    "\n"
    " ; "
    "expected result: #f"
    "\n")
  ""))

(test
 check-ec--test-003-expected-output
 (check-ec--test-003))

;;
;; End of: check-ec--test-003
;;
;;============================================================================

;;============================================================================
;;
;; Start of: check-ec--test-004
;;

;; Per the SRFI-78 documentation, this test:
;;
;;   "passes with 10^3 cases checked"

(define (check-ec--test-004)
  (parameterize ((current-output-port (open-output-string)))
    (check-ec (: x 10) (: y 10) (: z 10)
              (* x (+ y z)) => (+ (* x y) (* x z))
              (x y z))
    (get-output-string (current-output-port))))

(define check-ec--test-004-expected-output
 (string-join
  '(
    "\n"
    "(check-ec (nested (: x 10) (: y 10) (: z 10)) (* x (+ y z)) (=> equal?)"
    " "
    "(+ (* x y) (* x z)) (x y z))"
    " => "
    "#<unspecified>"
    " ; "
    "correct (1000 cases checked)"
    "\n"
    )
  ""))

(test
 check-ec--test-004-expected-output
 (check-ec--test-004))

;;
;; End of: check-ec--test-004
;;
;;============================================================================
