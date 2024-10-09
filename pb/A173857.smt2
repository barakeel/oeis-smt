;; sequence(s): A173857
;; terms: 1 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0
;; small program: ((if x <= 0 then 2 else x) mod (1 + 2)) div 2
;; fast program: ((if x <= 0 then 1 else x) - (x * x)) mod (1 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (modf (ite (<= x 0) 2 x) (+ 1 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (modf (- (ite (<= x 0) 1 x) (* x x)) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
