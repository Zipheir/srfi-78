(module srfi-78
    ()
  (import scheme)
  (import (chicken base))
  (import (chicken module))
  (import (chicken platform))
  (import srfi-42)

  (export
   ;; See issues 7 and 8:
   ;;
   ;;  https://github.com/diamond-lizard/srfi-78/issues/7
   ;;  https://github.com/diamond-lizard/srfi-78/issues/8
   (check check:mode)
   (check check:proc)
   (check check:proc-ec)

   check
   check-ec
   check-report
   check-set-mode!
   check-reset!
   check-passed?)

  (register-feature! 'srfi-78)

  (include "check.scm"))
