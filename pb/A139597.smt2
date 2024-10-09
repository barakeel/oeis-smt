;; sequence(s): A139597
;; terms: 0 7 15 30 46 69 93 124 156 195 235 282 330 385 441 504 568 639 711 790
;; small program: ((2 * ((2 + x) * x)) - (x div 2)) + (x mod 2)
;; fast program: (2 * ((x * x) + x)) + ((1 + 2) * ((1 + x) div 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (* 2 (* (+ 2 x) x)) (divf x 2)) (modf x 2)))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (+ (* x x) x)) (* (+ 1 2) (divf (+ 1 x) 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
