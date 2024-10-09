;; sequence(s): A275910
;; terms: 2 3 4 5 6 7 11 12 13 14 15 16 20 21 22 23 24 25 29 30
;; small program: 2 + (((x div 2) - ((x div 2) mod (1 + 2))) + x)
;; fast program: 2 + (((1 + 2) * (x div (2 + (2 + 2)))) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 2 (+ (- (divf x 2) (modf (divf x 2) (+ 1 2))) x)))))
(assert (forall ((x Int)) (= (fast x) (+ 2 (+ (* (+ 1 2) (divf x (+ 2 (+ 2 2)))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
