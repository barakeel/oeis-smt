;; sequence(s): A187325
;; terms: 0 0 1 2 4 5 7 7 9 10 12 12 15 15 16 18 20 20 22 22
;; small program: ((((x div 2) div 2) + (x div 2)) + (x div (1 + 2))) + (x div (1 + (2 + 2)))
;; fast program: (((x div 2) + (x div (1 + 2))) + (x div (1 + (2 + 2)))) + (x div (2 + 2))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (+ (+ (divf (divf x 2) 2) (divf x 2)) (divf x (+ 1 2))) (divf x (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (+ (divf x 2) (divf x (+ 1 2))) (divf x (+ 1 (+ 2 2)))) (divf x (+ 2 2))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
