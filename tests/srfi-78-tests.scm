(check (+ 1 1) => 2)

;; The following test is expected to fail
;;
;; Per the SRFI-78 documentation:
;;
;; "The output could look like this:
;;
;; (let ((e 53) (x 9007199254740992.0)) (= (+ x 1) x)) => #t ; *** failed ***
;;  ; expected result: #f
;;
(check-ec (:range e 100)
          (:let x (expt 2.0 e))
          (= (+ x 1) x) => #f (e x))
