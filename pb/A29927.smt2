;; sequence(s): A29927
;; terms: 0 1 2 3 5 6 7 8 9 10 12 13 14 15 16 17 18 20 21 22
;; small program: ((1 + (((x div 2) + x) div (1 + (2 + 2)))) div 2) + x
;; fast program: ((1 + (((x + x) + x) div (2 + (2 * (2 + 2))))) div 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (+ 1 (divf (+ (divf x 2) x) (+ 1 (+ 2 2)))) 2) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (+ 1 (divf (+ (+ x x) x) (+ 2 (* 2 (+ 2 2))))) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
