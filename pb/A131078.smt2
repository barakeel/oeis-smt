;; sequence(s): A131078
;; terms: 1 1 1 1 0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1
;; small program: 1 - (((x div 2) div 2) mod 2)
;; fast program: 1 - ((x div (2 + 2)) mod 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- 1 (modf (divf (divf x 2) 2) 2)))))
(assert (forall ((x Int)) (= (fast x) (- 1 (modf (divf x (+ 2 2)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
