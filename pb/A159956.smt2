;; sequence(s): A159956
;; terms: 0 1 2 3 1 2 3 0 2 3 0 1 3 0 1 2 0 1 2 3
;; small program: (((x div 2) div 2) + x) mod (2 + 2)
;; fast program: ((x div (2 + 2)) + x) mod (2 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (modf (+ (divf (divf x 2) 2) x) (+ 2 2)))))
(assert (forall ((x Int)) (= (fast x) (modf (+ (divf x (+ 2 2)) x) (+ 2 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
