(define-library (srfi 159 internal pretty)
  (export pretty pretty-simply)
  (import (scheme base) (scheme write) (srfi 159 internal util) (srfi 159 internal base)
          (srfi 1) (srfi 130))
  (cond-expand
   ((library (srfi 69)) (import (srfi 69)))
   ((library (srfi 125)) (import (srfi 125))))
  (include "pretty.scm"))
