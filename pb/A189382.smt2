;; sequence(s): A189382
;; terms: 1 2 4 5 7 9 10 12 13 15 16 18 20 21 23 24 26 28 29 31
;; small program: 1 + (((((x - (x div (1 + (2 + (2 + 2))))) div (1 + (2 + 2))) + x) div 2) + x)
;; fast program: (((2 * (2 + (2 * (2 * ((x + x) + x))))) div (1 + (2 * (2 * (2 + (2 * (2 + 2))))))) + 1) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (+ (divf (+ (divf (- x (divf x (+ 1 (+ 2 (+ 2 2))))) (+ 1 (+ 2 2))) x) 2) x)))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (divf (* 2 (+ 2 (* 2 (* 2 (+ (+ x x) x))))) (+ 1 (* 2 (* 2 (+ 2 (* 2 (+ 2 2))))))) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
