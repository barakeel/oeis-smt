;; sequence(s): A211669
;; terms: 0 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2
;; small program: 1 + ((x - 1) div (1 + (2 + (x div 2))))
;; fast program: if (((x - 2) - 2) - 2) <= 0 then (if x <= 0 then 0 else 1) else 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (divf (- x 1) (+ 1 (+ 2 (divf x 2))))))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (- (- (- x 2) 2) 2) 0) (ite (<= x 0) 0 1) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
