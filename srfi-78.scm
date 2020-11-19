(module srfi-78
    ()
  (import scheme)
  (import (chicken base))
  (import (chicken module))
  (import (chicken platform))
  (import srfi-42)

  (export
   ;; Fix for Issue 7, "check:mode and check:proc are unbound"
   ;;
   ;;  https://github.com/diamond-lizard/srfi-78/issues/7
   (check check:mode)
   (check check:proc)

   check
   check-ec
   check-report
   check-set-mode!
   check-reset!
   check-passed?)

  (register-feature! 'srfi-78)

  (include "check.scm"))
