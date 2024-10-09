;; sequence(s): A198517
;; terms: 1 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 0 1 0 0
;; small program: ((1 + x) mod (1 + (2 + 2))) mod 2
;; fast program: if (((2 - x) * x) mod (1 + (2 + 2))) <= 0 then 1 else 0
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (modf (modf (+ 1 x) (+ 1 (+ 2 2))) 2))))
(assert (forall ((x Int)) (= (fast x) (ite (<= (modf (* (- 2 x) x) (+ 1 (+ 2 2))) 0) 1 0))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
