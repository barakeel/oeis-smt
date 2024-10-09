;; sequence(s): A241406
;; terms: 11 50 72 111 133 172 194 233 255 294 316 355 377 416 438 477 499 538 560 599
;; small program: ((((((1 + (2 + 2)) * (1 + ((((x mod 2) + x) + x) + x))) - (x mod 2)) * 2) + 1) - (x div 2)) + x
;; fast program: ((((((((1 + 2) * (1 + ((((x mod 2) + x) + x) + x))) + x) * 2) + 1) * (1 + 2)) + 1) + x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (+ (* (- (* (+ 1 (+ 2 2)) (+ 1 (+ (+ (+ (modf x 2) x) x) x))) (modf x 2)) 2) 1) (divf x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (+ (* (+ (* (+ (* (+ 1 2) (+ 1 (+ (+ (+ (modf x 2) x) x) x))) x) 2) 1) (+ 1 2)) 1) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
