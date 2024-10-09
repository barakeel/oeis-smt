;; sequence(s): A182772
;; terms: 1 3 4 6 8 9 11 13 14 16 17 19 21 22 24 26 27 29 31 32
;; small program: (((2 * (2 + x)) - ((x div 2) div (1 + (2 + 2)))) div (1 + 2)) + x
;; fast program: (((2 * (2 + x)) - (x div (2 + (2 * (2 + 2))))) div (1 + 2)) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (- (* 2 (+ 2 x)) (divf (divf x 2) (+ 1 (+ 2 2)))) (+ 1 2)) x))))
(assert (forall ((x Int)) (= (fast x) (+ (divf (- (* 2 (+ 2 x)) (divf x (+ 2 (* 2 (+ 2 2))))) (+ 1 2)) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
