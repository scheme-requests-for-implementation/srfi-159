(define-library (srfi 159)
  (export
   ;; base
   call-with-output displayed each each-in-list escaped fitted
   fitted/both fitted/right fl fn forked joined joined/dot joined/last
   joined/prefix joined/range joined/suffix maybe-escaped nl nothing
   numeric numeric/comma numeric/fitted numeric/si padded padded/both
   padded/right pretty pretty-simply show space-to tab-to trimmed
   trimmed/both trimmed/lazy trimmed/right with with! written
   written-simply
   ;; color
   as-red as-blue as-green as-cyan as-yellow as-magenta as-white
   as-black as-bold as-underline
   ;; columnar
   call-with-output-generator call-with-output-generators columnar
   from-file justified line-numbers show-columns string->line-generator
   tabular wrapped wrapped/char wrapped/list
   ;; unicode
   as-unicode unicode-terminal-width)
  (import (srfi 159 base)
          (srfi 159 color)
          (srfi 159 columnar)
          (srfi 159 unicode)))
