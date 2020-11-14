(module srfi-78
    ()
  (import scheme)
  (import (chicken base))
  (import (chicken module))
  (import (chicken platform))
  (import srfi-42)

  (export
   check
   check-ec
   check-report
   check-set-mode!
   check-reset!
   check-passed?)

  (register-feature! 'srfi-78)

  (include "check.scm"))
