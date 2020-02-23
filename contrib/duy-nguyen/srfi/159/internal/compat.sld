(define-library (srfi 159 internal compat)
  (export let-optionals* negative?*)
  (import (scheme base))

  ;; let-optionals*
  (cond-expand
   (chibi
    (import (only (chibi) let-optionals*)))
   (gauche
    (import (only (gauche base) let-optionals*)))
   (else
    (begin
      (define-syntax let-optionals*
        (syntax-rules ()
          ((let-optionals* opt-ls () . body)
           (begin . body))
          ((let-optionals* (op . args) vars . body)
           (let ((tmp (op . args)))
             (let-optionals* tmp vars . body)))
          ((let-optionals* tmp ((var default) . rest) . body)
           (let ((var (if (pair? tmp) (car tmp) default))
                 (tmp2 (if (pair? tmp) (cdr tmp) '())))
             (let-optionals* tmp2 rest . body)))
          ((let-optionals* tmp tail . body)
           (let ((tail tmp)) . body)))))))
  ;; negative?*
  ;; Wrap the sign of a real number, forcing a + prefix or using
  ;; parentheses (n) for negatives according to sign-rule.
  (cond-expand
   (gauche
    (import (only (gauche base) -zero?))
    (begin
      (define (negative?* n)
        (or (negative? n) (-zero? n)))))
   (else                                ; at least chibi and larceny
    (begin
      (define-syntax is-neg-zero?
        (syntax-rules ()
          ((_ n)
           (is-neg-zero? (-0.0) n))
          ((_ (0.0) n)                  ; -0.0 is not distinguished?
           #f)
          ((_ (-0.0) n)
           (eqv? -0.0 n))))
      (define (negative?* n)
        (or (negative? n)
            (is-neg-zero? n)))))))
