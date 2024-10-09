;; sequence(s): A280014
;; terms: 12 18 22 28 42 48 52 58 72 78 82 88 102 108 112 118 132 138 142 148
;; small program: (((2 + (((x div 2) div 2) + x)) * (1 + 2)) - ((x div 2) mod 2)) * 2
;; fast program: (((2 + ((2 * (x div (2 + 2))) + x)) * ((2 + 1) + 2)) + (x mod 2)) + 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (- (* (+ 2 (+ (divf (divf x 2) 2) x)) (+ 1 2)) (modf (divf x 2) 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (* (+ 2 (+ (* 2 (divf x (+ 2 2))) x)) (+ (+ 2 1) 2)) (modf x 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
