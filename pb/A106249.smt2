;; sequence(s): A106249
;; terms: 1 0 1 2 3 2 3 4 5 4 5 6 7 6 7 8 9 8 9 10
;; small program: (x div 2) + (((2 - x) div 2) mod 2)
;; fast program: 1 + ((2 * ((0 - x) div (2 + 2))) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf x 2) (modf (divf (- 2 x) 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ (* 2 (divf (- 0 x) (+ 2 2))) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
