;; sequence(s): A184549
;; terms: 0 6 17 23 28 34 45 51 56 62 73 79 84 90 101 107 112 118 129 135
;; small program: (((1 + 2) * ((((x div 2) mod 2) + x) + x)) - (x mod 2)) + x
;; fast program: (2 * ((1 + 2) * (((2 + x) div (2 + 2)) + x))) - (x div 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (- (* (+ 1 2) (+ (+ (modf (divf x 2) 2) x) x)) (modf x 2)) x))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (* (+ 1 2) (+ (divf (+ 2 x) (+ 2 2)) x))) (divf x 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
