;; sequence(s): A212747
;; terms: 1 4 13 32 63 108 171 256 365 500 665 864 1099 1372 1687 2048 2457 2916 3429 4000
;; small program: (((1 + ((x * x) + x)) * (2 + x)) - ((x div 2) mod 2)) div 2
;; fast program: ((2 * ((((1 + x) * ((2 + x) * x)) - x) div (2 + 2))) + x) + 1
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (- (* (+ 1 (+ (* x x) x)) (+ 2 x)) (modf (divf x 2) 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* 2 (divf (- (* (+ 1 x) (* (+ 2 x) x)) x) (+ 2 2))) x) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
