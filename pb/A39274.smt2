;; sequence(s): A39274-A102487
;; terms: 0 1 2 3 4 5 6 7 8 9 12 13 14 15 16 17 18 19 20 21
;; small program: (2 * ((x div 2) div (1 + (2 + 2)))) + x
;; fast program: (2 * (x div (2 + (2 * (2 + 2))))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* 2 (divf (divf x 2) (+ 1 (+ 2 2)))) x))))
(assert (forall ((x Int)) (= (fast x) (+ (* 2 (divf x (+ 2 (* 2 (+ 2 2))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
