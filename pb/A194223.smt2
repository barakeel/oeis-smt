;; sequence(s): A194223
;; terms: 0 0 1 1 2 2 2 3 3 4 5 5 5 5 6 6 7 7 7 8
;; small program: ((((2 + x) div (1 + 2)) + ((x div (1 + 2)) mod 2)) + (x div 2)) div 2
;; fast program: (((if ((2 + x) mod (2 + (2 + 2))) <= 0 then 1 else 0) - (x div (2 + (2 + 2)))) + x) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ (+ (divf (+ 2 x) (+ 1 2)) (modf (divf x (+ 1 2)) 2)) (divf x 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (- (ite (<= (modf (+ 2 x) (+ 2 (+ 2 2))) 0) 1 0) (divf x (+ 2 (+ 2 2)))) x) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
